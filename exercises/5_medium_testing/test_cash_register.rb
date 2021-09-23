require 'minitest/autorun'
require 'minitest/reporters'
require 'stringio'

require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    @transaction.amount_paid = 50
    assert_equal(1050, @cash_register.accept_money(@transaction))
  end

  def test_change
    @transaction.amount_paid = 100
    assert_equal(50, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") { @cash_register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    transaction = Transaction.new(50)
    string_input = StringIO.new('50\n')
    string_output = StringIO.new
    transaction.prompt_for_payment(input: string_input, output: string_output)
    assert_equal(50, transaction.amount_paid)
  end
end