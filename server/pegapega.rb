require 'eventmachine'
require 'em-websocket'
require_relative 'lib/game'


module PegaPega
	@game = Game.new
	@port = 30000
	
	def self.message(msg)
		puts "PegaPega => #{msg}"
	end

	EventMachine.run do
		EventMachine::WebSocket.start(:host => '0.0.0.0', :port => @port, :debug => true) do |client|
			
			client.onopen do
				@game.join client
				message "client connected: " + client.to_s
		  end
		  
			client.onmessage do |msg|
		    @game.players.each {|p| p.client.send "server send : #{msg}"}
				message "message received: " + msg
		  end
		  
			client.onclose do
		    @game.remove_player client
				message "bye " + client.to_s
		  end
		
			client.onerror do |error|
				if error.kind_of?(EM::WebSocket::WebSocketError)
		  		message "error: " + error.to_s
				end
			end
		end	
		message "Server Up. Runnning on port #{@port}"
	end
end
