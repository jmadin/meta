class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :user, index: true
      t.string :unit_name
      t.string :unit_code
      t.text :unit_description

      t.timestamps
    end
  end
end
