require 'time'

module GreenBox
  class DateRange
    attr_reader :start_date, :end_date, :nights

    def initialize(start_date, end_date)
      raise ArgumentError, "Given start: #{start_date}, end: #{end_date} " if end_date < start_date 

      @start_date = start_date
      @end_date = end_date
    end

    #returns true if a date is within another date range
    def contains(date)
      return (start_date...end_date).include?(date) # not inclusive of last day
    end

    # returns true if a date overlaps
    def overlaps(other)
      return start_date < other.end_date && end_date >= other.start_date # overlap not inclusive of last day
    end

    # accurate count of rental nights
    def nights
      return ((end_date - start_date) / 86400).to_i
    end

  end
end

