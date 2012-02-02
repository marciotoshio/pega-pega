var PegaPega = PegaPega || {};

PegaPega.Draw = function() {
	var context = document.getElementById('the-field').getContext('2d');

	this.player = function(player) {
		var color = '#8ED6FF';
		if(player.isCatcher) color = 'red';
		if(player.isSafe) color = 'yellow';
		context.beginPath();
		context.rect(player.posX, player.posY, player.width, player.height);
		context.fillStyle =  color;
		context.fill();
		context.lineWidth = 3;
		context.strokeStyle = 'black';
		context.stroke();
	}

	this.clear = function(canvasWidth, canvasHeight) {
		context.clearRect(0, 0, canvasWidth, canvasHeight);
	}
}
