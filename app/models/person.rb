class Person < ActiveRecord::Base
  has_many :casts
  has_many :movies, through: :casts
  Cast::ROLES.each do |role|
    has_many role.downcase.pluralize.to_sym,
      -> { where(casts: { role: role }) },
      through: :casts, source: :movie
  end

  validates_presence_of :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end
end
