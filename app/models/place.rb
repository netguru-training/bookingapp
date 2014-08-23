class Place < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :price, :name, :description, presence: true

end
