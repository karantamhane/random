class Stack
  def initialize
    @stack = []
    @min = nil
  end

  def push(item)
    @stack << item
    if !@min || item < @min
      @min = item
    end
    nil
  end

  def pop
    @stack.delete(@stack[@stack.length-1])
  end

  def is_empty?
    @stack.length == 0
  end

  def size
    @stack.length
  end

  def minimum
    @min
  end
end

class Queue
  def initialize
    @queue = []
  end

  def push(item)
    @queue << item
    nil
  end

  def pop
    @queue.delete(@queue[0])
  end

  def is_empty?
    @queue.length == 0
  end

  def size
    @queue.length
  end
end




class Node
  def initialize
    @value = nil
    @next = nil
  end
  attr_accessor :value, :next
end

class LinkedStack
def initialize
  @head = Node.new
  @size = 0
end
attr_accessor :head, :size

def push(item)
  if @head.next
    @head = @head.next
  end
  node = Node.new
  @head.next = node
  node.value = item
  @size += 1
  nil
end

def pop
  popped = @head.next.value
  @head.next = nil
  @size -= 1
  popped
end

def size
  @size
end

def is_empty?
  @tail.next == nil
end
end

class LinkedQueue
  def initialize
    @head = Node.new
    @tail = @head
    @size = 0
  end

  def push(item)
    if @head.next
      @head = @head.next
    end
    node = Node.new
    @head.next = node
    node.value = item
    @size += 1
    nil
  end

  def pop
    popped = @tail.next.value
    @tail.next = @tail.next.next
    @tail.next.next = nil
    popped
  end

  def size
    @size
  end

  def is_empty?
    @tail.next == nil
  end
end

class TwoStackQueue
  def initialize
    @stack1 = Stack.new
    @stack2 = Stack.new
  end

  def push(item)
    @stack1.push item
    nil
  end

  def pop
    if @stack2.is_empty?
      while !@stack1.is_empty?
        @stack2.push @stack1.pop
      end
    else
      @stack2.pop
    end
  end
end















