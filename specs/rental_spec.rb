require 'time'
require_relative 'spec_helper'

describe GreenBox::Rental do
  let (:date_range) do
    GreenBox::DateRange.new(Time.parse('2018-08-09'), Time.parse('2018-08-11'))
  end

  let (:movie) { GreenBox::Movie.new(1, 'Green Lantern', 'Fox') }

  describe 'initialization' do
    let(:rental) { GreenBox::Rental.new(movie, date_range, 'Ada Lovelace') }

    it 'can be instantiated' do
      expect(rental).must_be_instance_of GreenBox::Rental
    end
  end

  describe 'cost' do
    it 'calculates the cost for a rental' do
      rental = GreenBox::Rental.new(movie, date_range, 'Ada Lovelace')

      expect(rental.cost).must_be_close_to 3 * 2, 0.01
    end
  end
end
