require_relative 'spec_helper.rb'
require_relative '../server/lib/helper'

describe PegaPega::Helper do
  it "gets the player name from message" do
    playerName = PegaPega::Helper::get_player_name_from_message "[join]::player1"
		playerName.should == "player1"
  end

	it "gets the direction from message" do
		direction = PegaPega::Helper::get_player_direction_from_message "[move]::up"
		direction.should == :up
	end
end
