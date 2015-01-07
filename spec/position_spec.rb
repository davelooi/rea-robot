require './position'

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
end