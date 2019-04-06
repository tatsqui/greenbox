require 'csv'
require_relative "movie"
require_relative "rental"
require_relative "date_range"

module GreenBox
  class MovieReserver
    attr_reader :available_movies, :rent_movies, :movies, :rentals

    def initialize 
      @movies = MovieReserver.load_movies
      @rentals = []
    end

    #function to relay what movies are available for specific date range
    def available_movies(date_range)
      # loop through movies array and select a rental whose movie id matches a 
      # movie id in list of movies. id is important because there is a duplicate.
      # rentals do not have movie id's... only movie titles as strings...
    end

    #function to rent a movie or raise an error that movie is not available/found for specific date range
    def rent_movie(movie_title, date_range, customer_name)
      #finds matches for a specific movie title
      movie_request = movies.select do |movie|
        movie.title == movie_title
      end

      #eventually add successful rental to array of rentals
      rentals << Rental.new(movie_title, date_range, customer_name)
    end

    private



    def self.load_movies
      all_movies = CSV.read("data/movies.csv", headers: false).map do |line|
        Movie.new id = line[0].to_i, 
                  title = line[1], 
                  publisher = line[2], 
                  actors: line[3].split(":")
      end

      return all_movies
    end
  end
end
