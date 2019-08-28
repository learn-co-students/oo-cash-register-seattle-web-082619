class CashRegister
    attr_accessor :total, :discount, :prices, :q
    attr_reader :items


    def initialize(discount=0)
        @total = 0
        @items = []
        @prices = []
        @discount = discount
        @q = 1
    end

    def add_item(i, pr, q=1)
        q.times do 
            @items << i 
            @prices << pr
        end
        pr *= q
        @q = q
        @total += pr
    end

    def apply_discount
        if @discount > 0 
            @total = @total - @total * @discount / 100.0
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        if @prices.length >= 1
            @q.times do 
                @total -= @prices[-1]
                @prices.pop
            end
        else
            return 0.0
        end 
    end

end
