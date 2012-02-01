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
			@players.each { | p | p.catcher = false }
			player = Player.new client, Helper::get_player_name_from_message(msg), @canvasWidth, @canvasHeight
			@players << player
		end

		def move(client, msg)
			players = @players.select { | p | p.client == client }
			return unless players != nil
			player = players.first
			player.move Helper::get_player_direction_from_message(msg)
		end

		def send_players_info
			@players.each { | p | p.client.send @players.to_json }
		end

		def remove_player(client)
			@players.each { | p | @players.delete p if p.client == client }
		end
		
		def check_collision
			players = @players.select { | p | p.catcher }
			return unless players != nil
			the_catcher = players.first
			@players.each do | player |
				if the_catcher != player and the_catcher.collide_with player
					the_catcher.catcher = false
					player.catcher = true
					break
				end
			end
		end

	end
end
