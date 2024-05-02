module StringCalculator
  def add
    return 0 if empty?
    return to_i unless include?(',')
    raise_if_negative_number
    return numbers.sum
  end

  def raise_if_negative_number
    negatives = numbers.select{ |x| x < 0 }
    if negatives.any?
      raise "Negatives not allowed: #{negatives.join(', ')}"
    end
  end

  def numbers
    gsub("\n", delimeter).split(delimeter).map { |n| n.to_i }
  end

  def delimeter
    ','
  end
end