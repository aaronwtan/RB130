require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    first_todo = @list.shift
    assert_equal(@todo1, first_todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    last_todo = @list.pop
    assert_equal(@todo3, last_todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_shovel
    todo4 = Todo.new("Take out the trash")
    @todos << todo4
    @list << todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo4 = Todo.new("Do the laundry")
    @todos << todo4
    @list.add(todo4)

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_raises(IndexError) { @list.mark_undone_at(100) }
  end

  def test_done_bang
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    removed_todo = @list.remove_at(1)

    assert_equal(@todo2, removed_todo)
    assert_equal([@todo1, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(100) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [X] Clean room
      [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [X] Clean room
      [X] Go to gym
    OUTPUT

    @list.done!

    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }

    assert_equal(@todos, result)
  end

  def test_each_2
    result = @list.each { |_| nil }
    assert_equal(@list, result)
  end

  def test_select
    @todo2.done!
    selected_list = @list.select { |todo| !todo.done? }

    assert_equal([@todo1, @todo3], selected_list.to_a)
  end

  def test_find_by_title
    assert_equal(@todo2, @list.find_by_title('Clean room'))
    assert_nil(@list.find_by_title(''))
  end

  def test_all_done
    @todo1.done!
    @todo3.done!
    new_list = TodoList.new(@list.title)
    new_list << @todo1
    new_list << @todo3

    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    @todo1.done!
    @todo3.done!
    new_list = TodoList.new(@list.title)
    new_list << @todo2

    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_s, @list.all_not_done.to_s)
  end

  def test_mark_done
    @list.mark_done('Clean room')

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_nil(@list.mark_done(''))
  end

  def test_mark_all_done
    @list.mark_all_done

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_all_undone

    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
end
