var PegaPega = PegaPega || {};

PegaPega.ElementsControl = function() {
	
	var callback;

	this.init = function (initCallback) {
		var enterButton = document.getElementById('enter-game');
		enterButton.addEventListener('click', hideStartupShowMain, false);
		enterButton.addEventListener('click', getPlayerName, false);
		callback = initCallback;
	}

	//private
	function hideStartupShowMain(evt) {
		evt.preventDefault();
		hideStartup();
		showMain();
	}
	
	function getPlayerName() {
		var playerName = document.getElementById('player-name').value;
		callback(playerName);
	}
	
	function hideStartup() {
		var screen = document.getElementById('startup-screen');
		screen.style.display = 'none';
	}
	
	function showMain() {
		var screen = document.getElementById('main-screen');
		screen.style.display = 'block';
	}
}
