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
end
