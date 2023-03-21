require 'statement'

describe StatementCreator do

  it 'should return a number with 2 decimal places' do 
    statement_creator = StatementCreator.new
    expect(statement_creator.serialize(100)).to eq "100.00"
  end 

  it 'should return a number with 2 decimal places' do 
    statement_creator = StatementCreator.new
    expect(statement_creator.serialize(nil)).to eq nil
  end 

  # it "should format the statement correctly with credit transaction" do
  #   transaction1 = double(:transaction1, date: '10/01/2023', credit: 1000.32, debit: nil, balance: 1000.32)
  #   transaction2 = double(:transaction2, date: '13/01/2023', credit: 2000, debit: nil, balance: 3000.32)

  #   transactions = [transaction1, transaction2]
  #   expected_output = "date || credit || debit || balance \n13/01/2023 || 2000.00 ||  || 3000.32 \n10/01/2023 || 1000.32 ||  || 1000.32 \n"
  #   statement_creator = StatementCreator.new

  #   expect { statement_creator.format_statement(transactions) }.to output(expected_output).to_stdout
  # end

  # it "should format the statement correctly with debit transaction" do

  #   transaction1 = double(:transaction1, date: '10/01/2023', credit: 2500.12, debit: nil, balance: 2500.12)
  #   transaction2 = double(:transaction2, date: '13/01/2023', credit: nil, debit: 2000, balance: 500.12)

  #   transactions = [transaction1, transaction2]
  #   expected_output = "date || credit || debit || balance \n13/01/2023 ||  || 2000.00 || 500.12 \n10/01/2023 || 2500.12 ||  || 2500.12 \n"
  #   statement_creator = StatementCreator.new

  #   expect { statement_creator.format_statement(transactions) }.to output(expected_output).to_stdout
  # end 

  # it "should format the statement correctly with debit transaction" do

  #   transaction1 = double(:transaction1, date: '10/01/2023', credit: 2500.12, debit: nil, balance: 2500.12)
  #   transaction2 = double(:transaction2, date: '13/01/2023', credit: nil, debit: 2000, balance: 500.12)

  #   transactions = [transaction1, transaction2]
  #   expected_output = "date || credit || debit || balance \n13/01/2023 ||  || 2000.00 || 500.12 \n10/01/2023 || 2500.12 ||  || 2500.12 \n"
  #   statement_creator = StatementCreator.new

  #   expect { statement_creator.format_statement(transactions) }.to output(expected_output).to_stdout
  # end 


  it "formats the statement correctly" do
    bank_account = double(:bank_account)
    transaction1 = double(:transaction1, date: '10/01/2023', credit: 1000.32, debit: nil, balance: 1000.32)
    transaction2 = double(:transaction2, date: '13/01/2023', credit: 2000, debit: nil, balance: 3000.32)
    allow(bank_account).to receive(:transactions_list).and_return([transaction1, transaction2])

    expected_output = "date || credit || debit || balance \n"\
                      "2022-03-21 ||  || 50.00 || 50.00 \n"\
                      "2022-03-20 || 100.00 ||  || 100.00 \n"

    statement_creator = StatementCreator.new

    expect { statement_creator.format_statement(bank_account) }.to output(expected_output).to_stdout
  end

end 