require "rubygems"
require "rspec"
$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require "string_calculator"

RSpec::Matchers.define :return_value do |expected|
  match do |input|
    @result = StringCalculator.add(input)
    expect(@result).to eq(expected)
  end

  failure_message do |input|
    "Expected '#{input}' to evaluate to #{expected}, but got #{@result.inspect}"
  end
end

describe StringCalculator do
  it "returns 0 for an empty string" do
    expect("").to return_value(0)
  end

  it "returns the number when input is 1 number" do
    expect("5").to return_value(5)
  end

  it "can calculate the sum of 2 numbers" do
    expect("2,3").to return_value(5)
  end

  it "can calculate the sum of an unknown amount of numbers" do
    expect("3,5,6,4").to return_value(18)
  end

  it "supports comma and newline delimiters" do
    expect("2\n3,4").to return_value(9)
  end
end
