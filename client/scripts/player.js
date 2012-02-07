var PegaPega = PegaPega || {};

PegaPega.Player = function(playerInfo) {
  var currentFrame = {x:0,y:0};
  var currentPosition = {x:0,y:0};
  var dimension = {width: 30, height: 30};
	setPosition();
	
	this.info = playerInfo;

  this.draw = function(callback) {
    setFrame();
    setPosition();
    callback.call(this);
  }

  this.getCurrentFrame = function() {
    return currentFrame;
  }
	
	this.getCurrentPosition = function() {
    return currentPosition;
  }

	function setPosition() {
    currentPosition.x = playerInfo.posX / dimension.width;
    currentPosition.y = playerInfo.posY / dimension.height;
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