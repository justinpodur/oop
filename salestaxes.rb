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
		puts "I'm a #{name}, I cost #{price.round(2)}, which is #{price*(1+salestaxrate+importduty).round(2)} after taxes"
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
			@totaltaxes+=item.price*(item.salestaxrate+item.importduty)
			@totalprice+=item.price
		end
	end

	def receipt
		taxcalc
		@itemlist.each do |item|
			puts "1 #{item.name}: #{item.price}"
		end
		puts "Sales taxes: #{@totaltaxes.round(2)}"
		puts "Total is #{@totalprice.round(2)}"
	end
end

book=Item.new("book",12.49,0.1,0)
#book = ExemptItem.new("book",12.49,1)
#book.greet

cd=Item.new("music CD",16.49,0.1,0)
#cd.greet

chocolate=Item.new("chocolate bar",0.85,0.1,0)
#chocolate.greet

itemlist=[book,cd,chocolate]
#puts itemlist[0].inspect
#puts itemlist[1].inspect

shop=Basket.new(itemlist)
shop.receipt