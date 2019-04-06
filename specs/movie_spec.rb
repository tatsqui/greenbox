require_relative 'spec_helper'

describe 'GreenBox::Movie' do
  let (:movie) { GreenBox::Movie.new(3, 'Green Lantern',
                               'Fox',
                               actors: ['Ryan Reynolds', 'Blake Lively']) }

  describe 'initialization' do

    it 'can be instantiated' do
      expect(movie).must_be_instance_of GreenBox::Movie
    end

    it 'can be instantiated without actors' do
      movie = GreenBox::Movie.new(3, 'Green Lantern', 'Fox')
      expect(movie).must_be_instance_of GreenBox::Movie
      expect(movie.actors).must_equal []
    end

    it 'has a title' do
      expect(movie.title).must_equal 'Green Lantern'
    end

    it 'has the correct id' do
      expect(movie.id).must_equal 3
    end

    it 'has the correct publisher' do
      expect(movie.publisher).must_equal 'Fox'
    end

    it 'must have the proper actors' do
      expect(movie.actors).must_equal ['Ryan Reynolds', 'Blake Lively']
    end
  end

  describe 'stars_actor' do
    it 'returns true if the movie does feature the actor' do
      expect(movie.stars_actor('Ryan Reynolds')).must_equal true
    end

    it 'returns false if the movie does feature the actor' do
      expect(movie.stars_actor('Ryan Seacrest')).must_equal false
    end

    it 'returns false if the movie does feature any actors' do
      movie = GreenBox::Movie.new(3, 'Green Lantern', 'Fox')
      expect(movie.stars_actor('Ryan Reynolds')).must_equal false
    end
  end
end
