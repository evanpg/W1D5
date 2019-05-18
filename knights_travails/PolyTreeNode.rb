class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end
  def parent
    @parent
  end
  def children
    @children
  end
  def value
    @value
  end
  def parent=(parent_node)
    
    @parent.children.delete(self) if @parent
      @parent = parent_node
      @parent.children << self if @parent

  end
  def add_child(child_node)
    child_node.parent = self if child_node
  end
  def remove_child(child_node)
    raise "node is not a child" unless child_node.parent
    children.delete(child_node)
    child_node.parent = nil
  end



  def dfs(target_value)
    return self if self.value == target_value
    
    children.each do |child|
      rec = child.dfs(target_value)
      return rec if rec
    end 
    return nil
  end

  def bfs(target_value)
    arr = []
    arr.unshift(self)

    until arr.empty?
      node = arr.pop
      arr = node.children.reverse + arr
      if node.value == target_value
        return node
      end
    end
  end

end

