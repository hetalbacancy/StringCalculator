require 'rails_helper'
RSpec::Matchers.define :add_to do |expected|
  match do |string|
    string.extend(StringCalculator).add == expected
  end
end

describe StringCalculator, "#add" do

  it "returns 0 for emplty string" do
    expect("").to add_to(0)
  end

  context "Single Numbers" do
    it "return 0 for 0" do
      expect("0").to add_to(0)
    end

    it "return 1 for 1" do
      expect("1").to add_to(1)
    end
  end

  context "2 Numbers" do
    it "returns 6 for 1,5" do
      expect("1,5").to add_to(6)
    end

    it "returns 12 for 8,4" do
      expect("8,4").to add_to(12)
    end
  end

  context "3 Numbers" do
    it "returns 25 for 10,8,7" do
      expect("10,8,7").to add_to(25)
    end

    it "returns 50 for 20,10,20" do
      expect("20,10,20").to add_to(50)
    end
  end

  it "supports new line as a delimeter" do
    expect("1\n2").to add_to(3)
  end

  it "supports mixed a delimeter" do
    expect("1\n2, 3").to add_to(6)
  end

  it "invalid input" do
    lambda {"1, \n".extend(StringCalculator).add}.should raise_error("Input is invalid")
  end

  it "supports other a delimeter" do
    expect("//;\n1;2").to add_to(3)
  end

  context "negative niumbers" do
    it "raise an exception if finds negative numbers" do
      lambda {"-1".extend(StringCalculator).add}.should raise_error
    end

    it "include negative numbers in message" do
      lambda {"-1,25,-42".extend(StringCalculator).add}.should raise_error("Negatives not allowed: -1, -42")
    end
    
  end
end