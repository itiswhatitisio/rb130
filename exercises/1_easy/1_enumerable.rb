class Tree
  include Enumerable

  def each
    # implementation for Tree objects
  end

  def <=>
    # code to determine what values are used for comparison
  end
end

## Documentation Enumerable mixin

# The Enumerable mixin provides collection classes with several 
# traversal and searching methods, and with the ability to sort. 
# The class must provide a method each, which yields successive 
# members of the collection. If Enumerable#max, #min, or #sort is 
# used, the objects in the collection must also implement a 
# meaningful <=> operator, as these methods rely on an ordering 
# between members of the collection.