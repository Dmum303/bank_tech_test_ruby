class Transaction
  def initialize(amount)
    $amount = amount
  end

  def show_amount
    $amount
  end

  def check_input
    if $amount.is_a? Integer or $amount.is_a? Float
      "Ok"
    else
      fail "Error: only input integers or floats"
    end
  end
end
