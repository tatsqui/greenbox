module GreenBox
  class Movie
    attr_reader :id, :title,  :publisher, :actors

    def initialize(id, title, publisher, actors: nil)
      @id = id
      @title = title
      @publisher = publisher
      @actors = actors ||= []
    end

    def stars_actor(actor_name)
      return @actors.include?(actor_name)
    end

  end
end
