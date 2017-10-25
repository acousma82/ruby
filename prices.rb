
def total(prices)
    amount = 0
    prices.each {|item| amount += item}
    amount
end

def refund(prices) 
    amount = 0
    prices.each {|item| amount -=item}
    amount
end

def show_discounts(prices)
    prices.each do|item| amount_off = item/3.0 
        puts  format("Your discount: $%.2f", amount_off)
            end
end
        

prices = [2, 4.99, 1.23, 29.99]
puts format("%.2f", total(prices))
puts format("%.2f", refund(prices))
show_discounts(prices)



