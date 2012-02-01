require 'json'

module PegaPega
	class Player
		attr_accessor :name, :posX, :posY, :width, :height, :client, :catcher

		def initialize(client, name, canvasWidth, canvasHeight)
			@client = client
			@name = name
			@canvasWidth = canvasWidth
			@canvasHeight = canvasHeight
			@posX = Random.new.rand(50..canvasWidth - 50)
			@posY = Random.new.rand(50..canvasHeight - 50)
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
					@posY = @canvasHeight - @height if @posY + @height >= @canvasHeight
				when "left"
					@posX -= @speed
					@posX = 0 if @posX <= 0
				when "right"
					@posX += @speed
					@posX = @canvasWidth - @width if @posX + @width >= @canvasWidth
			end
		end

		def collide_with(player)
			return ((self.left >= player.left && self.left <= player.right) or (player.left >= self.left && player.left <= self.right)) &&
             ((self.top >= player.top && self.top <= player.bottom) or (player.top >= self.top && player.top <= self.bottom))
		end

		def to_json(*a)
		  { "player" => { name: @name, posX: @posX, posY: @posY, isCatcher: @catcher } }.to_json(*a)
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

	end
end	
