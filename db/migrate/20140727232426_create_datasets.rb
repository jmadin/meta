class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.references :user, index: true
      t.references :unit, index: true
      t.string :project_name
      t.date :project_date
      t.string :project_location
      t.decimal :latitude
      t.decimal :longitude
      t.text :methods
      t.string :missing_data
      t.text :project_notes

      t.timestamps
    end
  end
end
