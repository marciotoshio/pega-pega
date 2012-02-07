require_relative 'spec_helper.rb'
require_relative '../server/lib/player'
require_relative '../server/lib/fields/field_for_test'

describe PegaPega::Player do
	before(:each) do
		@field = PegaPega::Fields::FieldForTest.new
		@centerX = @field.width / 2
		@centerY = @field.height / 2
    @player = PegaPega::Player.new nil, "player1", @field
		@catcher = PegaPega::Player.new nil, "catcher", @field
		@speed = 5
		@width = 30
		@height = 30
  end
	
	it "can move up" do
		@player.position.x = @centerX
		@player.position.y = @centerY
		@player.move(:up)
		@player.position.y.should == @centerY - @speed
	end

	it "can move down" do
		@player.position.x = @centerX
		@player.position.y = @centerY
		@player.move(:down)
		@player.position.y.should == @centerY + @speed
	end

	it "can move left" do
		@player.position.x = @centerX
		@player.position.y = @centerY
		@player.move(:left)
		@player.position.x.should == @centerX - @speed
	end

	it "can move right" do
		@player.position.x = @centerX
		@player.position.y = @centerY
		@player.move(:right)
		@player.position.x.should == @centerX + @speed
	end

	it "cannot leave top bound" do
		@player.position.x = @centerX
		@player.position.y = 30
		@player.move(:up)
		@player.position.y.should == 31
	end

	it "cannot leave bottom bound" do
		@player.position.x = @centerX
		@player.position.y = 330
		@player.move(:down)
		@player.position.y.should == 329
	end

	it "cannot leave left bound" do
		@player.position.x = 30
		@player.position.y = @centerY
		@player.move(:left)
		@player.position.x.should == 31
	end

	it "cannot leave right bound" do
		@player.position.x = 630
		@player.position.y = @centerY
		@player.move(:right)
		@player.position.x.should == 629
	end

	it "not caught a player" do
		@player.position.x = 10
		@player.position.y = 10
	
		@catcher.position.x = 100
		@catcher.position.y = 100

		@catcher.caught?(@player).should be false
	end

	it "caught a player from left side" do
		@player.position.x = 100
		@player.position.y = 100
	
		@catcher.position.x = 81
		@catcher.position.y = 100

		@catcher.caught?(@player).should be true
	end

	it "caught a player from right side" do
		@player.position.x = 100
		@player.position.y = 100
	
		@catcher.position.x = 119
		@catcher.position.y = 100

		@catcher.caught?(@player).should be true
	end

	it "caught a player from top" do
		@player.position.x = 100
		@player.position.y = 100
	
		@catcher.position.x = 100
		@catcher.position.y = 81

		@catcher.caught?(@player).should be true
	end

	it "caught a player from bottom" do
		@player.position.x = 100
		@player.position.y = 100
	
		@catcher.position.x = 100
		@catcher.position.y = 119

		@catcher.caught?(@player).should be true
	end

	it "the catcher becomes safe after caugth a player" do
		@player.position.x = 100
		@player.position.y = 100
	
		@catcher.position.x = 100
		@catcher.position.y = 119

		@catcher.caught?(@player)

		@catcher.is_safe?.should be true
		@player.is_the_catcher?.should be true
	end

	it "after 3 seconds the player is not safe anymore", slow: true do
		@player.position.x = 100
		@player.position.y = 100
	
		@catcher.position.x = 100
		@catcher.position.y = 119

		@catcher.caught?(@player)

		sleep 3.1

		@catcher.is_safe?.should be false
		@player.is_the_catcher?.should be true
	end

	it "cannot move right if there's a wall" do
		#there's a wall in 5,3
		@player.position.x = 120
		@player.position.y = 90
		@player.move(:right)
		@player.position.x.should == 119
	end

	it "cannot move left if there's a wall" do
		#there's a wall in 2,1
		@player.position.x = 90
		@player.position.y = 30
		@player.move(:left)
		@player.position.x.should == 91
	end

	it "cannot move up if there's a wall" do
		#there's a wall in 2,2

		@player.position.x = 60
		@player.position.y = 90
		@player.move(:up)
		@player.position.y.should == 91
	end

	it "cannot move down if there's a wall" do
		#there's a wall in 2,9
		@player.position.x = 40
		@player.position.y = 240
		@player.move(:down)
		@player.position.y.should == 239
	end

	it "each movent adds a frame" do
		@player.frame.should == 0
		@player.move(:down)
		@player.frame.should == 1
		@player.move(:down)
		@player.frame.should == 2
	end

	it "after frame 2 back to frame 0" do
    @player.frame.should == 0
		@player.move(:down)
		@player.frame.should == 1
		@player.move(:down)
		@player.frame.should == 2
 		@player.move(:down)
		@player.frame.should == 0
	end
end                   
