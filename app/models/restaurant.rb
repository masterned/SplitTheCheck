class Restaurant < ApplicationRecord
    validates :name, :location, presence: true
    validates :will_split_votes, :will_not_split_votes, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
end
