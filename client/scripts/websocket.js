var PegaPega = PegaPega || {};

PegaPega.WebSocket = function() {
	var socket;

	this.connect = function(host, onMessageCallback, onOpenCallback) {
		host = "ws://" + host + ":30000";
		socket = new WebSocket(host);

		socket.onmessage = function(resp){
			onMessageCallback(resp.data);
		}

		socket.onopen = function(){
			onOpenCallback();
		}

		socket.onerror = function(err){
			console.log('error: ' + err);
		}
	}

	this.sendMessage = function(msg) {
		socket.send(msg);
	}
}
