require 'time'
require_relative 'spec_helper'


describe 'GreenBox::DateRange' do

  describe 'initialization' do
    it 'can be created' do
      date_range = GreenBox::DateRange.new(Time.parse('2018-08-08'),
                                           Time.parse('2018-08-09'))
      expect(date_range).must_be_instance_of GreenBox::DateRange
    end

    it 'raises an exception if the end date is before the start date' do
      expect do
        GreenBox::DateRange.new(Time.parse('2018-08-09'),
                                Time.parse('2018-08-08'))
      end.must_raise ArgumentError
    end
  end

  describe 'overlaps' do

    it "returns true if two DateRange objects overlap, one date's start date inside another" do
      date_1 = GreenBox::DateRange.new(Time.parse('2018-08-01'),
                                           Time.parse('2018-08-09'))
      date_2 = GreenBox::DateRange.new(Time.parse('2018-08-08'),
                                           Time.parse('2018-08-14'))

      expect(date_1.overlaps(date_2)).must_equal true
      expect(date_2.overlaps(date_1)).must_equal true
    end

    it 'returns true if two DateRange objects overlap, one inside another' do
      date_1 = GreenBox::DateRange.new(Time.parse('2018-08-01'),
                                           Time.parse('2018-08-09'))
      date_2 = GreenBox::DateRange.new(Time.parse('2018-08-03'),
                                           Time.parse('2018-08-06'))

      expect(date_1.overlaps(date_2)).must_equal true
      expect(date_2.overlaps(date_1)).must_equal true
    end

    it 'returns false if one date range is before the other' do
      date_1 = GreenBox::DateRange.new(Time.parse('2018-08-01'),
                                           Time.parse('2018-08-05'))
      date_2 = GreenBox::DateRange.new(Time.parse('2018-08-06'),
                                           Time.parse('2018-08-08'))

      expect(date_1.overlaps(date_2)).must_equal false
      expect(date_2.overlaps(date_1)).must_equal false
    end
  end

  describe 'contains' do
    let (:date_range) do
      GreenBox::DateRange.new(Time.parse('2018-08-01'),
                              Time.parse('2018-08-05'))
    end

    it 'returns true, if the DateRange contains the date' do
      expect(date_range.contains(Time.parse('2018-08-01'))).must_equal true
      expect(date_range.contains(Time.parse('2018-08-04'))).must_equal true
    end

    it 'returns false, if the DateRange does not contain the date' do
      expect(date_range.contains(Time.parse('2018-07-31'))).must_equal false
      expect(date_range.contains(Time.parse('2018-08-05'))).must_equal false
    end
  end

  describe 'nights' do
    let (:date_range) do
      GreenBox::DateRange.new(Time.parse('2018-08-01'),
                              Time.parse('2018-08-05'))
    end

    it 'returns an accurate count' do
      expect(date_range.nights).must_equal 4
    end

  end
end
