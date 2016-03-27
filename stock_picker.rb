def stock_picker(stocks)
	sum = 0
	sell_index = stocks.index(stocks.max)
	buy_index = stocks.index(stocks.min)

	# Worst scenario
	if (buy_index > sell_index) 
		stocks.each_with_index do |buy_price, i|
			# Highest day is first day
			if buy_price == stocks.max
				next
			else
				stocks[i + 1..-1].each.with_index(i + 1) do |sell_price, j|
					if (buy_price > sell_price)
						next
					else
						if sum < sell_price - buy_price
							sum = sell_price - buy_price
							buy_index = i
							sell_index = j
						end
					end
				end
			end
		end
	end

	[buy_index, sell_index].to_s

end

puts stock_picker([17,3,6,9,11,8,6,1,10]) # [7,8]
puts stock_picker([17,3,6,9,15,8,6,1,10]) # [1,4]