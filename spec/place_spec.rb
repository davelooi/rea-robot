require './place'

describe Place do
  context 'new default' do
    let!(:place) { Place.new }

    it { expect(place.class).to eq Place }
    it { expect(place.coordinate).to eq [0,0] }
    it { expect(place.direction).to eq "NORTH" }
  end

  context 'new with param' do
    let!(:place) { Place.new(2,3,"EAST") }

    it { expect(place.coordinate).to eq [2,3] }
    it { expect(place.direction).to eq "EAST" }
  end
end
