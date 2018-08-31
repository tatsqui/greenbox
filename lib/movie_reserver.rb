require 'csv'

require_relative 'movie'

module GreenBox
  class MovieReserver
    attr_reader :movies, :rentals

    def initialize
      @movies = GreenBox::MovieReserver.load_movies
      @rentals = []
    end

    def available_movies(date_range)
      movies_available = movies.select do |movie|
        movie_rentals = rentals.select do |rental|
          rental.movie.id == movie.id && rental.date_range.overlaps(date_range)
        end
        movie_rentals.empty?
      end
      return movies_available
    end

    def rent_movie(movie_title, date_range, customer)
      matching_movies = movies.select { |movie| movie.title == movie_title }

      matching_movies.each do |movie|
        movie_reservations = rentals.select do |rental|
          rental.movie.id == movie.id && rental.date_range.overlaps(date_range)
        end

        if movie_reservations.empty?
          rental = GreenBox::Rental.new(movie, date_range, customer)
          rentals << rental
          return rental
        end
      end
      raise StandardError, 'Movie not available'
    end

    def self.load_movies
      movies = []

      CSV.read('./data/movies.csv').each do |line|
        id = line[0].to_i
        title = line[1]
        publisher = line[2]
        actors = line[3].split(':')

        movie = Movie.new(id, title, publisher, actors: actors)
        movies << movie
      end
      return movies
    end
  end
end
