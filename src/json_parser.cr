require "json"

module JsonParser
	extend self

	def get_raw_map(json : String)
		data = Hash(String, JSON::Any).from_json(json)
	end

end
