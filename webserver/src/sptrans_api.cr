require "http/client"
require "http/headers"
require "http/cookie"

class Sptrans
	@link = "http://api.olhovivo.sptrans.com.br/v2.1"
	@api_token : String | Nil
	@auth_cookie = ""

	getter auth_cookie

	def initialize(@api_token : String | Nil)
		#login()
	end

	def login() : Bool
		response = HTTP::Client.post "#{@link}/Login/Autenticar?token=#{@api_token}"
		if response.body == "true"
			@auth_cookie = response.cookies["apiCredentials"].value
			puts "Okay"
			return true
		end
		return false
	end

end
