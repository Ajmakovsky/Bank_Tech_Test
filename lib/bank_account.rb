

class BankAccount
  def initialize
    @transactions = []
    @current_balance = 0.00 
  end 

  def deposit(date, amount)
    new_balance = @current_balance + amount 
    transaction = [date, amount, new_balance]
    @transactions << transaction

    @current_balance = @current_balance + amount
  end 

  def withdrawal(date, amount)
    new_balance = @current_balance - amount 
    transaction = [date, amount, new_balance]
    @transactions << transaction

    @current_balance = @current_balance - amount
  end 

  def print_statement
  end 

  def balance
    return @current_balance
  end

  def transactions_list
    return @transactions
  end 
end 




