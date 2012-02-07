var PegaPega = PegaPega || {};

PegaPega.Draw = function() {
	var blockSize = 30;
	var context = document.getElementById('the-field').getContext('2d');
	var sprite = new Image();

	this.paint = function(subject) {
		subject.draw(drawImage);
	}

	this.loadSprite = function(callback) {
		sprite.onload = callback;
		sprite.src = 'img/sprite.png';
	}
 
	function drawImage() {
		context.drawImage(sprite, this.getCurrentFrame().x*blockSize, this.getCurrentFrame().y*blockSize, blockSize, blockSize, this.getCurrentPosition().x*blockSize, this.getCurrentPosition().y*blockSize, blockSize, blockSize);
	}
};
