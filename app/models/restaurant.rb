class Restaurant < ApplicationRecord
  validates :name, :location, presence: true
  validates :will_split_votes, :will_not_split_votes, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :votes, dependent: :destroy

  def self.search(name: nil, location: nil)
    if !name.nil? && !name.empty?
      if !location.nil? && !location.empty?
        Restaurant.where("name like :name and location like :location", {name: "%#{name}%", location: "%#{location}%"})
      else
        Restaurant.where("name like :name", {name: "%#{name}%"})
      end
    else
      if !location.nil? && !location.empty?
        Restaurant.where("location like :location", {location: "%#{location}%"})
      else
        Restaurant.all
      end
    end
  end

  def get_will_split_votes
    v = votes.to_a.select { |vote| vote.will_split? }
    v.count
  end

  def get_will_not_split_votes
    v = votes.to_a.select { |vote| !vote.will_split? }
    v.count
  end
end
