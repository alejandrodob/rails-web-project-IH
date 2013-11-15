require 'json'
require 'pry'


def create_movie_from_json json
  Movie.create title: json["Title"], duration: to_min(json["Runtime"]), year: json["Year"], synopsis: json["Plot"]
end

def load_movies_from_file(file)
  File.foreach(file) do |l|
    unless l.blank?
      json = JSON.parse(l)
      create_movie_from_json(json)
    end
  end
end

def load_default_file
  current_dir = File.dirname(__FILE__)
  file = File.join(current_dir, 'jw.json')
  load_movies_from_file file
end

def to_min(time)
  time = time.split(%r{\D+})
  if time.length < 1
    time[0]
  else
    time[0].to_i * 60 + time[1].to_i
  end
end