class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.text :about

      t.timestamps
    end
  end
end
