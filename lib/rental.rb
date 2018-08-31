module GreenBox
  class Rental
    attr_reader :movie, :date_range, :customer

    def initialize(movie, date_range, customer)
      @movie = movie
      @date_range = date_range
      @customer = customer
      @cost = 3
    end

    def cost
      return @cost * self.date_range.nights
    end
  end
end
