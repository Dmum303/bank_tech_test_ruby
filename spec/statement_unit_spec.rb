require_relative "../lib/statement"
require "date"

RSpec.describe Statement do
  #context
  it "checks add and transaction list methods" do
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
    fake_object = double :fake_object
    statement = Statement.new
    statement.add(fake_object)
    expect(statement.transaction_list).to eq [fake_object]
  end
end
