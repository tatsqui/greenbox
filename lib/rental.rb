module GreenBox
  class Rental
    attr_reader

    def initialize movie, date_range, customer_name
      if date_range.start_date >= date_range.end_date
        raise ArgumentError, "Rental period must be atleast 24 hours, given: #{date_range.start_date}, #{date_range.end_date}"
      end
      
      @movie = movie
      @date_range = date_range
      @customer_name = customer_name
    end

    def cost
    end

  end
end
