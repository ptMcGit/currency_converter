# currency converter
require "pry"

class Class
  def parse(string)
    string = string.to_s
    currency_symbols={
      "^$"      =>:usd,         # US dollar
      "^\u00A3" =>:gbp,         # Great Britain pound
      "$"       =>:aud          # Australian Dollar
    }

    string = string.gsub(/(^[#{currency_symbols.keys}])/, '^\1')
    amount = string.gsub(/\D/,'').to_i,
    denomination = currency_symbols[string.gsub(/[^#{currency_symbols.keys.join}]/,'')]
  end
 end

class Currency

  def initialize(amount, denomination=:usd)
    @denomination = denomination

    if amount.class == String
      @amount, @denomination = Currency.parse(amount)
    elsif amount.class.ancestors.include? Numeric
      @amount = amount
    end

    if denomination == nil
      @denomination == :usd
    end

  end

  def to(denomination)
    to_usd = {
      :gbp =>1.45,
      :aud =>0.72
    }

    if @denomination != :usd
      @amount = (@amount * to_usd[@denomination]).round 2
      @denomination = :usd
    end

    @amount = (@amount / to_usd[denomination]).round 2
    @denomination = denomination


    binding.pry
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

f = Currency.new("5,000$")
e = Currency.new("$5,000")
d = Currency.new(5, :aud)
a = Currency.new(5, :usd)
b = Currency.new(10, :usd)
c = Currency.new(5, :gbp)

binding.pry
