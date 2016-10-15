# gameofrooms.rb

class Room
	attr_accessor :desc, :door
	def initialize (desc,door)
		@desc = desc
		@door = door		
	end

end

r1 = Room.new("You are in the 1 room.", "E")  
r2 = Room.new("You are in room num 2. Its cold!", "S")
r3 = Room.new("You are in room num 3. Its worm!", "E")
r4 = Room.new("You are in room num 4. You are doing good!", "E")
r5 = Room.new("You are in room num 5. Last step!", "N")

# r1.desc = "ola"
# print r1.desc

array_rooms = [r1,r2,r3,r4,r5]

# puts array_rooms

#print array_rooms


class Game 
	def printDescAndDoor (room)
		puts "#{room.desc} The exit is in the #{room.door}"
	end

	def askNextStep 
		puts "Which direction you chose? \n > "
		decision = gets.chomp
	end

	def checkExit? (dec,room)
		if dec == room.door
			return true
		else
			return false
		end
	end

	def play (array)
		array.each do |room|
			avanza = false
			while avanza == false
				printDescAndDoor (room)
				decision = askNextStep
				avanza = checkExit?(decision,room)
				if avanza == false	
					puts "Youuuuu foool. You stay in this room."
				end
			end		
		end
		puts "Finish!!"
	end
end

game = Game.new

game.play(array_rooms)

# printdesc (array_rooms)


