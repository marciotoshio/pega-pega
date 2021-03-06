require 'json'

module PegaPega
	class Player
		attr_accessor :client, :position, :frame
		attr_reader :width, :height

		def initialize(client, name, field)
			@width = 30
			@height = 30
			@speed = 5
			@catcher = true
			@client = client
			@name = name
			@field = field
			position = Struct.new :x, :y
			@position = position.new Random.new.rand(50..field.width - 50), Random.new.rand(50..field.height - 50)
			#@position = position.new 30,30
			@direction = :up
			@frame = 0
		end

		def move(direction)
			case direction
				when :up
					@position.y -= @speed
					check_hit_wall :up
				when :down
					@position.y += @speed
					check_hit_wall :down
				when :left
					@position.x -= @speed
					check_hit_wall :left
				when :right
					@position.x += @speed
					check_hit_wall :right
			end
			@direction = direction
			set_frame
		end

		def set_frame
    	@frame += 1
			@frame = 0 if @frame == 3
		end

		def check_hit_wall(direction)
			case direction
				when :up
					@position.y = ((top / @height) * @height) + @height + 1 if hit_wall_top?
				when :down
          @position.y = ((bottom / @height) * @height) - @height - 1 if hit_wall_bottom?
				when :left
					@position.x = ((left / @width) * @width) + @width + 1 if hit_wall_left?
				when :right
					@position.x = ((right / @width) * @width) - @width - 1 if hit_wall_right?
			end
		end

		def hit_wall_right?
			x = right / @width
			y_top = top / @height
			y_bottom = bottom / @height
			@field.has_wall?(x, y_top) or @field.has_wall?(x, y_bottom)
		end

		def hit_wall_left?
			x = left / @width
			y_top = top / @height
			y_bottom = bottom / @height
			@field.has_wall?(x, y_top) or @field.has_wall?(x, y_bottom)
		end 

		def hit_wall_top?
			x_left = left / @width
			x_right = right / @width
			y = top / @height
			@field.has_wall?(x_left, y) or @field.has_wall?(x_right, y)
		end 
		
		 def hit_wall_bottom?
			x_left = left / @width
			x_right = right / @width
			y = bottom / @height
			@field.has_wall?(x_left, y) or @field.has_wall?(x_right, y)
		end

		def caught?(player)
			return if player.is_safe? or self == player

			collided = ((self.left >= player.left && self.left <= player.right) or (player.left >= self.left && player.left <= self.right)) &&
             ((self.top >= player.top && self.top <= player.bottom) or (player.top >= self.top && player.top <= self.bottom))

			if collided
				self.safe
				player.becomes_the_catcher 
			end

			collided
		end

		def is_the_catcher?
			@catcher
		end

		def becomes_the_catcher
			@catcher = true
		end

		def safe
			@safe_time = Time.now
			@catcher = false
		end

		def is_safe?
			return false unless @safe_time
			Time.now < @safe_time + 3
		end

		def left
			@position.x
		end

		def right
			@position.x + @width
		end

		def top
			@position.y
		end

		def bottom
			@position.y + @height
		end

		def to_json(*a)
		  { "player" => { name: @name, posX: @position.x, posY: @position.y, direction: @direction, frame: @frame, isCatcher: is_the_catcher?, isSafe: is_safe? } }.to_json(*a)
		end

	end
end	
