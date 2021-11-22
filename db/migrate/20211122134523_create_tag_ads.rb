class CreateTagAds < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_ads do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :ad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
