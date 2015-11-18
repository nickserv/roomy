require 'roomy/version'

module Roomy
  class World
    attr_accessor :rooms

    PROMPT = "> "

    def initialize(&block)
      @rooms = {}
      instance_eval(&block)
    end

    def enter(room)
      @current = room
      look
    end

    def look
      puts rooms[@current].description
      print PROMPT
    end

    def room(id, &block)
      Room.new(self, id, &block)
    end

    def run
      enter @start

      while input = gets.strip.split(/ /)
        command = input.first ? input.first.intern : nil
        next_room = rooms[@current] ? rooms[@current].neighbors[command] : nil

        if command == :look
          look
        elsif next_room
          enter next_room
        else
          unknown_command
        end
      end
    end

    def start(id)
      @start = id
    end

    def unknown_command
      puts 'Unknown command'
      print PROMPT
    end
  end

  class Room
    def initialize(world, id, &block)
      @world = world
      @id = id
      @neighbors = {}
      world.rooms[id] = self
      instance_eval(&block)
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
