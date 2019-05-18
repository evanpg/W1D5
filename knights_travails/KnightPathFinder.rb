require "PolyTreeNode.rb"
class KnightPathFinder
  def initialize(starting_pos)
    @starting_pos = starting_pos
    @considered_positions = [starting_pos]
    build_move_tree(starting_pos)
  end
  
  def build_move_tree(pos)

   pos_node = PolyTreeNode.new(pos)
   q = [pos_node]
    until q.empty?
      node = q.pop
      next_positions = new_move_positions(node.value)
      q = node.children.reverse + q
      if node.value == target_value
        return node
      end
    end
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
    memo = KnightPathFinder.valid_moves.reject{|ele| @considered_positions.include?(ele)}
    @considered_positions += memo
    memo
  end



  #instance = KnightPathFinder.new([4,4])
 print  KnightPathFinder.valid_moves([1,4])









end