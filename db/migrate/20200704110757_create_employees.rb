class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, index: true
      t.integer :age
      t.integer :gender, index: true
      t.string :designation, index: true

      t.timestamps
    end
  end
end
