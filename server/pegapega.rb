require 'eventmachine'
require 'em-websocket'
require_relative 'lib/game'
#Dir[File.dirname(__FILE__) + 'lib/fields/*.rb'].each { |f| require_relative f.chomp!.chomp!.chomp! }
require_relative 'lib/fields/default_field'

module PegaPega
	game = Game.new Fields::DefaultField.new
	port = 30000
	
	def self.debug_message(msg)
		puts "PegaPega => #{msg}"
	end

	EventMachine.run do
		EventMachine::WebSocket.start(:host => '0.0.0.0', :port => port, :debug => false) do |client|
			
			client.onopen do
				debug_message "client connected: " + client.to_s
				game.send_field client
			end
		  
			client.onmessage do |msg|
				game.join(client, msg) if msg.include? "[join]"
				game.move(client, msg) if msg.include? "[move]"
				game.check_if_catcher_caught_player
				game.send_players_info
				debug_message "message received: " + msg
			end
		  
			client.onclose do
				game.remove_player client
				game.send_players_info
				debug_message "bye " + client.to_s
			end
		
			client.onerror do |error|
				if error.kind_of?(EM::WebSocket::WebSocketError)
					debug_message "error: " + error.to_s
				end
			end
		end	
		debug_message "Server Up. Runnning on port #{port}"
	end
end
