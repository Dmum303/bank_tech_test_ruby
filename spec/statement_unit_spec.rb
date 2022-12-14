require_relative "../lib/statement"

RSpec.describe Statement do
  transaction_1_credit =
    object_double(
      Transaction.new,
      show_amount: 300,
      show_string_date: "03-04-2022",
      date_to_object: Date.strptime("03-04-2022", "%d-%m-%Y"),
      show_transaction_type: "credit"
    ),
    transaction_2_credit =
      object_double(
        Transaction.new,
        show_amount: 50.50,
        show_string_date: "01-10-2021",
        date_to_object: Date.strptime("01-10-2021", "%d-%m-%Y"),
        show_transaction_type: "credit"
      )
  #context
  it "checks double" do
    statement = Statment.new
    expect(transaction_1_credit.show_amount).to eq 300
  end
end
