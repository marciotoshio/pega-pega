require "json"

module PegaPega
	class Player
		attr_accessor :name, :posX, :posY, :client

		def initialize(client, name)
			@client = client
			@name = name
		end

		def to_json(*a)
		  { "player" => { name: @name, posX: @posX, posY: @posY } }.to_json(*a)
		end
	end
end	
