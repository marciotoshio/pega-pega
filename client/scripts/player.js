var PegaPega = PegaPega || {};

PegaPega.Player = function(playerInfo) {
	this.dimension = {width: 30, height: 30};

	this.draw = function(callback) {
		callback(getFrame(), this.getPosition());
	}

	this.getPosition = function() {
		return {x: playerInfo.posX / this.dimension.width, y: playerInfo.posY / this.dimension.height};
	}

	function getFrame() {
		return {x: getFrameY(), y: getFrameX()};
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
}
