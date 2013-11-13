class Person < ActiveRecord::Base
  belongs_to :movie

  validates_presence_of :first_name, :last_name
end
