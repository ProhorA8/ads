class DropPhotosTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :photos
  end
end
