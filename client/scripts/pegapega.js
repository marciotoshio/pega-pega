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
		var result = JSON.parse(msg);
		for(var i = 0; i < result.length; i++) {
			var player = result[i].player;
			console.log(player.name + " :: posX = " + player.posX + " :: posY = " + player.posY);
			player.posX = parseInt(player.posX) + 10;
			player.posY = parseInt(player.posY) + 5;
			setTimeout(function() {
				socket.sendMessage("[info]::posX=" + player.posX + "::posY=" + player.posY);
			}, 5000);
		}
	}
}
