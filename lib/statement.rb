class Statement
  def initialize
    $transactions = []
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
