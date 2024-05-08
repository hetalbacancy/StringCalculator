module StringCalculator
  def add
    raise_if_input_is_invalid
    raise_if_negative_number
    return numbers.sum
  end

  def raise_if_negative_number
    negatives = numbers.select{ |x| x < 0 }
    if negatives.any?
      raise "Negatives not allowed: #{negatives.join(', ')}"
    end
  end

  def raise_if_input_is_invalid
    if split(delimeter).last == " \n"
      raise "Input is invalid"
    end
  end

  def numbers
    gsub("\n", delimeter).split(delimeter).map { |n| n.to_i }
  end

  def delimeter
    @delimeter ||= self[0,2] == "//" ? delimeter = self[2,1] : ','
  end
end