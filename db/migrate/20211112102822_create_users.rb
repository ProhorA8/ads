class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :role
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
