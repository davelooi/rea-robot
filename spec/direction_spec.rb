require './direction'

describe Direction do
  context 'new' do
    let!(:direction) { Direction.new }

    it { expect(direction.class).to eq Direction }
    it { expect(direction.to_s).to eq "NORTH" }
  end
  context 'new with param' do
    let!(:direction) { Direction.new("EAST") }

    it { expect(direction.to_s).to eq "EAST" }
  end
  context 'new with invalid param' do
    it 'should raise ArgumentError' do
      expect { Direction.new("SOUTHEAST") }.to raise_error(ArgumentError)
    end
  end
end