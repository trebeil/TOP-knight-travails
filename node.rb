class Node
  attr_accessor :position, :children, :parent

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @children = [nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def traverse_breadth_first
    queue = [self]
    array = []
    while queue.length > 0 do
      array.push(queue[0].position)
      for i in (0..7)
        queue.push(queue[0].children[i]) if queue[0].children[i].class == Node
      end
      queue.shift
    end
    array
  end

  def find(value)
    queue = [self]
    until queue[0].position == value do
      for i in (0..7)
        queue.push(queue[0].children[i]) if queue[0].children[i].class == Node
      end
      queue.shift
    end
    queue[0]
  end
end
