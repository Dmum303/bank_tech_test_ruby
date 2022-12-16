class Statement
  def initialize(starting_balance = 0)
    @transactions = []
    @running_total_counter = starting_balance
  end

  def add(transaction)
    @transactions.push(transaction)
  end

  def transaction_list
    @transactions
  end

  def sort_by_date
    @transactions =
      @transactions.sort_by { |transaction| transaction.date_to_object }
  end

  def running_total(transaction)
    type = transaction.show_transaction_type
    amount = transaction.show_amount
    if type == "credit"
      @running_total_counter += amount
    else
      @running_total_counter -= amount
    end
    @running_total_counter
  end

  def format_to_string(transaction)
    date_correct = transaction.show_string_date.gsub "-", "/"
    amount = sprintf "%.2f", transaction.show_amount
    total = sprintf "%.2f", running_total(transaction)
    if transaction.show_transaction_type == "credit"
      "#{date_correct} || #{amount} || || #{total}"
    else
      "#{date_correct} || || #{amount} || #{total}"
    end
  end

  def show_balance
    @running_total_counter
  end

  def produce_statement
    sort_by_date
    string_transactions_array =
      @transactions.map { |transaction| format_to_string(transaction) }
    string_transactions_array
  end

  def return_statement
    final_statement = produce_statement
    final_statement.unshift "date || credit || debit || balance"
    final_statement.join("\n")
  end
end
