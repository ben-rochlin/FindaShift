class Job < ApplicationRecord
belongs_to :company, foreign_key: "company_id"
has_many :job_applications
end
