require 'csv'
require_relative "movie"
require_relative "rental"

module GreenBox
  class MovieReserver
    attr_reader :load_movies, :movies

    def initialize 
      @movies = MovieReserver.load_movies
      @rentals = []
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
