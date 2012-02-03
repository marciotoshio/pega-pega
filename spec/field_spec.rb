require_relative 'spec_helper.rb'
require_relative '../server/lib/fields/field'

include PegaPega
include PegaPega::Fields

describe Field do
	before(:all) do
		@field = Field.new
  end

	it 'has a matrix' do
		@field.get_field.should be_kind_of(Matrix)
	end

	it 'has a width of 680' do
		@field.width.should == 680
	end

	it 'has a height of 400' do
		@field.height.should == 400
	end

	it 'has a wall in 0,0' do
		@field.has_wall?(0,0).should be true
	end

	it 'has a wall in 5,3' do
		@field.has_wall?(5,3).should be true
	end

	it 'not has a wall in 1,1' do
		@field.has_wall?(1,1).should be false
	end
end
