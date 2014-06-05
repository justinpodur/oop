class Item
	attr_accessor :price, :salestaxrate, :aftertax
	attr_reader :name

	def initialize(name,price,salestaxrate,aftertaxprice)
		@name=name
		@price=price
		@salestaxrate=salestaxrate
		@aftertaxprice=aftertaxprice
	end




end