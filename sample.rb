require 'roomy'

world = Roomy::World.new do
  start :living_room

  room :living_room do
    neighbors north: :kitchen
    description 'A somewhat dark room with a large, stained carpet. You hear creaks from below the floorboards.'
  end

  room :kitchen do
    neighbors south: :living_room
    description 'An empty, run down kitchen. The floor is wiped so clean as to almost be suspicious.'
  end
end

world.run
