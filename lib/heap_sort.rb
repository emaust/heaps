require_relative 'min_heap'
require 'pry'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)

  return [] if list.empty?
  # create heap
  heap = MinHeap.new
  
  list.each do |element|
    heap.add(element)
  end

  until heap.empty?
    current = heap.remove
    list.push(current)
    list.shift unless list.length == 1
  end

  return list

end