require_relative 'helper'
require_relative 'player'

module PegaPega
	class Game
		def initialize(canvasWidth, canvasHeight)
			@players = []
			@canvasWidth = canvasWidth
			@canvasHeight = canvasHeight
		end

		def join(client, msg)
			@players.each { | p | p.safe }
			player = Player.new client, Helper::get_player_name_from_message(msg), @canvasWidth, @canvasHeight
			@players << player
		end

		def move(client, msg)
			player = @players.select { | p | p.client == client }.first
			return unless player != nil
			player.move Helper::get_player_direction_from_message(msg)
		end

		def send_players_info
			@players.each { | p | p.client.send @players.to_json }
		end

		def remove_player(client)
			@players.each { | p | @players.delete p if p.client == client }
		end
		
		def check_collision
			the_catcher = @players.select { | p | p.is_the_catcher? }.first
			return unless the_catcher != nil
			@players.each do | player |
				break if the_catcher.caught? player
			end
		end

	end
end
