var PegaPega = PegaPega || {};

PegaPega.TheGame = function() {

	var elementsControl = new PegaPega.ElementsControl();
	this.start  = function() {
		elementsControl.init(initCallback);
	}
	
	//private
	function initCallback(playerName) {
		console.log('playerName: ' + playerName);
	}
}
