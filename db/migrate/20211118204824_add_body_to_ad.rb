class AddBodyToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :body, :text
  end
end
