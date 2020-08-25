class Employee < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    has_one_attached :image
    has_many :job_applications
    has_many :jobs, through: :job_applications
end
