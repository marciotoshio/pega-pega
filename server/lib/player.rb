require "json"

module PegaPega
	class Player
		attr_accessor :name, :posX, :posY, :client

		def initialize(client, name)
			@client = client
			@name = name
			@posX = Random.new.rand(0..600) #canvas width
			@posY = Random.new.rand(0..300) #canvas height
		end

		def to_json(*a)
		  { "player" => { name: @name, posX: @posX, posY: @posY } }.to_json(*a)
		end
	end
end	
