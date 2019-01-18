# This is how you define your own custom exception classes
require_relative 'transaction'

class DepositError < StandardError
end

class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)

  MIN_DEPOSIT = 100
  attr_accessor :name
  attr_reader :balance

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    add_transaction(-amount)
    # TODO: returns a string with a message
    return "You withdrawn $#{amount}. Balance: #{@balance}"
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(+amount)
    return "You deposit $#{amount}. Balance: #{@balance}"
  end

  def transactions_history(args = {})
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!

  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    @iban[0...4]+"**************"+@iban[-3..-1]

  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
    return "#{name}, #{iban}, #{balance}"

  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    @balance += amount
    # TODO: update the current balance (which represents the balance of the account)

    # @transactions << Transaction.new(amount, @balance)
  end
end


account = BankAccount.new("John Lennon", "FR14-2004-1010-0505-0001-3M02-606", 200, "yoko")

puts account
# the puts will call the `to_s` method on the object
# =>  Owner: John Lennon - IBAN: FR14**************606 - Balance: 200 euros
