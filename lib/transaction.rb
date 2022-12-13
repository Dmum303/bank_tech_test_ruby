class Transaction
  def initialize(amount, date = nil)
    $amount = amount
    $string_date = date
  end

  def show_amount
    $amount
  end

  def show_string_date
    $string_date
  end

  def check_amount_input
    if $amount.is_a? Integer or $amount.is_a? Float
      "Ok"
    else
      fail "Error: only input integers or floats"
    end
  end

  def two_decimal_places
    regex = /^[0-9]*(\.[0-9]{0,2})?$/
    number_to_string = $amount.to_s
    if number_to_string.match(regex) != nil
      "Ok"
    else
      fail "Error: only input floats to two decimal places"
    end
  end

  def date_valid?
    split_date_values_array = $string_date.split
    year = split_date_values_array[2]
    month = split_date_values_array[1]
    day = split_date_values_array[0]
  end
end
