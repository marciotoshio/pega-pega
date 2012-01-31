var PegaPega = PegaPega || {};

PegaPega.TheGame = function() {

	var host = "ws://192.168.1.2:30000";
	var elementsControl = new PegaPega.ElementsControl();
	var socket = new PegaPega.WebSocket();

	this.start  = function() {
		elementsControl.init(initCallback);
	}
	
	//private
	function initCallback(playerName) {
		socket.connect(host, onMessage, function() {
			socket.sendMessage("[join]::" + playerName);
		});
	}

	function onMessage(msg) {
		console.log("message from server: " + msg);
	}
}
