class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :employee

  has_many :users, through: :employees
end
