class Transaction
  def initialize(amount)
    $amount = amount
  end

  def show_amount
    $amount
  end

  def check_input
    if $amount != Integer || $amount != Float
      fail "Error: only input integers or floats"
    end
  end
end
