require 'simplecov'
SimpleCov.start

require 'bank_account'


describe BankAccount do 

  # before(:each) do 
  #   bank_account = BankAccount.new

  # end 

  it 'checks the current balance' do
    bank_account = BankAccount.new
    expect(bank_account.balance).to eq 0.00
  end 

  it 'makes a deposit and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", "1000.00")
    transactions = bank_account.transactions_list

    expect(transactions[0].date).to eq "10/01/2023"
    expect(transactions[0].credit).to eq 1000.0
    expect(transactions[0].debit).to eq nil
    expect(transactions[0].balance).to eq 1000.0
  end 

  it 'makes 2 deposits and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", "1000.00")
    bank_account.deposit("13/01/2023", "2000.00")
    transactions = bank_account.transactions_list

    expect(transactions[0].date).to eq "10/01/2023"
    expect(transactions[0].credit).to eq 1000.0
    expect(transactions[0].debit).to eq nil
    expect(transactions[0].balance).to eq 1000.0

    expect(transactions[1].date).to eq "13/01/2023"
    expect(transactions[1].credit).to eq 2000.0
    expect(transactions[1].debit).to eq nil
    expect(transactions[1].balance).to eq 3000.0

    expect(bank_account.balance).to eq 3000.00

  end 

  it 'makes 2 deposits, one withdrawal and updates the current balance' do 
    bank_account = BankAccount.new
    bank_account.deposit("10/01/2023", "1000.00")
    bank_account.deposit("13/01/2023", "2000.00")
    bank_account.withdrawal("14/01/2023", "500.00")
    transactions = bank_account.transactions_list


    expect(transactions[2].date).to eq "14/01/2023"
    expect(transactions[2].credit).to eq nil
    expect(transactions[2].debit).to eq 500.00
    expect(transactions[2].balance).to eq 2500.00
    expect(bank_account.balance).to eq 2500.00
  end 

  it 'makes 1 deposit and prints a formatted statement' do 
    bank_account = BankAccount.new
    # bank_account.deposit("10/01/2023", "1000.00")
    statement_creator = double('statement_creator')
    transaction1 = double(:transaction1, date: '10/01/2023', credit: 1000.32, debit: nil, balance: 1000.32)

    allow(statement_creator).to receive(:format_statement).with(transaction1).and_return("date || credit || debit || balance \n" +
      "10/01/2023 || 1000.00 ||  || 1000.00 \n"
    )

    expect(bank_account.print_statement).to eq("date || credit || debit || balance \n" +
      "10/01/2023 || 1000.00 ||  || 1000.00 \n"
    )

    
    # expected_output = "date || credit || debit || balance \n" +
    #                   "10/01/2023 || 1000.00 ||  || 1000.00 \n" 
    # expect { bank_account.print_statement }.to output(expected_output).to_stdout
  end 

  # xit 'makes 1 deposit and prints a formatted statement' do 
  #   bank_account = BankAccount.new
  #   bank_account.deposit("10/01/2023", "1000.00")
  #   bank_account.deposit("13/01/2023", "2000.00")
  #   bank_account.withdrawal("14/01/2023", "500.00")
  #   expected_output = "date || credit || debit || balance \n" +
  #                     "14/01/2023 ||  || 500.00 || 2500.00 \n" +
  #                     "13/01/2023 || 2000.00 ||  || 3000.00 \n" + 
  #                     "10/01/2023 || 1000.00 ||  || 1000.00 \n"
  #   expect { bank_account.print_statement }.to output(expected_output).to_stdout
  # end 
end 
