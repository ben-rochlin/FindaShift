class AddSummaryToJobApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :summary, :text
  end
end
