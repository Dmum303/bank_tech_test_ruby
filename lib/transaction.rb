require "date"
class Transaction
  def initialize(amount, date = nil, type = nil)
    $amount = amount
    $string_date = date
    $type = type
  end

  def show_amount
    $amount
  end

  def show_string_date
    $string_date
  end

  def date_to_object
    date_object = Date.strptime($string_date, "%d-%m-%Y")
    date_object
  end

  def show_transaction_type
    $type
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
    split_date_values_array = $string_date.split("-")
    year = split_date_values_array[2].to_i
    month = split_date_values_array[1].to_i
    day = split_date_values_array[0].to_i
    Date.valid_date?(year, month, day)
  end

  def is_date_string?
    if $string_date.is_a? String
      "Ok"
    else
      fail "Error: date must be a string input in dd-mm-year format"
    end
  end

  def check_type_correct
    if $type == "credit" or $type == "debit"
      "Ok"
    else
      fail "Error: only input credit or debit"
    end
  end

  def check_all_data_input
    if check_amount_input == "Ok" && two_decimal_places == "Ok" &&
         date_valid? && is_date_string? == "Ok" && check_type_correct == "Ok"
      true
    else
      false
    end
  end
end
