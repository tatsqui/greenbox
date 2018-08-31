require 'csv'

require_relative 'movie'

module GreenBox
  class MovieReserver
    attr_reader :movies, :rentals

    def initialize
      @movies = GreenBox::MovieReserver.load_movies
      @rentals = []
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
