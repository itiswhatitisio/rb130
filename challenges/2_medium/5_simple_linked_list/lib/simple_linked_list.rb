class LinkedList
  attr_reader :list

  def initialize(head = nil)
    @list = head
  end

  def push(value)
    element = Element.new(value, @head)
    @head = element
  end

  def pop
  end

  def from_a(argument = [])
  end

  def size
    return 0 if @list == nil

    @list.size
  end
end

class Element
  attr_reader :data, :next

  def initialize(datum = nil, next_datum = nil)
    @datum = datum
    @next = next_datum
    @@counter += 1
  end

  def tail?
    @next_datum == nil
  end
end

test_list = [:data => 1, :next => [:data => 2, :next => [:data => 3, :next => [nil]]]]

test_list.each do |element|
  p element[:next]
end

l1 = LinkedList.new(1)
p l1
