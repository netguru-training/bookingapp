class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  validates_presence_of :content, :rating, :place_id, :user_id
  validates_uniqueness_of :place_id, scope: :user_id
  validates :place_id, :user_id, numericality: { only_integer: true }
  validate :review_author_is_not_place_author
  validates :rating, numericality: { less_than: 6, greater_than_or_equal_to: 0 }

  def review_author_is_not_place_author
    if Place.find(place_id).user_id == user_id
      errors.add(:base, "can't review your own place")
    end
  end

end
