class AddConvenorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :convenor, :boolean
  end
end
