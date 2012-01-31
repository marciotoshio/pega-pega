require "json"

module PegaPega
	class Player
		attr_accessor :name, :posX, :posY, :width, :height :client, :catcher

		def initialize(client, name, canvasWidth, canvasHeight)
			@client = client
			@name = name
			@posX = Random.new.rand(50..canvasWidth - 50)
			@posY = Random.new.rand(50..canvasHeight - 50)
			@speed = 5
			@catcher = true
			@canvasWidth = canvasWidth
			@canvasHeight = canvasHeight
			@width = 20
			@height = 20
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
		
		def colliding_with(player)
			 if @posY +  @height < player.posY
				return false
			if @posY > player.posY + player.height
				return false 
			if @posX + @width < player.posX
				return false 
			if @posX > player.posX + player.width
				return false 
			return true
		end

		def to_json(*a)
		  { "player" => { name: @name, posX: @posX, posY: @posY, isCatcher: @catcher } }.to_json(*a)
		end
	end
end	
