var PegaPega = PegaPega || {};

PegaPega.Cleaner = function(field) {
  var currentFrame = {x:0,y:12};
  var currentPosition = {x:0,y:0};
  var subject;

  this.cleanAround = function(s) {
    subject = s;
  }

  this.draw = function(callback) {
    var x = Math.round(subject.getCurrentPosition().x);
    var y = Math.round(subject.getCurrentPosition().y);
    clear(x, y, 0, 0, this, callback);
    clearSides(x, y, this, callback);
    clearDiagonals(x, y, this, callback);
  }

  this.getCurrentFrame = function() {
    return currentFrame;
  }
	
	this.getCurrentPosition = function() {
    return currentPosition;
  }

  function clearSides(x, y, that, callback) {
    var k = 0;
    var w = 1;
    for(var i = 0; i < 2; i++) {
      for(var j = 0; j < 2; j++) {
        clear(x, y, k, w, that, callback);
        w = w * -1;
        k = k * -1;
      }
      k = 1;
      w = 0;
    }
  }

  function clearDiagonals(x, y, that, callback) {
    var k = 1;
    var w = 1;
    for(var i = 0; i < 2; i++) {
      for(var j = 0; j < 2; j++) {
        clear(x, y, k, w, that, callback);
        k = k * -1;
      }
      w = w * -1;
    }
  }

  function clear(x, y, k, w, that, callback){
    var newX = x + (k * -1);
    var newY = y + (w * -1);
    setFrame(newX, newY);
    setPosition(newX, newY);
    callback.call(that);
  }

  function setFrame(x, y) {
    if(field.info[y][x] == 0) {
      currentFrame.x = 1;
    }
    else {
      currentFrame.x = 0;
    }
  }

  function setPosition(x, y) {
    currentPosition.x = x;
    currentPosition.y = y;
  }
}
