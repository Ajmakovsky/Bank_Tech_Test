require 'bank_account'

describe BankAccount do 

  it 'checks the current balance' do
    bank_account = BankAccount.new
    expect(bank_account.balance).to eq 0
  end 

end 