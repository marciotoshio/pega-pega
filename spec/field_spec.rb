require 'spec_helper.rb'
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
end
