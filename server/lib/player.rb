require 'json'

module PegaPega
	class Player
		attr_accessor :name, :posX, :posY, :width, :height, :client, :catcher

		def initialize(client, name, field)
			@client = client
			@name = name
			@field = field
			@posX = Random.new.rand(50..field.width - 50)
			@posY = Random.new.rand(50..field.height - 50)
			@width = 20
			@height = 20
			@speed = 5
			@catcher = true
		end

		def move(direction)
			case direction
				when "up"
					@posY -= @speed
					@posY = 0 if @posY <= 0
				when "down"
					@posY += @speed
					@posY = @field.height - @height if @posY + @height >= @field.height
				when "left"
					@posX -= @speed
					@posX = 0 if @posX <= 0
				when "right"
					@posX += @speed
					@posX = @field.width - @width if @posX + @width >= @field.width
			end
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
			@posX
		end

		def right
			@posX + @width
		end

		def top
			@posY
		end

		def bottom
			@posY + @height
		end

		def to_json(*a)
		  { "player" => { name: @name, posX: @posX, posY: @posY, width: @width, height: @height, isCatcher: is_the_catcher?, isSafe: is_safe? } }.to_json(*a)
		end

	end
end	
