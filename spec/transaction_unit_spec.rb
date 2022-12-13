require_relative "../lib/transaction"

RSpec.describe Transaction do
  context "Amount testing" do
    it "Can add trans amount and returns correct amount" do
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
      expect { transaction.check_amount_input }.to raise_error(
        "Error: only input integers or floats"
      )
      transaction2 = Transaction.new([])
      expect { transaction2.check_amount_input }.to raise_error(
        "Error: only input integers or floats"
      )
      transaction3 = Transaction.new(true)
      expect { transaction3.check_amount_input }.to raise_error(
        "Error: only input integers or floats"
      )
    end

    it "Return amount ok if amount is correct data type" do
      transaction = Transaction.new(25)
      expect(transaction.check_amount_input).to eq("Ok")
      transaction_2 = Transaction.new(0.46)
      expect(transaction_2.check_amount_input).to eq("Ok")
    end

    it "Throws an error if there are more than 2 decimal places" do
      transaction_1 = Transaction.new(0.34)
      expect(transaction_1.two_decimal_places).to eq "Ok"
      transaction_2 = Transaction.new(0.2)
      expect(transaction_2.two_decimal_places).to eq "Ok"
      transaction_3 = Transaction.new(0.5768)
      expect {
        transaction_3.two_decimal_places
      }.to raise_error "Error: only input floats to two decimal places"
    end
  end

  context "Date testing" do
    it "Can add transaction date" do
      transaction = Transaction.new(25, "03-02-2001")
      expect(transaction.show_string_date).to eq "03-02-2001"
    end

    it "Date default is nil" do
      transaction = Transaction.new(25)
      expect(transaction.show_string_date).to eq nil
    end

    it "returns true if date is in correct format" do
      transaction = Transaction.new(25, "03-02-2001")
      expect(transaction.date_valid?).to eq true
      transaction_2 = Transaction.new(25, "31-12-4600")
      expect(transaction_2.date_valid?).to eq true
    end

    it "returns false if date is in correct format" do
      transaction_1 = Transaction.new(25, "56-02-2001")
      expect(transaction_1.date_valid?).to eq false
      transaction_2 = Transaction.new(25, "05-18-2001")
      expect(transaction_2.date_valid?).to eq false
      transaction_3 = Transaction.new(25, "13-23-2001")
      expect(transaction_3.date_valid?).to eq false
      transaction_4 = Transaction.new(25, "00-00-2001")
      expect(transaction_4.date_valid?).to eq false
    end
  end
  #if fields empty fail test
  #private methods
  #a method that runs all checks and makes sure everything is formatted
  #that methods are in a logical order
end
