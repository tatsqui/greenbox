require 'csv'
require_relative "movie"
require_relative "rental"
require_relative "date_range"

module GreenBox
  class MovieReserver
    attr_reader :available_movies, :rent_movies, :movies

    def initialize 
      @movies = MovieReserver.load_movies
      @rentals = []
    end

    def available_movies(date_range)
      available_movies = @movies.map { |movie| movie.title }

      currently_rented = @rentals.select { |rental| rental.date_range.overlaps(date_range) }
      unavailable_movies = currently_rented.map { |rental| rental.movie }

      available_movies -= unavailable_movies
      return available_movies
    end

    def rent_movie(movie_title, date_range, customer_name)
      # unless available_movies.include?(movie_title)
      #   raise StandardError, "Movie title: #{movie_title} is currently unavailable at this GreenBox"
      # end

      unless available_movies(date_range).include?(movie_title)
        raise StandardError, "Your requested movie is not reservable for dates: #{date_range}"
      end
        
      @rentals << Rental.new(movie_title, date_range, customer_name)
    end

    private

    def self.load_movies
      all_movies = CSV.read("data/movies.csv", headers: false).map do |line|
        Movie.new(line[0].to_i, line[1], line[2], actors: line[3].split(":"))
      end
      return all_movies
    end
  end
end

# what I learned is that Crazy Rich Asians is in there twice!! Different ID's...
reserver = GreenBox::MovieReserver.new
date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'), Time.parse('2018-08-09'))
reserver.rent_movie('Crazy Rich Asians', date_range, 'Ada Lovelace')

reserver.movies.each do |movie|
  puts movie.title
end

puts "****************************"

available_movies = reserver.available_movies(date_range)

puts available_movies

