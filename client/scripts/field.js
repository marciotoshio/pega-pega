var PegaPega = PegaPega || {};

PegaPega.Field = function(fieldInfo) {
	var currentFrame = {x:0,y:12};
	
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
				callback.call(this, x, y);
			}
		} 
	}

	this.getCurrentFrame = function() {
		return currentFrame;
	}

	this.getField = function() {
		return fieldInfo;
	}
};
