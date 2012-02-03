var PegaPega = PegaPega || {};

PegaPega.TheGame = function() {

	var host = "192.168.1.2"; // change this to the address of your server
	var canvasWidth = 680;
	var canvasHeight = 400;
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
			window.addEventListener('keydown', onKeyDown, true);
		});
	}

	function onMessage(msg) {
		var players = JSON.parse(msg);
		draw.clear(canvasWidth, canvasHeight);
		elementsControl.clearPlayerList();
		for(var i = 0; i < players.length; i++) {
			var player = players[i].player;
			elementsControl.addToLIst(player);
			draw.player(player);
		}
	}

	function onKeyDown(evt) {
		switch (evt.keyCode) {
		  case 38:  /* Up arrow was pressed */
				socket.sendMessage("[move]::up");
		    break;
		  case 40:  /* Down arrow was pressed */
				socket.sendMessage("[move]::down");
		    break;
		  case 37:  /* Left arrow was pressed */
				socket.sendMessage("[move]::left");
		    break;
		  case 39:  /* Right arrow was pressed */
				socket.sendMessage("[move]::right");
		    break;
		}
	}
}
