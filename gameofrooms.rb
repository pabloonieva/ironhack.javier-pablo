class Game
	attr_accessor :player, :maze
	def initialize(player,maze)
		@player = player
		@maze = maze
	end

	def print_desc_and_door (room)
		puts "#{room.desc} The exit is in the #{room.door}"
	end

	def ask_next_step 
		puts "Which direction you chose? \n > "
		decision = gets.chomp
	end

	def check_exit? (dec,room)
		dec == room.door
	end

	def play
		@maze.each do |room|
			foward = false
			while foward == false && @player.check_if_dead == false
				@player.check_if_dead
				print_desc_and_door (room)
				decision = ask_next_step
				foward = check_exit?(decision,room)
				if foward == false 	
					puts "Foool. You stay here and you loose one life"
					@player.lifes -=1
					puts "One life less, you have #{@player.lifes} \n"
				end
			end	
		end
		if @player.lifes > 0
			puts "FINNISH CRACK"
		else
			puts "GAME OVER"
		end
	end
end

class Room
	attr_accessor :desc, :door
	def initialize (desc,door)
		@desc = desc
		@door = door		
	end
end

class Player
	attr_accessor :lifes, :position
	def initialize (lifes, position)
		@lifes = lifes
		@position = position
	end

	def check_if_dead
		@lifes == 0 	
	end

end

pablo = Player.new(3,1)

r1 = Room.new("You are in the 1 room.", "E")  
r2 = Room.new("You are in room num 2. Its cold!", "S")
r3 = Room.new("You are in room num 3. Its worm!", "E")
r4 = Room.new("You are in room num 4. You are doing a good job!", "E")
r5 = Room.new("You are in room num 5. Last step!", "N")

array_rooms = [r1,r2,r3,r4,r5]

game = Game.new(pablo,array_rooms)

game.play
