class KnightPathFinder
  def initialize(starting_pos)
    @considered_positions = [starting_pos]
    build_move_tree(starting_pos)
  end
  
  def build_move_tree
  end
  
  def self.valid_moves(pos)
#    if num in pos < 0 or > 7 return false

    result  = []
    row_changes = [-1,1]  

    col_changes =[-1, 1]
    for long_leg in row_changes
      for short_leg in col_changes
        new_pos = [long_leg * 2 + pos[0],  pos[1] +short_leg ]
        result << new_pos if new_pos.all?{|coord| coord<=7 && coord >=0}
      end
    end
    for short_leg in row_changes
      for long_leg in col_changes
        new_pos = [pos[0] + short_leg, long_leg * 2 + pos[1] ]
         result << new_pos if new_pos.all?{|coord| coord<=7 && coord >=0}
      end
    end
    result
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves.reject{|ele| @considered_positions.include?(ele)}
  end

  #instance = KnightPathFinder.new([4,4])
 print  KnightPathFinder.valid_moves([1,4])









end