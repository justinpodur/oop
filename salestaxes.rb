class Item
	attr_accessor :price, :salestaxrate, :importduty, :aftertaxprice
	attr_reader :name

	def initialize(name,price,salestaxrate,importduty)
		@name=name
		@price=price
		@salestaxrate=salestaxrate
		@importduty = importduty
	end

	def greet
		puts "I'm a #{name}, I cost #{price}.to_s, which is #{price*(1+salestaxrate+importduty)}.to_s after taxes"
	end
end

class Basket
	attr_accessor :itemlist,:totaltaxes, :totalprice

	def initialize(itemlist)
		@itemlist=itemlist
		@totaltaxes=0
		@totalprice=0
	end


	def taxcalc
		@itemlist.each do |item|
			puts "loopin"
			@totaltaxes+=item.price*(item.salestaxrate+item.importduty)
			@totalprice+=item.price
		end
	end

	def receipt
		taxcalc
		puts "Your sales total is #{@totalprice} and you've paid #{@totaltaxes}. Remember taxes pay for services."
	end
end

book=Item.new("book",12.49,0.1,0)
#book = ExemptItem.new("book",12.49,1)
book.greet

cd=Item.new("music CD",16.49,0.1,0)

itemlist=[book,cd]
puts itemlist[0].inspect
puts itemlist[1].inspect

shop=Basket.new(itemlist)
shop.receipt