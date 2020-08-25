class Job < ApplicationRecord
belongs_to :company, foreign_key: "company_id"
has_many :job_applications
has_many :employees, through: :job_applications
end
