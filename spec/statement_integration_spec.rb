require_relative "../lib/statement"
require_relative "../lib/transaction"

RSpec.describe Statement do
  context "a context" do
    it "Produces a statement with one transaction" do
      transaction = Transaction.new(450, "12-12-2022", "credit")
      transaction.check_all_data_input
      statement = Statement.new
      statement.add(transaction)
      expect(
        statement.return_statement
      ).to eq "date || credit || debit || balance\n12/12/2022 || 450.00 || || 450.00"
    end

    it "Produces a statement with one transaction" do
      transaction = Transaction.new(300, "01-12-2021", "debit")
      transaction.check_all_data_input
      statement = Statement.new(1000)
      statement.add(transaction)
      expect(
        statement.return_statement
      ).to eq "date || credit || debit || balance\n01/12/2021 || || 300.00 || 700.00"
    end

    it "Produces a statement with several transactions" do
      transaction = Transaction.new(500, "14-01-2023", "debit")
      transaction_2 = Transaction.new(2000, "13-01-2023", "credit")
      transaction_3 = Transaction.new(1000, "10-01-2023", "credit")
      transaction.check_all_data_input
      transaction_2.check_all_data_input
      transaction_3.check_all_data_input
      statement = Statement.new
      statement.add(transaction)
      statement.add(transaction_2)
      statement.add(transaction_3)
      expect(
        statement.return_statement
      ).to eq "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
    end
  end
end

#  Have noticed that the dates are in the oposite order to what I have and there's a bug
