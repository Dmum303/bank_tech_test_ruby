require_relative "../lib/statement"
require "date"

RSpec.describe Statement do
  context "Check eck" do
    it "Returns the empty transactions array" do
      statement = Statement.new
      expect(statement.transaction_list).to eq []
    end

    it "checks add and transaction list methods" do
      fake_object = double :fake_object
      statement = Statement.new
      statement.add(fake_object)
      expect(statement.transaction_list).to eq [fake_object]
    end

    it "checks several additions" do
      fake_object = double :fake_object
      fake_object_2 = double :fake_object_2
      statement = Statement.new
      statement.add(fake_object)
      statement.add(fake_object_2)
      expect(statement.transaction_list.length).to eq 2
    end

    it "Sorts transactions array by earliest date" do
      fake_transaction =
        double :fake_transaction,
               date_to_object: Date.strptime("03-04-2022", "%d-%m-%Y")
      fake_transaction_2 =
        double :fake_transaction_2,
               date_to_object: Date.strptime("03-04-2021", "%d-%m-%Y")
      fake_transaction_3 =
        double :fake_transaction_3,
               date_to_object: Date.strptime("03-04-2023", "%d-%m-%Y")
      statement = Statement.new
      statement.add(fake_transaction)
      statement.add(fake_transaction_2)
      statement.add(fake_transaction_3)
      statement.sort_by_date
      expect(statement.transaction_list.length).to eq 3
      expect(statement.transaction_list[0]).to eq fake_transaction_2
      expect(statement.transaction_list[2]).to eq fake_transaction_3
    end

    it "Running total adds one transaction and returns total amount input" do
      fake_transaction =
        double :fake_transaction,
               show_amount: 300,
               show_transaction_type: "credit"
      statement = Statement.new
      expect(statement.running_total(fake_transaction)).to eq 300
    end

    it "Running total adds several transactions and returns total amount input" do
      fake_transaction =
        double :fake_transaction,
               show_amount: 300,
               show_transaction_type: "credit"
      fake_transaction_2 =
        double :fake_transaction_2,
               show_amount: 45,
               show_transaction_type: "debit"
      statement = Statement.new
      statement.running_total(fake_transaction)
      statement.running_total(fake_transaction_2)
      statement.running_total(fake_transaction)
      expect(statement.running_total(fake_transaction_2)).to eq 510
    end

    it "Formats transaction object into string" do
      fake_transaction =
        double :fake_transaction,
               show_amount: 300,
               show_string_date: "03-04-2022",
               show_transaction_type: "credit"
      statement = Statement.new
      expect(
        statement.format_to_string(fake_transaction)
      ).to eq "03/04/2022 || 300.00 || || 300.00"
    end

    it "Formats transaction object into string" do
      fake_transaction =
        double :fake_transaction,
               show_amount: 0.65,
               show_string_date: "05-03-2023",
               show_transaction_type: "credit"
      statement = Statement.new
      expect(
        statement.format_to_string(fake_transaction)
      ).to eq "05/03/2023 || 0.65 || || 0.65"
    end

    it "Formats transaction object into string" do
      fake_transaction =
        double :fake_transaction,
               show_amount: 50.76,
               show_string_date: "10-10-1908",
               show_transaction_type: "debit"
      statement = Statement.new
      expect(
        statement.format_to_string(fake_transaction)
      ).to eq "10/10/1908 || || 50.76 || -50.76"
    end
  end

  it "Can add a optional starting bank balance" do
    statement = Statement.new(2000)
    expect(statement.show_balance).to eq 2000
    statement_2 = Statement.new()
    expect(statement_2.show_balance).to eq 0
  end

  it "Takes array of transaction objects and converts to array of strings" do
    fake_transaction =
      double :fake_transaction,
             show_amount: 300,
             show_string_date: "03-04-2022",
             date_to_object: Date.strptime("03-04-2022", "%d-%m-%Y"),
             show_transaction_type: "credit"

    statement = Statement.new
    statement.add(fake_transaction)
    expect(
      statement.produce_statement[0]
    ).to eq "03/04/2022 || 300.00 || || 300.00"
  end

  it "Takes array of transaction objects and converts to array of strings" do
    fake_transaction =
      double :fake_transaction,
             show_amount: 300,
             show_string_date: "03-04-2022",
             date_to_object: Date.strptime("03-04-2022", "%d-%m-%Y"),
             show_transaction_type: "credit"
    fake_transaction_2 =
      double :fake_transaction_2,
             show_amount: 50.50,
             show_string_date: "01-10-2021",
             date_to_object: Date.strptime("01-10-2021", "%d-%m-%Y"),
             show_transaction_type: "debit"
    statement = Statement.new(250.23)
    statement.add(fake_transaction)
    statement.add(fake_transaction_2)
    statement.add(fake_transaction_2)
    expect(
      statement.produce_statement[2]
    ).to eq "03/04/2022 || 300.00 || || 449.23"
  end
end

#   transaction_1_credit =
#     object_double(
#       :fake_transaction,
#       show_amount: 300,
#       show_string_date: "03-04-2022",
#       date_to_object: Date.strptime("03-04-2022", "%d-%m-%Y"),
#       show_transaction_type: "credit"
#     ),
#     transaction_2_credit =
#       object_double(
#         :fake_ransaction_2,
#         show_amount: 50.50,
#         show_string_date: "01-10-2021",
#         date_to_object: Date.strptime("01-10-2021", "%d-%m-%Y"),
#         show_transaction_type: "credit"
#       )
