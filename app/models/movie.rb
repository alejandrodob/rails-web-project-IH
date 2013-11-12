class Movie < ActiveRecord::Base

    has_many :comments

    validates_presence_of :title
    validates_uniqueness_of :title

end
