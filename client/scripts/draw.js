var PegaPega = PegaPega || {};

PegaPega.Draw = function() {
	var blockSize = 30;
	var context = document.getElementById('the-field').getContext('2d');
	var sprite = new Image();

	this.player = function(player) {
		player.draw(drawImage);
	}

	this.load = function(callback) {
		sprite.onload = callback;
		sprite.src = 'img/sprite.png';
	}
	
	this.field = function(field) {
		for(var y = 0; y < field.length; y++)
		{
			for(var x = 0; x < field[y].length; x++) {
				if(field[y][x] == 0) {
					drawImage(1, 12, x, y);
				}
				else {
					drawImage(0, 12, x, y);
				}
			}
		}
	}
	
	function drawImage(frameX, frameY, dx, dy) {
		context.drawImage(sprite, frameX*blockSize, frameY*blockSize, blockSize, blockSize, dx*blockSize, dy*blockSize, blockSize, blockSize);
	}
}
