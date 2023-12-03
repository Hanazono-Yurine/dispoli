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

		headers = HTTP::Headers.new
		headers.add("Cookie", "apiCredentials=#{@auth_cookie}")
	end

		return Nil if !login?
	end
end
