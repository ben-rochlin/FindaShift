class AddToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :title, :string
    add_column :jobs, :description, :text
    add_reference :jobs, :company, foreign_key: true
  end
end
