require_relative './transaction'
require_relative './bank_account'


class Statement

  def format_statement(bank_account)

    transactions = bank_account.transactions_list
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