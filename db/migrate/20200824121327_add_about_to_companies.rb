class AddAboutToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :about, :text
  end
end
