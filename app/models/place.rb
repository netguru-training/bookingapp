class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :bookings, counter_cache: true

  validates :price, :name, :description, :user_id, presence: true
  validates :name, uniqueness: true

  scope :most_recent, -> { order("created_at DESC").limit(5) }

  attr_accessor :bookings_count

  def average_rating
    Review.where(place_id: id).average(:rating)
  end

  def bookings_count
    bookings.count
  end

  def self.most_booked
    Place.all.sort_by{ |place| place.bookings_count }.reverse.first(5)
  end

  def self.owned_by_user(user)
    Place.find_by(user: user)
  end

  def self.rented_by_user(user)
    Booking.find_by(user: user).where(place: self.id)
  end
end
