var PegaPega = PegaPega || {};

PegaPega.Draw = function() {
	var context = document.getElementById('the-field').getContext('2d');
	var sprite = new Image();

	this.player = function(player) {
		this.field(f);
		drawBlock(player.posX, player.posY, player.width, player.height, player.get_color(), player.lineWidth, player.strokeStyle);
	}

	this.load = function(callback) {
		sprite.onload = callback;
		sprite.src = 'img/sprite.png';
	}
	
	var f; 
	this.field = function(field) {
		f = field;
		for(var y = 0; y < field.length; y++)
		{
			for(var x = 0; x < field[y].length; x++) {
				if(field[y][x] == 0) {
					drawImage(20, 0, x, y);
				}
				else {
					drawImage(0, 0, x, y);
				}
			}
		}
	}
	
	function drawImage(sx, sy, dx, dy) {
		context.drawImage(sprite, sx, sy, 20, 20, dx*20, dy*20, 20, 20);
	}
	
	function drawBlock(x, y, w, h, color, lineWidth, strokeStyle) {
		context.beginPath();
		context.rect(x, y, w, h);
		context.fillStyle =  color;
		context.fill();
		if(lineWidth && strokeStyle) {
			context.lineWidth = lineWidth;
			context.strokeStyle = strokeStyle;
			context.stroke();
		}
	}
}
