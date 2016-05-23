# currency converter
require "pry"
class Currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def amount
    @amount
  end

  def denomination
    @currency
  end
end

a = Currency.new(5, :usd)
b = Currency.new(10, :usd)
c = Currency.new(5, :gbp)




binding.pry
