require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_mover_mark = get_next_mark

    positions = [[0,0],[0,1],[0,2][1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
    positions.each do |pos|
      unless @board[pos]
        new_board = @board.dup
        new_board[pos] = child_mover_mark
        new_node = TicTacToeNode.new(new_board, child_mover_mark, pos)
      end
    end
  end

  def get_next_mark
    @next_mover_mark == :x ? :o : :x
  end
end
