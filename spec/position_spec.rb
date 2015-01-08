require './spec/spec_helper'

describe Position do
  context 'new' do
    let!(:position) { Position.new }

    it { expect(position.class).to eq Position }
    it { expect(position.coordinate).to eq [0,0] }
  end
  context 'new with param' do
    let!(:position) { Position.new(1,2) }

    it { expect(position.coordinate).to eq [1,2] }
  end
  context 'new with invalid param' do
    it 'should raise ArgumentError' do
      expect { Position.new(5,6) }.to raise_error(ArgumentError)
    end
  end

  describe 'non-boundary move' do
    let!(:position) { Position.new(1,1) }
    context 'north' do
      it { expect(position.move_north.coordinate).to eq [1,2] }
    end
    context 'east' do
      it { expect(position.move_east.coordinate).to eq [2,1] }
    end
    context 'south' do
      it { expect(position.move_south.coordinate).to eq [1,0] }
    end
    context 'west' do
      it { expect(position.move_west.coordinate).to eq [0,1] }
    end
  end

  describe 'boundary non-move' do
    context 'north' do
      let!(:position) { Position.new(1,4) }
      it { expect(position.move_north.coordinate).to eq [1,4] }
    end
    context 'east' do
      let!(:position) { Position.new(4,2) }
      it { expect(position.move_east.coordinate).to eq [4,2] }
    end
    context 'south' do
      let!(:position) { Position.new(2,0) }
      it { expect(position.move_south.coordinate).to eq [2,0] }
    end
    context 'west' do
      let!(:position) { Position.new(0,4) }
      it { expect(position.move_west.coordinate).to eq [0,4] }
    end
  end
end
