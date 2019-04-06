require 'csv'

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
      # rentals do not have movie id's, but need to be linked somehow
      # need to remove a single duplicate movie from list of available movies
      
    end

    #function to rent a movie or raise an error that movie is not available/found for specific date range
    def rent_movie(movie_title, date_range, customer_name)
      #finds matching movie objects for a given title
      movie_rented = movies.each { |movie| movie.title == movie_title }

      # for each movie that is already rented, see if it is available for given date range

    private



    def self.load_movies
      all_movies = CSV.read("data/movies.csv", headers: false).map do |line|
        GreenBox::Movie.new id = line[0].to_i, 
                  title = line[1], 
                  publisher = line[2], 
                  actors: line[3].split(":")
      end

      return all_movies
    end
  end
end
