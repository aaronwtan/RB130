require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    @transaction.amount_paid = 50

    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal(previous_amount + 50, current_amount)
  end

  def test_change
    @transaction.amount_paid = 50

    assert_equal(40, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $10.\n") { @register.give_receipt(@transaction) }
  end

  def test_start_transaction
    $stdin = StringIO.new("10\n")
    previous_amount = @register.total_money

    assert_output("You owe $10.\nHow much are you paying?\n" \
                  "You've paid $10.\n") do
      @register.start_transaction(@transaction)
    end
    assert_equal(previous_amount + 10, @register.total_money)
  end
end
