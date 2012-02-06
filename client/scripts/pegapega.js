var PegaPega = PegaPega || {};

PegaPega.TheGame = function() {

	var host = "localhost"; // change this to the address of your server
	var canvasWidth = 690;
	var canvasHeight = 390;
	var elementsControl, socket, draw, cleaner;

	this.start  = function() {
		elementsControl = new PegaPega.ElementsControl();
		socket = new PegaPega.WebSocket();
		elementsControl.init(initCallback);
	}
	
	//private
	function initCallback() {
		socket.connect(host, onMessage, function() {
			window.addEventListener('keydown', onKeyDown, true);
		});
	}

	var theField;
	function onMessage(msg) {
		var result = JSON.parse(msg);
		if(result.field) {
			draw = new PegaPega.Draw();
			theField = new PegaPega.Field(result.field);
			cleaner = new PegaPega.Cleaner(theField);
			draw.loadSprite(function() {
				draw.paint(theField);
				socket.sendMessage("[join]::" + elementsControl.getPlayerName());
			});
		}
		else {
		 	elementsControl.clearPlayerList();
			for(var i = 0; i < result.length; i++) {
				var playerInfo = result[i].player;
				elementsControl.addToLIst(playerInfo);
				var player = new PegaPega.Player(playerInfo);
				cleaner.cleanAround(player);
				draw.paint(cleaner);
				draw.paint(player);
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
};
