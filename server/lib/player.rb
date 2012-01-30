module PegaPega
	class Player
		attr_accessor :posX, :posY, :client

		def initialize(client)
				@client = client
		end
	end
end	
