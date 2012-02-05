var PegaPega = PegaPega || {};

PegaPega.TheGame = function() {

	var host = "localhost"; // change this to the address of your server
	var canvasWidth = 690;
	var canvasHeight = 390;
	var elementsControl = new PegaPega.ElementsControl();
	var socket = new PegaPega.WebSocket();
	var draw = new PegaPega.Draw();

	this.start  = function() {
		elementsControl.init(initCallback);
	}
	
	//private
	function initCallback(playerName) {
		socket.connect(host, onMessage, function() {
			window.addEventListener('keydown', onKeyDown, true);
		});
	}

	var theField;
	function onMessage(msg) {
		var result = JSON.parse(msg);
		
		if(result.field) {
			theField = result.field;
			draw.load(function() {
				draw.field(theField);
				socket.sendMessage("[join]::" + 'teste');
			});
		}
		else {
			elementsControl.clearPlayerList();
			for(var i = 0; i < result.length; i++) {
				var playerInfo = result[i].player;
				elementsControl.addToLIst(playerInfo);
				draw.player(new PegaPega.Player(playerInfo));
			}
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
