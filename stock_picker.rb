def stock_picker (arr)
  buy_day = 0
  sell_day = 0
  max_profit = 0
  arr.each_with_index do |value, i|
    for j in i..(arr.length - 1)
      if (arr[j] - value) > max_profit
        max_profit = arr[j] - value
        buy_day = i
        sell_day = j
      end
    end
  end
  [buy_day, sell_day]
end


# puts stock_picker([17,3,6,9,15,8,6,1,10])
# puts stock_picker([17,3,6,9,15,8,6,1,10,1,18])
# puts stock_picker([1,2,3,4,5,6,7])
# puts stock_picker([1,1,1,1])
