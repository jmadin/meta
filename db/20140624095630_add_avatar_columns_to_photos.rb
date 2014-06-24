class AddAvatarColumnsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photograph, :attachment
  end
end
