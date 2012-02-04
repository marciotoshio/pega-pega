var PegaPega = PegaPega || {};

PegaPega.Player = function(playerInfo) {

	this.get_color = function() {
		var color = '#8ED6FF';
		if(playerInfo.isCatcher) color = 'red';
		if(playerInfo.isSafe) color = 'yellow';
		return color;
	}
	
	this.width = 20;
	this.height = 20;
	this.posX = playerInfo.posX;
	this.posY = playerInfo.posY;
	this.last_posX = playerInfo.last_posX;
	this.last_posY = playerInfo.last_posY;
	this.lineWidth = 3;
	this.strokeStyle = 'black';
}
