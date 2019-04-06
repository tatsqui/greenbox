require 'time'
require_relative 'spec_helper'

describe 'GreenBox::Rental' do
  let (:date_range) do
    GreenBox::DateRange.new(Time.parse('2018-08-09'), Time.parse('2018-08-11'))
  end

  let (:movie) { GreenBox::Movie.new(1, 'Green Lantern', 'Fox') }

  describe 'initialization' do
    let(:rental) { GreenBox::Rental.new(movie, date_range, 'Ada Lovelace') }

    it 'can be instantiated' do
      expect(rental).must_be_instance_of GreenBox::Rental
    end

    it 'raises an ArgumentError for illegal Date range' do
      date_range = GreenBox::DateRange.new(Time.parse('2018-08-09'), Time.parse('2018-08-09'))
      expect do
        GreenBox::Rental.new(movie, date_range, 'Ada Lovelace')
      end.must_raise ArgumentError
    end
  end

  xdescribe 'cost' do
    it 'calculates the cost for a rental' do
      rental = GreenBox::Rental.new(movie, date_range, 'Ada Lovelace')

      expect(rental.cost).must_be_close_to 3 * 2, 0.01
    end
    it 'calculates the cost for a 1-day rental' do
      new_date_range = GreenBox::DateRange.new(Time.parse('2018-08-09'), Time.parse('2018-08-10'))
      rental = GreenBox::Rental.new(movie, new_date_range, 'Ada Lovelace')

      expect(rental.cost).must_be_close_to 3 * 1, 0.01
    end
  end
end
