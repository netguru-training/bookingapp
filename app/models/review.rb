class Review < ActiveRecord::Base
  validates_presence_of :content, :rating, :place_id, :user_id
  validates_uniqueness_of :place_id, scope: :user_id
  validates_numericality_of :place_id, :user_id
  validate :review_author_is_not_place_author

  def review_author_is_not_place_author
    if Place.find(place_id).user_id == user_id
      errors.add(:base, "can't review your own place")
    end
  end

end
