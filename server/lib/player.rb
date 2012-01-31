require "json"

module PegaPega
	class Player
		attr_accessor :name, :posX, :posY, :client, :catcher

		def initialize(client, name, canvasWidth, canvasHeight)
			@client = client
			@name = name
			@posX = Random.new.rand(50..canvasWidth - 50)
			@posY = Random.new.rand(50..canvasHeight - 50)
			@speed = 5
			@catcher = true
			@canvasWidth = canvasWidth
			@canvasHeight = canvasHeight
			@playerWidth = 20
			@playerHeight = 20
		end

		def move(direction)
			case direction
				when "up"
					@posY -= @speed
					@posY = 0 if @posY <= 0
				when "down"
					@posY += @speed
					@posY = @canvasHeight - @playerHeight if @posY + @playerHeight >= @canvasHeight
				when "left"
					@posX -= @speed
					@posX = 0 if @posX <= 0
				when "right"
					@posX += @speed
					@posX = @canvasWidth - @playerWidth if @posX + @playerWidth >= @canvasWidth
			end
		end

		def to_json(*a)
		  { "player" => { name: @name, posX: @posX, posY: @posY, isCatcher: @catcher } }.to_json(*a)
		end
	end
end	
