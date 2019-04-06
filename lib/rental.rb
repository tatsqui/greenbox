module GreenBox
  class Rental
    attr_reader :movie, :date_range, :customer_name
    DAILY_RATE = 3.00

    def initialize movie, date_range, customer_name
      if date_range.start_date >= date_range.end_date
        raise ArgumentError, "Rental period must be at least 24 hours, given: #{date_range.start_date}, #{date_range.end_date}"
      end
      
      @movie = movie
      @date_range = date_range
      @customer_name = customer_name
    end

    def cost
      return date_range.nights * DAILY_RATE
    end

  end
end
