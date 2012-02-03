require 'spec_helper.rb'
require_relative '../server/lib/helper'
include PegaPega

describe Helper do
  it "gets the player name from message" do
    playerName = Helper::get_player_name_from_message "[join]::player1"
		playerName.should == "player1"
  end

	it "gets the direction from message" do
		direction = Helper::get_player_direction_from_message "[move]::up"
		direction.should == "up"
	end
end
