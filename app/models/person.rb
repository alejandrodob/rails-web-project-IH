class Person < ActiveRecord::Base
  has_many :casts
  has_many :movies, through: :casts

  validates_presence_of :first_name, :last_name
end
