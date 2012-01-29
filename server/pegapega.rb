require 'eventmachine'
require 'em-websocket'

@clients = []
EventMachine.run do
	EventMachine::WebSocket.start(:host => '0.0.0.0', :port => 30000, :debug => true) do |client|
		client.onopen do
	   	@clients << client
			puts "client connected: " + client.to_s
    end
    
		client.onmessage do |msg|
			puts "message received: " + msg
      @clients.each {|c| c.send "server send: #{msg}"}
    end
    
		client.onclose do
			puts "Bye " + client.to_s
      @clients.delete client
    end
		
		client.onerror do |error|
  		if error.kind_of?(EM::WebSocket::WebSocketError)
    		puts "error: " + error.to_s
  		end
		end
  end
	puts "Server Up..."
end
