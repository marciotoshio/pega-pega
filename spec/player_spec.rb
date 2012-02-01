require_relative '../server/lib/player'
include PegaPega

describe Player do
	before(:each) do
		@canvasWidth = 690
		@canvasHeight = 400
		@centerX = @canvasWidth / 2
		@centerY = @canvasHeight / 2
    @player = Player.new nil, "player1", @canvasWidth, @canvasHeight
		@catcher = Player.new nil, "catcher", @canvasWidth, @canvasHeight
  end
	
	it "can move up" do
		@player.posX = @centerX
		@player.posY = @centerY
		@player.move("up")
		@player.posY.should == @centerY - 5
	end

	it "can move down" do
		@player.posX = @centerX
		@player.posY = @centerY
		@player.move("down")
		@player.posY.should == @centerY + 5
	end

	it "can move left" do
		@player.posX = @centerX
		@player.posY = @centerY
		@player.move("left")
		@player.posX.should == @centerX - 5
	end

	it "can move right" do
		@player.posX = @centerX
		@player.posY = @centerY
		@player.move("right")
		@player.posX.should == @centerX + 5
	end

	it "cannot leave top bound" do
		@player.posX = @centerX
		@player.posY = 0
		@player.move("up")
		@player.posY.should == 0
	end

	it "cannot leave bottom bound" do
		@player.posX = @centerX
		@player.posY = @canvasHeight
		@player.move("down")
		@player.posY.should == @canvasHeight - @player.height
	end

	it "cannot leave left bound" do
		@player.posX = 0
		@player.posY = @centerY
		@player.move("left")
		@player.posX.should == 0
	end

	it "cannot leave right bound" do
		@player.posX = @canvasWidth
		@player.posY = @centerY
		@player.move("right")
		@player.posX.should == @canvasWidth - @player.width
	end

	it "not caught a player" do
		@player.posX = 10
		@player.posY = 10
	
		@catcher.posX = 100
		@catcher.posY = 100

		@catcher.collide_with(@player).should be false
	end

	it "caught a player from left side" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 81
		@catcher.posY = 100

		@catcher.collide_with(@player).should be true
	end

	it "caught a player from right side" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 119
		@catcher.posY = 100

		@catcher.collide_with(@player).should be true
	end

	it "caught a player from top" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 100
		@catcher.posY = 81

		@catcher.collide_with(@player).should be true
	end

	it "caught a player from bottom" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 100
		@catcher.posY = 119

		@catcher.collide_with(@player).should be true
	end
end
