class CashRegister
    attr_accessor :discount, :quantity, :cart
    TRANSACTIONS = {}
    
    def initialize(discount=0)
        @total = 0
        @cart = []
        @discount = discount
        @quantity = 1
    end

    def total=(new_total)
        @total = new_total
    end

    def total
        @total
    end
    
    def add_item(title, price, quantity=1)
        @total += (price * quantity)
        @quantity = quantity
        quantity.times do 
            @cart << title
        end
        TRANSACTIONS[title] = [price, quantity]
        return "After the discount, the total comes to $#{@total}."
    end

    def apply_discount()
        if @discount > 0
            diff = (@discount / 100.0) * @total
            @total = (@total -= diff).to_i
            return "After the discount, the total comes to $#{@total}."
        else 
            return "There is no discount to apply."
        end
    end

    def items()
        return @cart
    end

    def void_last_transaction()
        temp = cart.pop
        quantity = TRANSACTIONS[temp][1]
        quantity -= 1
        quantity.times do
            cart.pop
        end

        @total -= (TRANSACTIONS[temp][0] * TRANSACTIONS[temp][1])
    end

end