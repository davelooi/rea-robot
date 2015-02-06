require './spec/spec_helper'

describe Grid do
  let!(:grid) { Grid.new }

  it { expect(grid.obstacles.class).to eq Set }
  it { expect(grid.obstacles.count).to eq 0 }

  describe 'place obstacles' do
    before do
      grid.place_obstacle(1,1)
    end

    it 'should add a new obstacle to grid' do
      expect(grid.obstacles.count).to eq 1
    end

    it 'should not add duplicate obstacle' do
      grid.place_obstacle(1,1)
      expect(grid.obstacles.count).to eq 1
    end

    it 'should add different obstacle' do
      grid.place_obstacle(2,2)
      expect(grid.obstacles.count).to eq 2
    end

    it 'should raise error if object is placed out of bound' do
      expect{ grid.place_obstacle(5,5) }.to raise_error(ArgumentError)
    end
  end

  describe 'check for object in specific coordinate' do
    before do
      grid.place_obstacle(1,1)
      grid.place_obstacle(2,2)
    end

    it 'should return true if obstacle exist in the coordinate' do
      expect(grid.obstacle_exist?(1,1)).to eq true
      expect(grid.obstacle_exist?(2,2)).to eq true
    end
  end

  describe 'map' do
    context 'no obstacles' do
      let!(:map_without_obstacles) {[
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
      ]}
      it { expect(grid.map_of_obstacles).to eq map_without_obstacles }
      it { expect(grid.prt_map).to eq "ooooo\nooooo\nooooo\nooooo\nooooo\n"}
    end

    context 'map with some obstacles' do
      before do
        grid.place_obstacle(1,1)
        grid.place_obstacle(2,2)
      end
      let!(:map_with_obstacles) {[
        [0,0,0,0,0],
        [0,1,0,0,0],
        [0,0,1,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
      ]}
      it { expect(grid.map_of_obstacles).to eq map_with_obstacles }
      it { expect(grid.prt_map).to eq "ooooo\nooooo\nooxoo\noxooo\nooooo\n"}
    end
  end
end
