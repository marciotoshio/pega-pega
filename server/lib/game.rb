require_relative 'player'

module PegaPega
	class Game
		attr_accessor :players

		def initialize
			@players = []
		end

		def join(client)
			player = Player.new client
			@players << player
		end

		def remove_player(client)
			@players.each { |p| @players.delete p if p.client == client }
		end

	end
end
