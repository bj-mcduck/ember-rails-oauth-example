class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :email

      t.timestamps
    end

    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end
