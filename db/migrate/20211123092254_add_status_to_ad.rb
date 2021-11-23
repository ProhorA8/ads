class AddStatusToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :status, :string
  end
end
