var PegaPega = PegaPega || {};

PegaPega.Draw = function() {
	var context = document.getElementById('the-field').getContext('2d');

	this.player = function(player) {
		drawFloor(player.last_posX / 20, player.last_posY / 20);
		drawBlock(player.posX, player.posY, player.width, player.height, player.get_color(), player.lineWidth, player.strokeStyle);
	}
	
	this.field = function(field) {
		for(var y = 0; y < field.length; y++)
		{
			for(var x = 0; x < field[y].length; x++) {
				if(field[y][x] == 0) {
					drawFloor(x, y);
				}
				else {
					drawWall(x, y);
				}
			}
		}
	}
	
	function drawFloor(x, y) {
		drawBlock(x*20, y*20, 20, 20, '#AAFFAA', 0, 'none');
	}
	
	function drawWall(x, y) {
		drawBlock(x*20, y*20, 20, 20, '#CCCCCC', 0, 'none');
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
