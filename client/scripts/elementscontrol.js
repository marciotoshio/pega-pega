var PegaPega = PegaPega || {};

PegaPega.ElementsControl = function() {
	
	this.init = function (initCallback) {
		var enterButton = document.getElementById('enter-game');
		enterButton.addEventListener('click', hideStartupShowMain, false);
		enterButton.addEventListener('click', initCallback, false);
		this.clearPlayerList();	
	}

	this.getPlayerName = function() {
		return document.getElementById('player-name').value;
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
		if(player.isCatcher) item.appendChild(createLabel('important', 'catcher'));
		if(player.isSafe) item.appendChild(createLabel('warning', 'safe'));
		list.appendChild(item);
	}
	
	//private
	function createLabel(type, text) {
		var label = document.createElement('span');
		label.className = "label label-" + type;
		label.innerText = text;
		return label;
	}

	function hideStartupShowMain(evt) {
		evt.preventDefault();
		hideStartup();
		showMain();
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
