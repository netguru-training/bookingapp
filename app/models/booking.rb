class Booking < ActiveRecord::Base
  belongs_to :user 
  belongs_to :place
  validates_presence_of :place_id, :user_id, :date_from, :date_to, :confirmation
  validates_datetime :date_to, :after => :date_from
  validates_date :date_from, :after => lambda { Date.current }
  validates_numericality_of :place_id, :user_id
  
end
