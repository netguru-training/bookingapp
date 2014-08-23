class Booking < ActiveRecord::Base
  belongs_to :user 
  belongs_to :place
  validates_presence_of :place_id, :user_id, :date_from, :date_to, :confirmation
  validates_datetime :date_to, :after => :date_from
  validates_date :date_from, :after => lambda { Date.current }
  validates_numericality_of :place_id, :user_id
  validate :date_overlap

  def date_overlap
    User.find(user_id).bookings.each do |booking|
      if (booking.date_from..booking.date_to).overlaps?(date_from..date_to)
        errors.add(:base, "you already made a booking on that date")
      end
    end
  end

end
