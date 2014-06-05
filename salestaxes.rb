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
	attr_accessor :totaltaxes, :totalprice
end

book=Item.new("book",12.49,0.1,0)
book.greet