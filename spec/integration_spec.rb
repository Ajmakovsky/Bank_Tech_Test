require 'simplecov'
SimpleCov.start

require 'transaction'
require 'bank_account'
require 'statement'

describe "Integration tests" do 

  it 'makes 1 deposit and returns a formatted list' do
    bank_account = BankAccount.new
    statement = Statement.new
    bank_account.deposit("10/01/2023", "1000.00")
    expected_output = "date || credit || debit || balance \n" +
                      "10/01/2023 || 1000.00 ||  || 1000.00 \n"
    expect { statement.format_statement(bank_account) }.to output(expected_output).to_stdout
  end 

  it 'makes two deposits and 1 withdrawal and returns a formatted list' do
    bank_account = BankAccount.new
    statement = Statement.new
    bank_account.deposit("10/01/2023", "1000.00")
    bank_account.deposit("13/01/2023", "2000.00")

    expected_output = "date || credit || debit || balance \n" +
                      "13/01/2023 || 2000.00 ||  || 3000.00 \n" + 
                      "10/01/2023 || 1000.00 ||  || 1000.00 \n"
    expect { statement.format_statement(bank_account) }.to output(expected_output).to_stdout
  end 

  it 'makes two deposits and 1 withdrawal and returns a formatted list' do
    bank_account = BankAccount.new
    statement = Statement.new
    bank_account.deposit("10/01/2023", "1000.00")
    bank_account.deposit("13/01/2023", "2000.00")
    bank_account.withdrawal("14/01/2023", "500.00")
    expected_output = "date || credit || debit || balance \n" +
                      "14/01/2023 ||  || 500.00 || 2500.00 \n" +
                      "13/01/2023 || 2000.00 ||  || 3000.00 \n" + 
                      "10/01/2023 || 1000.00 ||  || 1000.00 \n"
    expect { statement.format_statement(bank_account) }.to output(expected_output).to_stdout
  end 
end 