class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :gender
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
