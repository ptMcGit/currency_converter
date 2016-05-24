# currency converter
require "pry"
class Currency

  def initialize(amount, denomination=:usd)
    @amount = amount
    @denomination = denomination
  end

  def amount
    @amount
  end

  def denomination
    @denomination
  end

  def to_i
    Integer(@amount)
  end

  def times(num)
    Currency.new(@amount * num.to_i, @denomination)
  end

  def plus(num)
    Currency.new(@amount + num.to_i, @denomination)
  end

  def minus(num)
    Currency.new(@amount - num.to_i, @denomination)
  end

  def +(num)
    @amount + num.to_i
  end

  def -(num)
    @amount - num.to_i
  end

  def ==(denom)
    @denomination == denom::denomination
  end

end

a = Currency.new(5, :usd)
b = Currency.new(10, :usd)
c = Currency.new(5, :gbp)

binding.pry
