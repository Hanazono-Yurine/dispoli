require "http"
require "http/server"
require "http/server/handler"
require "../sptrans_api.cr"

module Webserver
	class Handlers
		getter sptrans_api
		def initialize(sptrans_api_token : String)
			@sptrans_api = Sptrans.new sptrans_api_token
			@sockets_list = [] of HTTP::WebSocket

			@public_file_handler = HTTP::StaticFileHandler.new("./src/webserver/files/public")
		end

		def url_type(context)
			if context.request.path == "/get/arrive"
				context.response.content_type = "application/json"
				context.response.print @sptrans_api.arrive_time_json
				return
			end
			if context.request.path.ends_with?("/")
				context.request.path=(context.request.path + "index.html")
				@public_file_handler.call(context)
				return
			else
				@public_file_handler.call(context)
			end
		end
	end

end
