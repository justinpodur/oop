class Rover
	attr_accessor :x, :y, :direction
	
	def initialize(x,y,direction)
		@x = x
		@y = y
		@direction = direction
	end

	def greet
		puts "I am a rover and my bearing is #{x}, #{y}, #{direction}"
	end

	def navigate (nasadirections) #Need to read in the NASA directions, and move based on them
		nasadirections.each do |nasadirection|
			if nasadirection=="M"
				if @direction == "N"
					@y+=1
				elsif @direction == "S"
					@y-=1
				elsif @direction == "W"
					@x-=1
				elsif @direction == "E"
					@x+=1
				end
			elsif nasadirection=="L"
				if @direction == "N"
					@direction = "W"
					puts "turned left, now facing #{direction}"
				elsif @direction == "S"
					puts "I am turning left"
					@direction = "E"
					puts "turned left, now facing #{direction}"
				elsif @direction == "W"
					@direction = "S"
					puts "turned left, now facing #{direction}"
				elsif @direction == "E"
					@direction = "N"
					puts "turned left, now facing #{direction}"
				end
			elsif nasadirection == "R"
				if @direction == "N"
					@direction ="E"
				elsif @direction == "S"
					@direction="W"
				elsif @direction=="W"
					@direction="N"
				elsif @direction=="E"
					@direction="S"
				end
			end
		end
	end

end

class Plateau
	attr_reader :upper_right_x, :upper_right_y

	def initialize (upper_right_x, upper_right_y)
		@upper_right_x = upper_right_x
		@upper_right_y = upper_right_y
	end

	def showcorner
		puts "My corners are #{upper_right_x}, #{upper_right_y}"
		puts "My area is #{upper_right_x*upper_right_y}"
	end
end

#read in the inputs
upperright = gets.to_s

#initial bearing 
initialbearing = gets.to_s

#get the NASA moves
nasamoves = gets.chars.to_a

plateau1 = Plateau.new(upperright[0].to_i,upperright[2].to_i)
plateau1.showcorner

rover1=Rover.new(initialbearing[0].to_i,initialbearing[2].to_i,initialbearing[4].to_s)
rover1.greet

# #move the rover around
rover1.navigate(nasamoves)
rover1.greet