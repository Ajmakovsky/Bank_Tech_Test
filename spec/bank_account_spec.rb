require 'bank_account'

describe BankAccount do 

  it 'checks the current balance' do
    bank_account = BankAccount.new
    expect(bank_account.balance).to eq 0.00
  end 

  it 'makes a deposit and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", 1000.00)
    expect(bank_account.balance).to eq 1000.00
    expect(bank_account.transactions_list).to eq [["10/01/2023", 1000.0, 1000.0]]
  end 

  it 'makes 2 deposits and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", 1000.00)
    bank_account.deposit("13/01/2023", 2000.00)
    expect(bank_account.balance).to eq 3000.00
    expect(bank_account.transactions_list).to eq [["10/01/2023", 1000.0, 1000.0], ["13/01/2023", 2000.0, 3000.0]]
  end 

  it 'makes 2 deposits, one withdrawal and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", 1000.00)
    bank_account.deposit("13/01/2023", 2000.00)
    bank_account.withdrawal("14/01/2023", 500.00)
    expect(bank_account.balance).to eq 2500.00
    expect(bank_account.transactions_list).to eq [["10/01/2023", 1000.0, 1000.0], ["13/01/2023", 2000.0, 3000.0],["14/01/2023", 500.0, 2500.0]]
  end 
end 