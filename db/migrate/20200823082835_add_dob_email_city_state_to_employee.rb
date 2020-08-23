class AddDobEmailCityStateToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :dob, :date
    add_column :employees, :email, :string
    add_column :employees, :city, :string
    add_column :employees, :state, :string
  end
end
