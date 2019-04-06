require 'csv'

module GreenBox
  class GreenBoxReservationError < StandardError; end
  class MovieReserver
  

    attr_reader :available_movies, :rent_movies, :movies, :rentals

    def initialize 
      @movies = MovieReserver.load_movies
      @rentals = []
    end

    #function to relay what movies are available for specific date range
    def available_movies(date_range)
      all_movies = @movies
      # returns only movies that are not booked on given date range
      # deletes movie from list of movies if it is booked
      # specific to id
      rentals.each do |rental|
        all_movies.delete_if do |movie|
          rental.movie.id == movie.id && rental.date_range.overlaps(date_range)
          end
        end
       
      return all_movies
    end

    #function to rent a movie or raise an error that movie is not available/found for specific date range
    def rent_movie(movie_title, date_range, customer_name)
      #finds matching movie objects for a given title
      movie_request = movies.select { |movie| movie.title == movie_title }

      # raises error when title not found in movies list
      if movie_request.empty?
        raise GreenBoxReservationError.new("Movie does not exist in our database.")
      end

      # for the movie requested, 
      # searches for movie conflicts by date, will not double book a movie
      movie_request.each do |movie|
       movie_rental = @rentals.select do |rental|
          rental.movie.id == movie.id && rental.date_range.overlaps(date_range)
       end
       
       if movie_rental.empty?
        mov_rental = GreenBox::Rental.new(movie, date_range, customer_name)
        rentals << mov_rental
        return mov_rental
       end
      end
      raise GreenBoxReservationError.new("Movie: #{movie_title} not available for given dates: #{date_range}")

    end

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
