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
      transaction4 = Transaction.new()
      expect { transaction4.check_amount_input }.to raise_error(
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
      expect(transaction.date_valid?).to eq "Ok"
      transaction_2 = Transaction.new(25, "31-12-4600")
      expect(transaction_2.date_valid?).to eq "Ok"
    end

    #this test
    it "returns false if date is not correct format" do
      transaction_1 = Transaction.new(25, "56-02-2001")
      expect {
        transaction_1.date_valid?
      }.to raise_error "Error: incorrect date input"
      transaction_2 = Transaction.new(25, "05-18-2001")
      expect {
        transaction_2.date_valid?
      }.to raise_error "Error: incorrect date input"
      transaction_3 = Transaction.new(25, "13-23-2001")
      expect {
        transaction_3.date_valid?
      }.to raise_error "Error: incorrect date input"
      transaction_4 = Transaction.new(25, "00-00-2001")
      expect {
        transaction_4.date_valid?
      }.to raise_error "Error: incorrect date input"
      transaction_5 = Transaction.new(25, "hello there")
      expect {
        transaction_5.date_valid?
      }.to raise_error "Error: incorrect date input"
    end

    it "Throws an error if date input is not string" do
      transaction_1 = Transaction.new(25, 876_543)
      expect {
        transaction_1.is_date_string?
      }.to raise_error "Error: date must be a string input in dd-mm-year format"
      transaction_2 = Transaction.new(25, {})
      expect {
        transaction_2.is_date_string?
      }.to raise_error "Error: date must be a string input in dd-mm-year format"
      transaction_3 = Transaction.new(25, "13-23-2001")
      expect(transaction_3.is_date_string?).to eq "Ok"
      transaction_4 = Transaction.new(25)
      expect {
        transaction_4.is_date_string?
      }.to raise_error "Error: date must be a string input in dd-mm-year format"
    end

    it "Converts string date to date object" do
      transaction = Transaction.new(25, "03-02-2001")
      expect(transaction.date_to_object.year).to eq 2001
      expect(transaction.date_to_object.month).to eq 02
      expect(transaction.date_to_object.day).to eq 03
    end
  end

  context "Transaction type testing" do
    it "Returns the type of the transaction" do
      transaction = Transaction.new(25, "03-02-2001", "credit")
      expect(transaction.show_transaction_type).to eq "credit"
      transaction_2 = Transaction.new(25, "03-02-2001", "debit")
      expect(transaction_2.show_transaction_type).to eq "debit"
    end

    it "Throws an error if type not debit or credit" do
      transaction = Transaction.new(25, "03-02-2001", "Ahoy")
      expect {
        transaction.check_type_correct
      }.to raise_error "Error: only input credit or debit"
      transaction_2 = Transaction.new(25, "03-02-2001", [])
      expect {
        transaction_2.check_type_correct
      }.to raise_error "Error: only input credit or debit"
      transaction_3 = Transaction.new(25, "03-02-2001")
      expect {
        transaction_3.check_type_correct
      }.to raise_error "Error: only input credit or debit"
      transaction_4 = Transaction.new(25, "03-02-2001", "debit")
      expect(transaction_4.check_type_correct).to eq "Ok"
    end
  end

  context "Running all data checks" do
    it "Returns true if all data input correctly" do
      transaction = Transaction.new(25, "03-02-2001", "credit")
      expect(transaction.check_all_data_input).to eq true
    end

    it "Throws the correct error if incorrect data input" do
      transaction_1 = Transaction.new(25, [], "credit")
      expect {
        transaction_1.check_all_data_input
      }.to raise_error "Error: date must be a string input in dd-mm-year format"
      transaction_2 = Transaction.new("Heya!", "03-02-2001", "credit")
      expect {
        transaction_2.check_all_data_input
      }.to raise_error "Error: only input integers or floats"
      transaction_3 = Transaction.new(25, "03-54-2001", "credit")
      expect {
        transaction_3.check_all_data_input
      }.to raise_error "Error: incorrect date input"
      transaction_4 = Transaction.new(25, "03-02-2001", [])
      expect {
        transaction_4.check_all_data_input
      }.to raise_error "Error: only input credit or debit"
    end
  end
end
