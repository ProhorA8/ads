class RemoveAdIdFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :ad_id, :integer
  end
end
