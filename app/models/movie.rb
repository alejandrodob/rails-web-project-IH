class Movie < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :casts
  has_many :people, through: :casts

=begin
  Cast::ROLES.each do |role|
    has_many role.downcase.pluralize.to_sym,
      -> { where(casts: { role: role }) },
      through: :casts, source: :person
  end
=end

=begin Forma equivalente
  has_many :directors, -> { where(casts: {role: 'Director'}) }, through: :casts, source: :person
  has_many :actors, -> { where(casts: {role: 'Actor'}) }, through: :casts, source: :person
  has_many :productors, -> { where(casts: {role: 'Productor'}) }, through: :casts, source: :person
  has_many :makeupers, -> { where(casts: {role: 'Make up'}) }, through: :casts, source: :person
=end

#=begin Otra forma equivalente
  def self.role_relation role
    has_many role.downcase.pluralize.to_sym,
      -> { where(casts: { role: role }) },
      through: :casts, source: :person
  end
  role_relation 'Director'
  role_relation 'Actor'
  role_relation 'Productor'
  role_relation 'Makeup'
#=end


  validates_presence_of :title
  validates_uniqueness_of :title

  mount_uploader :poster, PosterUploader


  scope :lasts_at_least, ->(n){ where('duration < ?', n) }
  scope :directed_by, ->(person){ joins(:casts).where(casts: {role: 'Director', person_id: person}) }



end
