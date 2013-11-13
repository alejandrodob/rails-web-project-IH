class Person < ActiveRecord::Base
  has_many :casts

  validates_presence_of :first_name, :last_name
end
