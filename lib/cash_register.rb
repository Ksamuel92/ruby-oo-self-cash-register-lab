require "pry"
class CashRegister
    attr_accessor :total, :discount, :items, :last_item_price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    
    #instance methods
    def add_item (item, price, quantity = 1)
        @items.fill(item, @items.size, quantity) #.fill takes three arguments, 1st the item to be "pushed", the index of where the item is to be pushed, and then the quantity of the item
        @total += price * quantity
        @last_item_price = price * quantity
        @total
        # binding.pry
    end

    def apply_discount
        if self.discount == 0
        return "There is no discount to apply."
        else
        @total = @total - (@total * @discount / 100)
        "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        @total -= @last_item_price
    end
end

