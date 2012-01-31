var PegaPega = PegaPega || {};

PegaPega.ElementsControl = function() {
	
	var callback;

	this.init = function (initCallback) {
		var enterButton = document.getElementById('enter-game');
		enterButton.addEventListener('click', hideStartupShowMain, false);
		enterButton.addEventListener('click', getPlayerName, false);
		
		this.clearPlayerList ();
		
		callback = initCallback;
	}

	this.clearPlayerList = function () {
		var list = document.getElementById('the-list');
		while (list.firstChild) 
			list.removeChild(list.firstChild);
	}
	
	this.addToLIst = function (player) {
		var list = document.getElementById('the-list');
		var item = document.createElement('li');
		item.innerText = player.name;
		if(player.isCatcher) {
			item.className = "catcher";
		}
		list.appendChild(item);
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
