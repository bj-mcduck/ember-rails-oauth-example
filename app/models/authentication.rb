class Authentication < ActiveRecord::Base
  attr_accessor :omniauth_hash
  belongs_to :user

  validates :uid, uniqueness: true, presence: true

  PROVIDERS = [ :twitter, :google_oauth2, :facebook ]

  class << self
    def find_by_omniauth(auth)
      where( auth.slice(:provider, :uid) ).first
    end

    def create_from_omniauth(options, user_id)
      authentication = Authentication.new
      authentication.provider = options[:provider]
      authentication.uid      = options[:uid]
      authentication.user_id  = user_id

      set_extra_fields( options, authentication )
      authentication.save
      authentication
    end

    def set_extra_fields(options, authentication)
      case options[:provider]
      when 'facebook'
        authentication.email    = options[:extra][:raw_info][:email]
        authentication.gender   = options[:extra][:raw_info][:gender]
        authentication.image    = options[:info][:image]
        authentication.full_name     = options[:extra][:raw_info][:name]
        authentication.screen_name = options[:extra][:raw_info][:username]

      when 'google_oauth2'
        authentication.email    = options[:extra][:raw_info][:email]
        authentication.gender   = options[:extra][:raw_info][:gender]
        authentication.image    = options[:extra][:raw_info][:picture]
        authentication.full_name     = options[:extra][:raw_info][:name]
        # Has no username

      when 'twitter'
        authentication.full_name     = options[:extra][:raw_info][:name]
        authentication.image    = options[:extra][:raw_info][:profile_image_url_https]
        authentication.screen_name = options[:extra][:raw_info][:screen_name]
        # Has no gender
        # Has no email

      end
    end
  end
end
