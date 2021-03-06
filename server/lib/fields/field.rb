require 'json'
require 'matrix'

module PegaPega::Fields
	class Field
		attr_reader :width, :height

		def initialize
			@field = Matrix.zero(13, 23)
			@width = @field.column_size * 30
			@height = @field.row_size * 30
		end

		def has_wall?(x, y)
			@field[y,x] == 1 ? true : false
		end

		def get_field
			@field
		end

		def to_json(*a)
		  { "field" => @field.to_a }.to_json(*a)
		end
	end
end
