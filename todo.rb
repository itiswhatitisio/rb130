# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def add(todo)
    if todo.class == Todo
      todos << todo 
    else
      begin
        raise TypeError.new("Can only add Todo objects")
      end
    end
    self.todos
  end

  def <<(todo)
    add(todo)
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    items = []
    todos.each do |todo_object|
      items << todo_object
    end
    items
  end

  def done?
    todos.all? { |todo_object| todo_object.done }
  end

  def item_at(index)
    if index > todos.size
      begin
        raise IndexError
      end
    else
      todos[index]
    end
  end

  def mark_done_at(index)
    if index > todos.size
      begin
        raise IndexError
      end
    else
      todos[index].done!
    end
  end

  def mark_undone_at(index)
    if index > todos.size
      begin
        raise IndexError
      end
    else
      todos[index].undone!
    end
  end

  def done!
    todos.each do |todo_object|
      todo_object.done = true
    end
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    if index > todos.size
      begin
        raise IndexError
      end
    else
      todos.delete_at(index)
    end
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    index = 0
    while index < todos.size
      yield(todos[index])
      index += 1
    end
    self
  end

  def select
    list = TodoList.new(title)
    todos.each do |todo_object|
      list.add(todo_object) if yield(todo_object)
    end
    list
  end

  def find_by_title(search_term)
    todos.each do |todo_object|
      return todo_object.title if todo_object.title == search_term
    end
  end

  def all_done
    todos.select { |todo_object| todo_object.done? }
  end

  def all_not_done
    todos.select { |todo_object| todo_object.done? == false }
  end

  def mark_done(todo)
    todos.each do |todo_object|
      todo_object.done! if todo_object.title == todo
    end
  end

  def mark_all_done
    todos.each do |todo_object|
      todo_object.done!
    end
  end

  def mark_all_done
    todos.each do |todo_object|
      todo_object.undone!
    end
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"
list.mark_done_at(1)
puts list
list.mark_done('Buy milk')
puts list



