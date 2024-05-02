module StringCalculator
  def add
    return 0 if empty?
    return to_i unless include?(',')
    numbers = split(',').map { |n| n.to_i }
    return numbers.sum
  end
end