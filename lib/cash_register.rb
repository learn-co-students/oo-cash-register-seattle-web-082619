# discount = 20 ---> total_price = total - total * 20/100
require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items, :prices



  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []



  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @prices << price * quantity
    quantity.times do
      @items << title



    end

  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."

    else
      @total = @total - @total * (@discount.to_f/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def prices
    @prices
  end

  def void_last_transaction
    last_value = self.prices.pop()
    @total = @total - last_value

    if last_value == nil
      @total = 0.0
    end



  end

end
