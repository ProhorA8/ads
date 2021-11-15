class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :photo
      t.integer :user_id
      t.integer :ad_id

      t.timestamps
    end
  end
end
