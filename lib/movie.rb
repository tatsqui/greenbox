module GreenBox
  class Movie
    attr_reader :title, :id, :publisher, :actors

    def initialize(id, title, publisher, actors: [])
      @id = id
      @title = title
      @publisher = publisher
      @actors = actors
    end

    def stars_actor(actor_name)
      return !actors.find { |actor| actor.casecmp(actor_name.upcase) }.nil?
    end
  end
end
