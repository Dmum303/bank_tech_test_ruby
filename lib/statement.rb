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
end
