class AddAvatarColumnsToPhotos < ActiveRecord::Migration
  def change
    add_attachment :photos, :photograph
  end
end
