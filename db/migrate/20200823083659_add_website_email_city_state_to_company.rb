class AddWebsiteEmailCityStateToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :website, :string
    add_column :companies, :email, :string
    add_column :companies, :city, :string
    add_column :companies, :state, :string
  end
end
