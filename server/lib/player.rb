require "json"

module PegaPega
	class Player
		attr_accessor :name, :posX, :posY, :client

		def initialize(client, name)
			@client = client
			@name = name
			@posX = Random.new.rand(0..600) #canvas width
			@posY = Random.new.rand(0..300) #canvas height
			@speed = 5
		end

		def move(direction)
			case direction
				when "up"
					@posY -= 1 * @speed
				when "down"
					@posY += 1 * @speed
				when "left"
					@posX -= 1 * @speed
				when "right"
					@posX += 1 * @speed
			end
		end

		def to_json(*a)
		  { "player" => { name: @name, posX: @posX, posY: @posY } }.to_json(*a)
		end
	end
end	
