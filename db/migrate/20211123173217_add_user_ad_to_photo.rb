class AddUserAdToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :user, index: true, foreign_key: true
    add_reference :photos, :ad, index: true, foreign_key: true
  end
end
