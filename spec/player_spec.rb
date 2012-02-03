require 'spec_helper.rb'
require_relative '../server/lib/player'
require_relative '../server/lib/fields/field'

include PegaPega
include PegaPega::Fields

describe Player do
	before(:each) do
		@field = Field.new
		@centerX = @field.width / 2
		@centerY = @field.height / 2
    @player = Player.new nil, "player1", @field
		@catcher = Player.new nil, "catcher", @field
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
		@player.posY = @field.height
		@player.move("down")
		@player.posY.should == @field.height - @player.height
	end

	it "cannot leave left bound" do
		@player.posX = 0
		@player.posY = @centerY
		@player.move("left")
		@player.posX.should == 0
	end

	it "cannot leave right bound" do
		@player.posX = @field.width
		@player.posY = @centerY
		@player.move("right")
		@player.posX.should == @field.width - @player.width
	end

	it "not caught a player" do
		@player.posX = 10
		@player.posY = 10
	
		@catcher.posX = 100
		@catcher.posY = 100

		@catcher.caught?(@player).should be false
	end

	it "caught a player from left side" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 81
		@catcher.posY = 100

		@catcher.caught?(@player).should be true
	end

	it "caught a player from right side" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 119
		@catcher.posY = 100

		@catcher.caught?(@player).should be true
	end

	it "caught a player from top" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 100
		@catcher.posY = 81

		@catcher.caught?(@player).should be true
	end

	it "caught a player from bottom" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 100
		@catcher.posY = 119

		@catcher.caught?(@player).should be true
	end

	it "the catcher becomes safe after caugth a player" do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 100
		@catcher.posY = 119

		@catcher.caught?(@player)

		@catcher.is_safe?.should be true
		@player.is_the_catcher?.should be true
	end

	it "after 3 seconds the player is not safe anymore", slow: true do
		@player.posX = 100
		@player.posY = 100
	
		@catcher.posX = 100
		@catcher.posY = 119

		@catcher.caught?(@player)

		sleep 3.1

		@catcher.is_safe?.should be false
		@player.is_the_catcher?.should be true
	end
end
