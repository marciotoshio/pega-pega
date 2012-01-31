require_relative 'player'

module PegaPega
	class Game
		def initialize(canvasWidth, canvasHeight)
			@players = []
			@canvasWidth = canvasWidth
			@canvasHeight = canvasHeight
		end

		def join(client, msg)
			@players.each { |p| p.catcher = false }
			player = Player.new client, get_player_name_from_message(msg), @canvasWidth, @canvasHeight
			@players << player
		end

		def move(client, msg)
			players = @players.select {|p| p.client == client}
			if players != nil
				player = players.first
				player.move get_player_direction_from_message(msg)
			end
		end

		def send_players_info()
			@players.each {|p| p.client.send @players.to_json }
		end

		def remove_player(client)
			@players.each { |p| @players.delete p if p.client == client }
		end
		
		def get_player_name_from_message(msg)
			msg[8..-1]
		end

		def get_player_direction_from_message(msg)
			msg[8..-1]
		end
	end
end
