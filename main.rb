require_relative './node'

def knight_moves(origin, destination)
  node = Node.new(origin)
  queue = [node]
  until node.traverse_breadth_first.any?(destination) do
    if queue[0].children.all?(nil)
      universe = [[queue[0].position[0] - 2, queue[0].position[1] - 1],
                  [queue[0].position[0] - 2, queue[0].position[1] + 1],
                  [queue[0].position[0] + 2, queue[0].position[1] - 1],
                  [queue[0].position[0] + 2, queue[0].position[1] + 1],
                  [queue[0].position[0] - 1, queue[0].position[1] - 2],
                  [queue[0].position[0] - 1, queue[0].position[1] + 2],
                  [queue[0].position[0] + 1, queue[0].position[1] - 2],
                  [queue[0].position[0] + 1, queue[0].position[1] + 2]]
      filtered = universe.select {|position| position.all? {|coordinate| coordinate >= 1 && coordinate <= 8}}
      filtered.push(nil) until filtered.length == 8
      for i in (0..7)
        queue[0].children[i] = Node.new(filtered[i], queue[0]) if filtered[i] != nil
      end
    end
    for i in (0..7)
      queue.push(queue[0].children[i]) if queue[0].children[i].class == Node
    end
    queue.shift
  end
  array = [node.find(destination)]
  array.unshift(array[0].parent) until array[0].parent == nil
  puts "You made it in #{array.length} moves! Here's your path:"
  array.each do |element|
    p element.position
  end
end

knight_moves([3,3],[4,3])