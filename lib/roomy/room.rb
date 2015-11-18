module Roomy
  class Room
    attr_reader :world, :id

    def initialize(world, id, &block)
      @world = world
      @id = id
      @neighbors = {}
      world.rooms[id] = self
      instance_eval(&block) if block_given?
    end

    def description(new_description = nil)
      return @description if new_description.nil?

      @description = new_description
    end

    def neighbors(new_neighbors = nil)
      return @neighbors if new_neighbors.nil?

      @neighbors.merge! new_neighbors
    end
  end
end
