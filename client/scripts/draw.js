var PegaPega = PegaPega || {};

PegaPega.Draw = function() {
	var context = document.getElementById('the-field').getContext('2d');
	var sprite = new Image();

	this.player = function(player) {
		drawBlock(player.posX, player.posY, player.width, player.height, player.get_color(), player.lineWidth, player.strokeStyle);
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
	
	function drawImage(sx, sy, dx, dy) {
		context.drawImage(sprite, sx*30, sy*30, 30, 30, dx*30, dy*30, 30, 30);
	}
	
	function drawBlock(x, y, w, h, color, lineWidth, strokeStyle) {
		context.beginPath();
		context.rect(x, y, w, h);
		context.fillStyle =  color;
		context.fill();
		context.lineWidth = lineWidth;
		context.strokeStyle = strokeStyle;
		context.stroke();
	}
}
