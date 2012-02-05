var PegaPega = PegaPega || {};

PegaPega.Player = function(playerInfo) {
	this.width = 30;
	this.height = 30;

	this.draw = function(callback) {
		callback(getFrame(), getPosition(this.width, this.height));
	}

	function getPosition(w, h) {
		return {x: playerInfo.posX / w, y: playerInfo.posY / h};
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
