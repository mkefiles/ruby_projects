=begin
Author: Mike Files
Date: 07/25/2022
Project: Stock Picker
Description:
    - The 'stock_picker()' method should receive an array of stock prices (one for each day).
    - It should return a pair of days representing the best day to buy / sell
    - Days start at 0.
Potential Obstacles:
    - You need to buy before you can sell
    - Edge cases (i.e., the lowest day is the last day or the highest day is the first day)
=end

def stock_picker(stock_prices)

    i = 0
    highest_profit = 0
    buy_day_index = ""
    sell_day_index = ""
    while i < stock_prices.length do
        j = i + 1
        while j < stock_prices.length do
            if (stock_prices[j] - stock_prices[i]) > highest_profit
                highest_profit = stock_prices[j] - stock_prices[i]
                buy_day_index = i
                sell_day_index = j
            end
            j += 1
        end 
        i += 1
    end
    puts "Buy on Day #{buy_day_index}. Sell on Day #{sell_day_index}. Profit should be $#{stock_prices[sell_day_index] - stock_prices[buy_day_index]}.00."
end

stock_picker([17,3,6,9,15,8,6,1,10])