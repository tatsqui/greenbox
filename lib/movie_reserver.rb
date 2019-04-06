require 'csv'
require_relative "movie"
require_relative "rental"

module GreenBox
  class MovieReserver
    attr_reader :available_movies, :rent_movies, :movies

    def initialize 
      @movies = MovieReserver.load_movies
      @rentals = []
    end

    def available_movies(date_range)
      available_movies = @movies.map { |movie| movie.title }

      currently_rented = @rentals.select { |rental| rental.overlaps(date_range) }
      unavailable_movies = currently_rented.map { |rental| rental.movie }

      available_movies -= unavailable_movies
      return available_movies
    end

    def rent_movie(movie_title, date_range, customer_name)
      unless @movies.include?(movie_title)
        raise StandardError, "Movie title: #{movie_title} is currently unavailable at this GreenBox"
      end

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
