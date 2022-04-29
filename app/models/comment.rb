class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def to_s
    "on #{created_at.strftime("%Y-%m-%d")}, #{user.username} says: \"#{body}\""
  end
end
