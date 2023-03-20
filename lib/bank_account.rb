
class BankAccount
  def initialize
    @transactions = []
    @current_balance = 0.00 
  end 

  def deposit(date, amount)
    new_balance = @current_balance + amount.to_f
    transaction = {date: date, credit: amount, debit: nil, balance: new_balance}
    @transactions << transaction

    @current_balance = @current_balance + amount.to_f
  end 

  def withdrawal(date, amount)
    new_balance = @current_balance - amount.to_f
    transaction = {date: date, credit: nil, debit: amount, balance: new_balance}
    @transactions << transaction

    @current_balance = @current_balance - amount.to_f
  end 

  def print_statement
    print("date || credit || debit || balance \n")

    @transactions.reverse.each do |transaction|
      print("#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}0 \n")
    end
  end

  def balance
    return @current_balance
  end

  def transactions_list
    return @transactions
  end 
end 


# bank_account = BankAccount.new

# bank_account.deposit("10/01/2023", "1000.00")
# bank_account.deposit("13/01/2023", "2000.00")
# bank_account.withdrawal("14/01/2023", "500.00")
# bank_account.print_statement
