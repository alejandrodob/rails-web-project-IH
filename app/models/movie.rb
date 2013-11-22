class Movie < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :casts
  has_many :people, through: :casts

  validates_presence_of :title
  validates_uniqueness_of :title

  mount_uploader :poster, PosterUploader


  scope :lasts_at_least, ->(n){ where('duration < ?', n) }



end
