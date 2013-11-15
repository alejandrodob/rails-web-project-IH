class Cast < ActiveRecord::Base
  belongs_to :movie
  belongs_to :person

  ROLES = [ "Actor", "Director", "Productor", "Make up"]
end
