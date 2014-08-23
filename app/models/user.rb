class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  has_many :bookings
  has_many :places
  has_many :reviews

  def is_owner?(booking)
    booking.user ==self
  end
end
