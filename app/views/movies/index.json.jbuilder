json.array!(@movies) do |movie|
  json.extract! movie, :title, :year, :duration, :genres, :synopsis
  json.url movie_url(movie, format: :json)
end
