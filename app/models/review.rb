class Review < ActiveRecord::Base
  validates_presence_of :content, :rating, :place_id, :user_id
  validates_uniqueness_of :place_id, scope: :user_id
  validates_numericality_of :place_id, :user_id

end
