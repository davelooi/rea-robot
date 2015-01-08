require './spec/spec_helper'

describe Simulator do
  context 'new' do
    it { expect(Simulator.new.class).to eq Simulator }
  end

  describe 'EXAMPLE' do
    context 'A' do
      let!(:eg_a) { './command/example_a.txt' }
      let!(:stdout_output) { "Executing #{eg_a}\nPLACE 0,0,NORTH\nMOVE\nREPORT\n0,1,NORTH\n\n\n" }
      it { expect{described_class.execute(eg_a)}.to output(stdout_output).to_stdout }
    end
    context 'B' do
      let!(:eg_b) { './command/example_b.txt' }
      let!(:stdout_output) { "Executing #{eg_b}\nPLACE 0,0,NORTH\nLEFT\nREPORT\n0,0,WEST\n\n\n" }
      it { expect{described_class.execute(eg_b)}.to output(stdout_output).to_stdout }
    end
    context 'C' do
      let!(:eg_c) { './command/example_c.txt' }
      let!(:stdout_output) { "Executing #{eg_c}\nPLACE 1,2,EAST\nMOVE\nMOVE\nLEFT\nMOVE\nREPORT\n3,3,NORTH\n\n\n" }
      it { expect{described_class.execute(eg_c)}.to output(stdout_output).to_stdout }
    end
  end
end
