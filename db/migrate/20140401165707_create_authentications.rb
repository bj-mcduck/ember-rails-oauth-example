class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :email
      t.string :gender
      t.string :image
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :provider
      t.string :screen_name
      t.string :uid

      t.timestamps
    end
  end
end
