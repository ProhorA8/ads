class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :type_ad
      t.string :life_cycle
      t.integer :user_id

      t.timestamps
    end
  end
end
