class Statement
  def initialize
    $transactions = []
    $running_total_counter = 0
  end

  def add(transaction)
    $transactions.push(transaction)
  end

  def transaction_list
    $transactions
  end

  def sort_by_date
    $transactions =
      $transactions.sort_by { |transaction| transaction.date_to_object }
  end

  def running_total(transaction)
    type = transaction.show_transaction_type
    amount = transaction.show_amount
    if type == "credit"
      $running_total_counter += amount
    else
      $running_total_counter -= amount
    end
    $running_total_counter
  end

  def format_to_string(transaction)
    date_correct = transaction.show_string_date.gsub "-", "/"
    amount = (transaction.show_amount.round(2)) + 0.00
    total = (running_total(transaction).round(2)) + 0.00
    if transaction.show_transaction_type == "credit"
      "#{date_correct} || #{amount} || || #{total}"
    else
      "#{date_correct} || || #{amount} || #{total}"
    end
    # binding.irb
  end
end

# stringTransaction(transactionObject, total) {
#   let date = transactionObject.formattedDate;
#   let amount = transactionObject.amount.toFixed(2);
#   let type = transactionObject.type;
#   if (type === 'credit') {
#     return date + ' || ' + amount + ' || || ' + total.toFixed(2);
#   } else if (type === 'debit') {
#     return date + ' || || ' + amount + ' || ' + total.toFixed(2);
#   }
# }
