var PegaPega = PegaPega || {};

PegaPega.TheGame = function() {

	var host = "ws://192.168.1.2:30000";
	var elementsControl = new PegaPega.ElementsControl();
	var socket = new PegaPega.WebSocket();
	var draw = new PegaPega.Draw();

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
		var players = JSON.parse(msg);
		for(var i = 0; i < players.length; i++) {
			var player = players[i].player;
			draw.player(player.name, player.posX, player.posY);
		}
	}
}
