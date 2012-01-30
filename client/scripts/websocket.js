var PegaPega = PegaPega || {};

PegaPega.WebSocket = function() {
	var socket;	

	this.connect = function(host, onMessageCallback) {
		socket = new WebSocket(host);

		socket.onmessage = function(resp){
			onMessageCallback(resp.data);
		}

		socket.onopen = function(){
			websocket.sendMessage('Hi');
		}

		socket.onerror = function(err){
			console.log('error: ' + err);
		}
	}

	this.sendMessage = function(msg) {
		socket.send(msg);
	}
}
