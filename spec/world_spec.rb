require 'spec_helper'

describe Roomy::World do
  let(:room_id) { :example_room }
  let(:world) { Roomy::World.new }

  describe '.new' do
    it 'defines an empty rooms Hash' do
      expect(world.rooms).to eq Hash.new
    end

    it 'calls a given block with access to instance state'
  end

  describe '#enter' do
    it 'has tests'
  end

  describe '#look' do
    it 'has tests'
  end

  describe '#room' do
    let(:room) { world.room room_id }

    it 'creates a new room with the given id' do
      expect(room).to be_a Roomy::Room
      expect(room.id).to be room_id
    end

    it 'registers a new room with the given id' do
      room
      expect(world.rooms[:example_room]).to be room
    end

    it 'sets the new room\'s world to the current world' do
      expect(room.world).to be world
    end

    it 'calls a given block with access to instance state'
  end

  describe '#run' do
    it 'has tests'
  end

  describe '#start' do
    it 'gets and sets the start id' do
      world.start room_id
      expect(world.start).to be room_id
    end
  end

  describe '#unknown_command' do
    it 'has tests'
  end
end
