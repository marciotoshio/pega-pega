var PegaPega = PegaPega || {};

PegaPega.ElementsControl = function() {
	this.init = function() {
		bindEnterGame();
	}

	//private
	function bindEnterGame() {
		var button = document.getElementById('enter-game');
		button.addEventListener('click', function() {
			hideStartup();
			showMain();
			return false;
		});
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
