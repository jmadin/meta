class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :student_number
      t.string :email

      t.timestamps
    end
  end
end
