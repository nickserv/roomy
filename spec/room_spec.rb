require 'spec_helper'

describe Roomy::Room do
  let(:description) { 'a description' }
  let(:id) { :example_room }
  let(:neighbors) { { north: :neighbor_room } }
  let(:room) { Roomy::Room.new(world, id) }
  let(:world) { Roomy::World.new }

  describe '.new' do
    it 'uses the given world and id' do
      expect(room.world).to be world
      expect(room.id).to be id
    end

    it 'creates an empty neighbors Hash' do
      expect(room.neighbors).to eq Hash.new
    end

    it 'registers the new room in the given world' do
      room
      expect(world.rooms[:example_room]).to be room
    end

    it 'calls a given block with access to instance state'
  end

  describe '#description' do
    it 'gets and sets the description' do
      room.description description
      expect(room.description).to be description
    end
  end

  describe '#neighbors' do
    it 'gets and sets the start id' do
      room.neighbors neighbors
      expect(room.neighbors).to_not be neighbors
      expect(room.neighbors).to eq neighbors
    end
  end
end
