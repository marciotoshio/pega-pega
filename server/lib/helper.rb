module PegaPega
	class Helper
		def self.get_player_name_from_message(msg)
			msg[8..-1]
		end
		def self.get_player_direction_from_message(msg)
			msg[8..-1].to_sym
		end
	end
end
