class Cast < ActiveRecord::Base
  belongs_to :movie
  belongs_to :person

  validate :unique?

  ROLES = [ "Actor", "Director", "Productor", "Make up"]

  private

  def unique?
    if Cast.where(movie: movie, person: person, role: role).count > 0
      errors.add(:role, "this cast has already been assigned")
    end
  end

end
