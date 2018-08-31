require 'time'

module GreenBox
  class DateRange
    attr_reader :start_date, :end_date

    def initialize(start_date, end_date)
      raise ArgumentError, 'Start Date is after End Date' if start_date > end_date

      @start_date = start_date
      @end_date = end_date
    end

    def overlaps(other_date)
      return self.start_date <= other_date.end_date &&
             self.end_date >= other_date.start_date
    end

    def contains(date)
      return date >= start_date && date < end_date
    end

    def nights
      return end_date - start_date
    end
  end
end
