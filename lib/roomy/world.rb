module Roomy
  class World
    attr_reader :rooms

    PROMPT = "> "

    def initialize(&block)
      @rooms = {}
      instance_eval(&block) if block_given?
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

    def start(id = nil)
      return @start if id.nil?

      @start = id
    end

    def unknown_command
      puts 'Unknown command'
      print PROMPT
    end
  end
end
