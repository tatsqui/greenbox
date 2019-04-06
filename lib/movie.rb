module GreenBox
  class Movie
    attr_reader :id, :title,  :publisher, :actors

    def initialize(id, title, publisher, actors: nil)
      @id = id
      @title = title
      @publisher = publisher
      @actors = actors ||= []
    end

  end
end
