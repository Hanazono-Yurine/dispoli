require "http/client"
require "http/headers"
require "http/cookie"
require "./json_parser.cr"

class Sptrans
	@link = "api.olhovivo.sptrans.com.br/v2.1"
	@api_token = ""
	@auth_cookie = ""

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

	def get_headers()
		headers = HTTP::Headers.new
		headers.add("Cookie", "apiCredentials=#{@auth_cookie}")
	end

	def get_line_arrive_prediction(lineCode : String)
		return Nil if !login?
		response = HTTP::Client.get("http://#{@link}/Previsao/Linha?codigoLinha=#{lineCode}", get_headers())
		JsonParser.push_to_map(response.body)
	end

	def get_line_position(lineCode : String)
		return Nil if !login?
		response = HTTP::Client.get("http://#{@link}/Posicao/Linha?codigoLinha=#{lineCode}", get_headers())
		JsonParser.push_to_map(response.body)
	end

	def get_line_stops(lineCode : String)
		return Nil if !login?
		response = HTTP::Client.get("http://#{@link}/Parada/BuscarParadasPorLinha?codigoLinha=#{lineCode}", get_headers())
		JsonParser.push_to_map(response.body)
	end
end
