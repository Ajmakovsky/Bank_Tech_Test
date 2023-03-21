require_relative './transaction'

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
    if amount.to_f > @current_balance
      raise ArgumentError, "Insufficient funds"
    end
    
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
end 


# bank_account = BankAccount.new

# bank_account.deposit("10/01/2023", 1000.32)
# bank_account.deposit("13/01/2023", 2000)
# bank_account.withdrawal("14/01/2023", 500.12)
# p bank_account.transactions_list
# # bank_account.print_statement

