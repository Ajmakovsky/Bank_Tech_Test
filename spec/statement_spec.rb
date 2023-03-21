require 'simplecov'
SimpleCov.start

require 'statement'

describe Statement do

  it 'should return a number with 2 decimal places' do 
    statement_creator = Statement.new
    expect(statement_creator.serialize(100)).to eq "100.00"
  end 

  it 'should return a number with 2 decimal places' do 
    statement_creator = Statement.new
    expect(statement_creator.serialize(nil)).to eq nil
  end 

  it "formats the statement correctly" do
    bank_account = double(:bank_account)
    transaction1 = double(:transaction1, date: '10/01/2023', credit: 1000.32, debit: nil, balance: 1000.32)
    allow(bank_account).to receive(:transactions_list).and_return([transaction1])

    expected_output = "date || credit || debit || balance \n"\
                      "10/01/2023 || 1000.32 ||  || 1000.32 \n"

    statement_creator = Statement.new

    expect { statement_creator.format_statement(bank_account) }.to output(expected_output).to_stdout
  end

  it "formats the statement correctly" do
    bank_account = double(:bank_account)
    transaction1 = double(:transaction1, date: '10/01/2023', credit: 1000.32, debit: nil, balance: 1000.32)
    transaction2 = double(:transaction2, date: '13/01/2023', credit: 2000, debit: nil, balance: 3000.32)
    allow(bank_account).to receive(:transactions_list).and_return([transaction1, transaction2])

    expected_output = "date || credit || debit || balance \n"\
                      "13/01/2023 || 2000.00 ||  || 3000.32 \n"\
                      "10/01/2023 || 1000.32 ||  || 1000.32 \n"

    statement_creator = Statement.new

    expect { statement_creator.format_statement(bank_account) }.to output(expected_output).to_stdout
  end


  it "formats the statement correctly" do
    bank_account = double(:bank_account)
    transaction1 = double(:transaction1, date: '10/01/2023', credit: 1000.32, debit: nil, balance: 1000.32)
    transaction2 = double(:transaction2, date: '13/01/2023', credit: 2000, debit: nil, balance: 3000.32)
    transaction3 = double(:transaction3, date: '14/01/2023', credit: nil, debit: 500.10, balance: 2500.22)

    allow(bank_account).to receive(:transactions_list).and_return([transaction1, transaction2, transaction3])

    expected_output = "date || credit || debit || balance \n"\
                      "14/01/2023 ||  || 500.10 || 2500.22 \n"\
                      "13/01/2023 || 2000.00 ||  || 3000.32 \n"\
                      "10/01/2023 || 1000.32 ||  || 1000.32 \n"

    statement_creator = Statement.new

    expect { statement_creator.format_statement(bank_account) }.to output(expected_output).to_stdout
  end

end 