module GreenBox
  class Rental
    attr_reader :movie, :date_range, :customer
    DAILY_COST = 3.0

    def initialize(movie, date_range, customer)
      raise ArgumentError, "Illegal Date Range" if date_range.nights < 1
      @movie = movie
      @date_range = date_range
      @customer = customer
      @cost = DAILY_COST
    end

    def cost
      return @cost * self.date_range.nights
    end
  end
end
