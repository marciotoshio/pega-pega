require 'json'
require 'matrix'
require_relative 'field'

module PegaPega::Fields
	class DefaultField < Field

		def initialize
			super
			@field += Matrix[
				[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
				[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
				[1,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,1],
				[1,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,1],
				[1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1],
				[1,0,0,0,0,0,0,0,1,1,1,0,1,1,1,0,0,0,0,0,0,0,1],
				[1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1],
				[1,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,1],
				[1,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,1],
				[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
				[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
				[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
			]

		end
	end
end