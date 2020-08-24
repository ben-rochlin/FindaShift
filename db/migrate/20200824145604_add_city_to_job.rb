class AddCityToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :city, :string
    add_column :jobs, :state, :string
  end
end
