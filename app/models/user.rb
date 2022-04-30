class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates :username, uniqueness: true

  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favorites
  has_many :restaurants, through: :favorites

  def favorited? restaurant_id
    restaurants.include? restaurant_id
  end
end
