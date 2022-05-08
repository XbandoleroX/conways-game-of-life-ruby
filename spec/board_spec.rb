require 'board'

RSpec.describe Board do
  describe '.new' do
    let(:board) { class_double('Board') }
    
    context 'instantiate a new Board object' do
      context 'with missing params' do
        # let(:board_double) { board.new }
        it 'default internal params' do 
          expect(board).to receive(:new).with(no_args).once
          board.new
        end
        it 'with missing params' do 
          expect(board).to receive(:new).with(instance_of(Integer),instance_of(Integer)).once
          board.new(100,50)
        end
      end
      context 'with valid params' do
        it '' do 
          expect(board).to receive(:new).with(instance_of(Integer),instance_of(Integer),instance_of(Integer)).once
          board.new(100,50,100)
        end
      end
    end
  end

  describe '.step' do
    before(:all) {
      @board = Board.new()
    }
    
    it 'returns true' do
      expect(@board.step).to be_truthy
    end
    it 'updates the current state of the matrix' do
      expect { @board.step }.to change { @board.matrix }
      expect { @board.step }.to change { @board.next_gen }
    end
    it 'update the state of next_gen' do
      @board.step
      expect(@board.matrix).not_to be eq(@board.next_gen)
    end
  end

  describe '.show_matrix' do
    xit 'display the first state' 
  end
end