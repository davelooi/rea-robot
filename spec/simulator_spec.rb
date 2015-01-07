require './simulator'

describe Simulator do
  context 'new' do
    it { expect(Simulator.new.class).to eq Simulator }
  end

  describe 'EXAMPLE' do
    context 'A' do
      let!(:eg_a) { './command/a.txt' }
      it { expect{described_class.execute(eg_a)}.to output("Executing #{eg_a}\nResult 0,1,NORTH\n").to_stdout }
    end
    context 'B' do
      let!(:eg_b) { './command/b.txt' }
      it { expect{described_class.execute(eg_b)}.to output("Executing #{eg_b}\nResult 0,0,WEST\n").to_stdout }
    end
    context 'C' do
      let!(:eg_c) { './command/c.txt' }
      it { expect{described_class.execute(eg_c)}.to output("Executing #{eg_c}\nResult 3,3,NORTH\n").to_stdout }
    end
  end
end
