require 'simplecov'
SimpleCov.start

require 'bank_account'


describe BankAccount do 

  it 'checks the current balance' do
    bank_account = BankAccount.new
    expect(bank_account.balance).to eq 0.00
  end 

  it 'makes a deposit and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", "1000.00")
    expect(bank_account.balance).to eq 1000.00
    expect(bank_account.transactions_list).to eq [{date: "10/01/2023", credit: "1000.00", debit: nil, balance: 1000.0}]
  end 

  it 'makes 2 deposits and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", "1000.00")
    bank_account.deposit("13/01/2023", "2000.00")
    expect(bank_account.balance).to eq 3000.00
    expect(bank_account.transactions_list).to eq [{date: "10/01/2023", credit: "1000.00", debit: nil, balance: 1000.0}, {date: "13/01/2023", credit: "2000.00", debit: nil, balance: 3000.0}]
  end 

  it 'makes 2 deposits, one withdrawal and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", "1000.00")
    bank_account.deposit("13/01/2023", "2000.00")
    bank_account.withdrawal("14/01/2023", "500.00")
    expect(bank_account.balance).to eq 2500.00
    expect(bank_account.transactions_list).to eq(
      [{date: "10/01/2023", credit: "1000.00", debit: nil, balance: 1000.0}, 
      {date: "13/01/2023", credit: "2000.00", debit: nil,balance: 3000.0},
      {date: "14/01/2023", credit: nil, debit: "500.00", balance: 2500.0}])
  end 

  it 'makes 1 deposit and prints a formatted statement' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", "1000.00")

    expected_output = "date || credit || debit || balance \n" +
                      "10/01/2023 || 1000.00 ||  || 1000.00 \n" 
    expect { bank_account.print_statement }.to output(expected_output).to_stdout
  end 

  it 'makes 1 deposit and prints a formatted statement' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", "1000.00")
    bank_account.deposit("13/01/2023", "2000.00")
    bank_account.withdrawal("14/01/2023", "500.00")
    expected_output = "date || credit || debit || balance \n" +
                      "14/01/2023 ||  || 500.00 || 2500.00 \n" +
                      "13/01/2023 || 2000.00 ||  || 3000.00 \n" + 
                      "10/01/2023 || 1000.00 ||  || 1000.00 \n"
    expect { bank_account.print_statement }.to output(expected_output).to_stdout
  end 
end 
