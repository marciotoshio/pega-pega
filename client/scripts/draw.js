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
					drawImage({x:1,y:12}, {x:x,y:y});
				}
				else {
					drawImage({x:0,y:12},{x:x,y:y});
				}
			}
		}
	}

	this.clearAround = function(subject) {
 	 	drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x), y: Math.round(subject.getPosition().y)});  		
		drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x - 1), y: Math.round(subject.getPosition().y)});
		drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x + 1), y: Math.round(subject.getPosition().y)});
		drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x), y: Math.round(subject.getPosition().y - 1)});
		drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x), y: Math.round(subject.getPosition().y + 1)}); 
		drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x - 1), y: Math.round(subject.getPosition().y - 1)});
  	drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x - 1), y: Math.round(subject.getPosition().y + 1)}); 
    drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x + 1), y: Math.round(subject.getPosition().y - 1)}); 
    drawImage({x:1,y:12}, {x: Math.round(subject.getPosition().x + 1), y: Math.round(subject.getPosition().y + 1)});   
	}
	
  function getAdjacent(x, y) {
	
	}

	function drawImage(frame, position) {
		context.drawImage(sprite, frame.x*blockSize, frame.y*blockSize, blockSize, blockSize, position.x*blockSize, position.y*blockSize, blockSize, blockSize);
	}
}
