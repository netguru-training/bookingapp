class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :bookings
  has_many :places
  has_many :reviews

  def is_owner?(booking)
    booking.user == self
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = user.password
      user.email = auth.info.email
      binding.pry
      user.save
    end
  end
end
