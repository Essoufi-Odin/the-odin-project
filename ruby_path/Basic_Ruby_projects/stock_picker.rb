#Implement a method that takes in an array of stock prices, 
#one for each hypothetical day. It should return a pair of 
#days representing the best day to buy and the best day to sell. Days start at 0.
#you need to buy before you sell
#you need to Pay attention to edge cases like when the lowest day is the last day 
#or the highest day is the first day.

def stock_picker(stocks)
max_profit = 0   
possible_combinations = stocks.combination(2).to_a
best_days = nil
possible_combinations.each do |combination|
    buy_index = stocks.index(combination[0])
    sell_index = stocks.index(combination[1])
    profit = combination[1] - combination[0]
    if max_profit < profit
        max_profit = profit
        best_days = [buy_index, sell_index]
    end
end
p best_days , " for a profit of #{stocks[best_days[1]]} - #{stocks[best_days[0]]} == #{max_profit} "
best_days
end
 stock_picker([17,3,6,9,15,8,6,1,10])