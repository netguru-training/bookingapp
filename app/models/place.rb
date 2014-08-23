class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :price, :name, :description, :user_id, presence: true
  
  def average_rating
    Review.where(place_id: id).average(:rating)
  end
end
