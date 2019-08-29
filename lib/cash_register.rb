class CashRegister
    attr_reader :items
    attr_accessor :discount, :total, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @items = []
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        @last_transaction = price * quantity
        @total += @last_transaction
        quantity.times { @items << title }
    end

    def apply_discount
        @total *= (100 - @discount).to_f / 100
        discount != 0 ? "After the discount, the total comes to $#{@total.round}." : "There is no discount to apply."
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end
