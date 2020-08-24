class Company < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    has_one_attached :logo
end
