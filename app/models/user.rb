class User < ActiveRecord::Base
  has_many :authentications
  has_one :identity
  has_one :profile
  has_many :dream_symbols
  has_many :interpretations

  validates :screen_name, uniqueness: true

  accepts_nested_attributes_for :profile

  class << self
    def add_omniauth_to_user(auth, user)
      user.authentications.create_from_omniauth(auth, user.id)
    end

    def create_from_omniauth(auth)
      user = User.create!
      profile = Profile.create! user_id: user.id
      authentication = user.authentications.create_from_omniauth(auth, user.id)
      set_user_fields(user, authentication)

      profile.set_fields(
        first_name: authentication.first_name,
        last_name: authentication.last_name,
        full_name: authentication.full_name,
        gender: authentication.gender,
        image: authentication.image )

      user
    end

    def find_by_identity(auth)
      if auth['provider'] == 'identity'
        identity = Identity.find_by( screen_name: auth['name'] ) || Identity.find_by( email: auth['email'] )
      end
      identity.user ? identity.user : nil
    end

    def find_by_omniauth(auth)
      authentication = Authentication.find_by_omniauth(auth)
      authentication ? authentication.user : nil
    end

    def from_omniauth(auth)
      find_by_omniauth(auth) || create_from_omniauth(auth)
    end

    def set_user_fields(user, authentication)
      user_gets_updated = user.screen_name.nil? || user.email.nil?
      user.screen_name = authentication.screen_name if user.screen_name.nil? && authentication.screen_name
      user.email = authentication.email if user.email.nil? && authentication.email
      user.save if user_gets_updated
    end
  end
end
