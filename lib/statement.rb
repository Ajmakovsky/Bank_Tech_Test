

require_relative './transaction'
require_relative './bank_account'

class StatementCreator

  # def get_transactions 
  #   bank_account = BankAccount.new
  #   transactions = bank_account.transactions_list
  #   return transactions 
  # end 

  def print_statement(transactions)

    # bank_account = BankAccount.new
    # transactions = bank_account.transactions_list
    # p transactions
    print("date || credit || debit || balance \n")

    transactions.reverse.each do |transaction|
      print("#{transaction.date} || #{serialize(transaction.credit)} || #{serialize(transaction.debit)} || #{serialize(transaction.balance)} \n")
    end
  end

  def serialize(number)
    if number == nil 
      return nil 
    else 
      return new_number = ("%.2f" % number)
    end 
  end 
end

# bank_account = BankAccount.new

# bank_account.deposit("10/01/2023", 1000.32)
# bank_account.deposit("13/01/2023", 2000)
# bank_account.withdrawal("14/01/2023", 500.12)
# bank_account.transactions_list

# statement = Statement.new
# statement.print_statement(bank_account)