class AddCategoryToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :category, index: true
  end
end
