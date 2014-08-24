class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :bookings, counter_cache: true

  validates :price, :name, :description, :user_id, :city, :street, presence: true
  validates_format_of :price, :with => /\A^\d+\.?\d{0,2}\z/
  validates :name, uniqueness: true
  validates :beds, presence: true, numericality: { greater_than: 0 }
  validates_datetime :available_to, after: :available_from
  validates_date :available_from, after: lambda { Date.current }

  scope :most_recent, -> { order("created_at DESC").limit(5) }
  scope :for_user, -> (id) { where(user_id: id) }

  geocoded_by :full_street_address
  after_validation :geocode

  attr_accessor :bookings_count

  def full_street_address
    [street, city].join ','
  end

  def owned_by?(owner)
    user == owner
  end

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
