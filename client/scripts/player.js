var PegaPega = PegaPega || {};

PegaPega.Player = function(playerInfo) {
	var currentFrame = {x:0,y:0};
	this.dimension = {width: 30, height: 30};

	this.draw = function(callback) {
		setFrame();
		var pos = this.getPosition();
		callback.call(this, pos.x, pos.y);
	}

	this.getPosition = function() {
		return {x: playerInfo.posX / this.dimension.width, y: playerInfo.posY / this.dimension.height};
	}

	this.getCurrentFrame = function() {
		return currentFrame;
	}

	function setFrame() {
		currentFrame.x = getFrameY();
		currentFrame.y = getFrameX();
	}

	function getFrameX() {
		switch(playerInfo.direction) {
			case 'down':  return 0 + playerStatus();
			case 'left':  return 1 + playerStatus();
			case 'right': return 2 + playerStatus();
			case 'up':    return 3 + playerStatus();
		}
	}

	function playerStatus() {
		if(playerInfo.isCatcher) return 0;
		if(playerInfo.isSafe)    return 4;
		return 8;
	}

	function getFrameY() {
		return playerInfo.frame;
	}
};
