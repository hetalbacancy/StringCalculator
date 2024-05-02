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

    it "return 3 for 3" do
      expect("3").to add_to(3)
    end
  end

  context "2 Numbers" do
    it "returns 5 for 2,3" do
      expect("2,3").to add_to(5)
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
end