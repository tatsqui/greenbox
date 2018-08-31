require_relative 'spec_helper'

describe GreenBox::MovieReserver do

  describe 'initialization' do
    before do
      @reserver = GreenBox::MovieReserver.new
    end

    it 'can be instantiated' do
      expect(@reserver).must_be_instance_of GreenBox::MovieReserver
    end

    it 'has the proper number of movies' do
      expect(@reserver.movies.length).must_equal 10
    end
  end

  describe 'load_movies' do
    let (:movie_list) { GreenBox::MovieReserver.load_movies }

    it 'loads the right number of movies' do
      expect(movie_list.length).must_equal 10
    end

    it 'loads the 1st movie' do
      first_movie = movie_list.first

      expect(first_movie.title).must_equal 'Green Lantern'
      expect(first_movie.id).must_equal 1
      expect(first_movie.publisher).must_equal 'Fox'
    end

    it 'loads the last movie' do
      first_movie = movie_list.last

      expect(first_movie.title).must_equal 'E.T. The Extra-Terrestrial'
      expect(first_movie.id).must_equal 10
      expect(first_movie.publisher).must_equal 'Universal'
    end

    it 'loads the right actors' do
      first_movie = movie_list.first

      expect(first_movie.actors).must_include 'Blake Lively'

      last_movie = movie_list.last

      expect(last_movie.actors).must_include 'Dee Wallace'
    end
  end
end
