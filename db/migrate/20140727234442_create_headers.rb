class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.references :dataset, index: true
      t.string :header_name
      t.string :header_unit
      t.text :header_notes

      t.timestamps
    end
  end
end
