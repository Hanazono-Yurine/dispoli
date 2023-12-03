require "http/client"
require "http/headers"
require "http/cookie"
require "./json_parser.cr"

class Sptrans
	@link = "api.olhovivo.sptrans.com.br/v2.1"
	@api_token = ""
	@auth_cookie = ""
	@bus_stop = "340015329"
	@arrive_time_json = ""

	getter arrive_time_json
	getter auth_cookie

	def initialize(@api_token : String)
		login()
	end

	def login : Bool
		response = HTTP::Client.post "http://#{@link}/Login/Autenticar?token=#{@api_token}"
		if response.body == "true"
			@auth_cookie = response.cookies["apiCredentials"].value
			return true
		end
		return false
	end

	def login? : Bool
		return true if @auth_cookie != ""
		return false
	end

	private def get_headers()
		headers = HTTP::Headers.new
		headers.add("Cookie", "apiCredentials=#{@auth_cookie}")
	end

	def update_arrive_list()
		return Nil if !login?
		response = HTTP::Client.get("http://#{@link}/Previsao/Parada?codigoParada=#{@bus_stop}", get_headers())
		@arrive_time_json = JsonParser.get_better_json response.body
	end
end
