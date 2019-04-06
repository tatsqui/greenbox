require_relative 'spec_helper'

MOVIES_IN_CSV = 11

describe 'GreenBox::MovieReserver' do
  let (:reserver) { GreenBox::MovieReserver.new }
  let (:date_range) { GreenBox::DateRange.new(Time.parse('2018-08-08'), Time.parse('2018-08-09')) }

  describe 'initialization' do

    it 'can be instantiated' do
      expect(reserver).must_be_instance_of GreenBox::MovieReserver
    end

    it 'has the proper number of movies' do
      expect(reserver.movies.length).must_equal MOVIES_IN_CSV
    end
  end

  describe 'load_movies' do
    let (:movie_list) { GreenBox::MovieReserver.load_movies }

    it 'loads the right number of movies' do
      expect(movie_list.length).must_equal MOVIES_IN_CSV
    end

    it 'loads the 1st movie' do
      first_movie = movie_list.first

      expect(first_movie.title).must_equal 'Green Lantern'
      expect(first_movie.id).must_equal 1
      expect(first_movie.publisher).must_equal 'Fox'
    end

    it 'loads the last movie' do
      last_movie = movie_list.last

      expect(last_movie.title).must_equal 'Crazy Rich Asians'
      expect(last_movie.id).must_equal 11
      expect(last_movie.publisher).must_equal 'Warner Bros'
    end

    it 'loads the right actors' do
      first_movie = movie_list.first

      expect(first_movie.actors).must_include 'Blake Lively'

      last_movie = movie_list.last

      expect(last_movie.actors).must_include 'Constance Wu'
    end
  end

  describe 'movies available' do

    it 'will list the available movies' do
      available_movies = reserver.available_movies(date_range)

      expect(available_movies.length).must_equal 11
    end

    it 'will not include rented movies' do
      date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'), Time.parse('2018-08-09'))
      reserver.rent_movie('Crazy Rich Asians', date_range, 'Ada Lovelace')

      available_movies = reserver.available_movies(date_range)
      expect(available_movies.length).must_equal 10

      movie_id = 2
      movie_id_2 = available_movies.find do |movie|
        movie.id == movie_id
      end

      expect(movie_id_2).must_be_nil
    end
  end

  xdescribe 'rent_movie' do
    it 'returns a rental for a successfully rented movie' do
      # TODO Your Code goes here


    end

    it 'can rent multiple movies with the same title' do
      # TODO Your Code goes here


    end

    xit 'cannot rent a movie already rented' do
      # TODO Your Code goes here


    end

    xit 'raises an error if a movie is requested that does not appear in the list' do
      # TODO Your Code goes here

    end
  end
end
