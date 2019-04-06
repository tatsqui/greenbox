require 'csv'
require_relative "movie"
require_relative "rental"

module GreenBox
  class MovieReserver
    attr_reader

    def initialize movies, rentals
      @movies = movies.load_movies
      @rentals = []
    end



    private

    def self.load_movies
        return CSV.read("data/movies.csv", headers: false).map do |line|
          self.new(line[0].to_i, line[1], line[2], line[3].split(":")
        end
    end
  end
end
