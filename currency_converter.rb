# currency converter
require "pry"
class Currency

  def initialize(amount, currency=:usd)
    @amount = amount
    @currency = currency
  end
  
  def amount
    @amount
  end

  def denomination
    @currency
  end

  def to_i
    Integer(@amount)
  end
  
  def times(num)
    Currency.new(@amount * num.to_i, @currency)
  end

  def plus(num)
    Currency.new(@amount + num.to_i, @currency)
  end

  def minus(num)
    Currency.new(@amount - num.to_i, @currency)
  end
  

end

a = Currency.new(5, :usd)
b = Currency.new(10, :usd)
c = Currency.new(5, :gbp)




binding.pry
