class AddDataToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :data, :text
  end
end
