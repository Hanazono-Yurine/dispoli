require "json"

module JsonParser
	extend self

	def get_better_json(json : String)
		data = Hash(String, JSON::Any).from_json(json)
		better_json = [] of JSON::Any
		i = 0
		while i < data["p"]["l"].size
			arriveJsonString = JSON.build do |json|
				json.object do
					json.field "bus", data["p"]["l"][i]["c"]
					json.field "arrive", data["p"]["l"][i]["vs"][0]["t"]
				end
			end
			better_json << JSON.parse(arriveJsonString)
			i += 1
		end
		puts better_json.to_json
		better_json.to_json
	end

end
