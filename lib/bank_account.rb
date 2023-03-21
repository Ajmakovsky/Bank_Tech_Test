require_relative './transaction'
require_relative './statement_creator'

class BankAccount
  def initialize
    @transactions = []
    @current_balance = 0.00 
  end 


  def deposit(date, amount)

    new_balance = (@current_balance + amount.to_f)
    transaction = Transaction.new(date, amount.to_f, nil, new_balance)
    @transactions << transaction

    @current_balance = new_balance
  end 

  def withdrawal(date, amount)
    new_balance = @current_balance - amount.to_f
    transaction = Transaction.new(date, nil, amount.to_f, new_balance)
    @transactions << transaction

    @current_balance = new_balance
  end 


  def balance
    return @current_balance
  end

  def transactions_list
    return @transactions
  end 

  def statement
    new_statement = StatementCreator.new
    return new_statement.print_statement(@transactions)
  end 
end 


bank_account = BankAccount.new

bank_account.deposit("10/01/2023", 1000.32)
bank_account.deposit("13/01/2023", 2000)
bank_account.withdrawal("14/01/2023", 500.12)
bank_account.statement



  # def print_statement
  #   print("date || credit || debit || balance \n")

  #   @transactions.reverse.each do |transaction|
  #     print("#{transaction.date} || #{serialize(transaction.credit)} || #{serialize(transaction.debit)} || #{serialize(transaction.balance)} \n")
  #   end
  # end

    # def serialize(number)
  #   if number == nil 
  #     return nil 
  #   else 
  #     return new_number = ("%.2f" % number)
  #   end 
  # end 
