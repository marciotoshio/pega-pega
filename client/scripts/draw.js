var PegaPega = PegaPega || {};

PegaPega.Draw = function() {
	var context = document.getElementById('the-field').getContext('2d');

	this.player = function(name, x, y, isCatcher) {
		context.beginPath();
		context.rect(x, y, 20, 20);
		context.fillStyle = isCatcher ? "#FF0000" : "#8ED6FF";
		context.fill();
		context.lineWidth = 3;
		context.strokeStyle = "black";
		context.stroke();
	}

	this.clear = function(canvasWidth, canvasHeight) {
		context.clearRect(0, 0, canvasWidth, canvasHeight);
	}
}
