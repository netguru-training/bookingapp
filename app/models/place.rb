class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :bookings, counter_cache: true

  validates :price, :name, :description, :user_id, presence: true
  validates :name, uniqueness: true

  def average_rating
    Review.where(place_id: id).average(:rating)
  end

  scope :most_recent, -> { order("created_at DESC").limit(5) }

  attr_accessor :bookings_count

  def bookings_count
    bookings.count
  end

  def self.most_booked
    Place.all.sort_by{ |place| place.bookings_count }.reverse.first(5)
  end
end
