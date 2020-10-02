
class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add(key, value = key)
    
    @store.push(HeapNode.new(key,value))
    child = @store.length - 1
    heap_up(child) if child != 0 

  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def remove()

    swap(0, @store.length - 1)
    deleted = @store.pop
    heap_down(0) unless self.empty?

    return deleted.value

  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    if @store[0].nil? || @store.empty?
      return true
    end

    return false

  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(n)
  # Space complexity: O(1)
  def heap_up(index)

    parent = (index - 2) / 2 if index.even?
    parent = (index - 1) / 2 if index.odd?

    if @store[parent].key > @store[index].key
      swap(parent, index)
      heap_up(parent) if parent != 0
    end

  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
  
    left = (2 * index) + 1
    right = (2 * index) + 2


    if !@store[right].nil?
      min_child = left if @store[left].key < @store[right].key
      min_child = right if @store[left].key > @store[right].key
    elsif @store[left].nil?
      return
    else
      min_child = left
    end

    if @store[index].key > @store[min_child].key
      swap(index, min_child)
      index = min_child
      heap_down(index)
    end


  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end