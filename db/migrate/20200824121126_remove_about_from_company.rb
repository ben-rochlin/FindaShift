class RemoveAboutFromCompany < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :About, :text
  end
end
