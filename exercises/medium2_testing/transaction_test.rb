require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(10)
  end

  def test_prompt_for_payment_over
    input = StringIO.new("50\n")
    output = StringIO.new

    assert_output("You owe $10.\nHow much are you paying?\n") do
      @transaction.prompt_for_payment(input: input, output: output)
    end
    assert_equal(50, @transaction.amount_paid)
  end

  def test_prompt_for_payment_exact
    input = StringIO.new("10\n")
    output = StringIO.new

    assert_output("You owe $10.\nHow much are you paying?\n") do
      @transaction.prompt_for_payment(input: input, output: output)
    end
    assert_equal(10, @transaction.amount_paid)
  end

  def test_prompt_for_payment_under
    input = StringIO.new("5\n10\n")
    output = StringIO.new

    assert_output("You owe $10.\nHow much are you paying?\n" \
                  "That is not the correct amount. " \
                  "Please make sure to pay the full cost.\n" \
                  "You owe $10.\nHow much are you paying?\n") do
      @transaction.prompt_for_payment(input: input, output: output)
    end
    assert_equal(10, @transaction.amount_paid)
  end
end
