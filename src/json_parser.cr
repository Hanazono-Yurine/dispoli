require "json"

module JsonParser
	extend self

	def push_to_map(json : String)
		data = Hash(String, JSON::Any).from_json(json)
	end

end
