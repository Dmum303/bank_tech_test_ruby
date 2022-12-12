require_relative "../lib/transaction"

RSpec.describe Transaction do
  it "Can add trans amount and returns correect amount" do
    transaction = Transaction.new(500)
    expect(transaction.show_amount).to eq(500.00)
  end

  it "Can add diff trans amount and returns correect amount" do
    transaction = Transaction.new(400)
    expect(transaction.show_amount).to eq(400.00)
  end

  it "Can add diff trans amount that are floats" do
    transaction = Transaction.new(0.26)
    expect(transaction.show_amount).to eq(0.26)
  end

  it "Throws an error if amount is not int or float" do
    transaction = Transaction.new("string")
    expect { transaction.check_input }.to raise_error(
      "Error: only input integers or floats"
    )
    transaction2 = Transaction.new([])
    expect { transaction2.check_input }.to raise_error(
      "Error: only input integers or floats"
    )
    transaction3 = Transaction.new(true)
    expect { transaction3.check_input }.to raise_error(
      "Error: only input integers or floats"
    )
  end

  it "Return amount ok if amount is correct data type" do
    transaction = Transaction.new(25)
    expect(transaction.check_input).to eq("Ok")
    transaction_2 = Transaction.new(0.46)
    expect(transaction_2.check_input).to eq("Ok")
  end

  #   it "Throws an error if there are more than 2 decimal places"
  #   transaction2 = Transaction.new(true)
end
