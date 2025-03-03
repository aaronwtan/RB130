# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  attr_reader :title

  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

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

  protected

  attr_accessor :description, :done
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_reader :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    validate_todo(todo)
    todos << todo
  end
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def to_a
    todos.clone
  end

  def to_s
    todos_str = "---- #{title} ----#{todos_str}"
    todos.each { |todo| todos_str << "\n#{todo}" }
    todos_str
  end

  def each
    todos.each { |todo| yield(todo) }
    self
  end

  def select
    selected_list = TodoList.new(title)
    each { |todo| selected_list << todo if yield(todo) }
    selected_list
  end

  def find_by_title(title)
    each { |todo| return todo if todo.title == title }
    nil
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title)&.done!
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end

  private

  attr_reader :todos
  attr_writer :title

  def validate_todo(todo)
    raise TypeError, 'Can only add Todo object' unless todo.instance_of?(Todo)
  end
end


# given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
# list.size                       # returns 3

# first
# list.first                      # returns todo1, which is the first item in the list

# last
# list.last                       # returns todo3, which is the last item in the list

#to_a
# list.to_a                      # returns an array of all items in the list

#done?
# list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# done!
# list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
# list.shift                      # removes and returns the first item in list

# pop
# list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
# list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end

# todo1.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

# puts list.find_by_title('Clean room')

# list.mark_done('Buy milk')
# list.mark_done('Go to gym')
# puts list.all_done
# puts list.all_not_done

# list.mark_all_done
# puts list

# list.mark_all_undone
# puts list
