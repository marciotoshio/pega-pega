var PegaPega = PegaPega || {};

PegaPega.Field = function(fieldInfo) {
  var currentFrame = {x:0,y:12};
  var currentPosition = {x:0,y:0};
	
	this.info = fieldInfo;
  
	this.draw = function(callback) {
    for(var y = 0; y < fieldInfo.length; y++)
    {
      for(var x = 0; x < fieldInfo[y].length; x++) {
        if(fieldInfo[y][x] == 0) {
          currentFrame.x = 1;
        }
        else {
          currentFrame.x = 0;
        }
        currentPosition.x = x;
        currentPosition.y = y;
        callback.call(this);
      }
    }
  }

  this.getCurrentFrame = function() {
    return currentFrame;
  }
	
	this.getCurrentPosition = function() {
    return currentPosition;
  }
};
