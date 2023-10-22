require "http"
require "http/server"
require "http/server/handler"

module Webserver
	public_file_handler = HTTP::StaticFileHandler.new("./webserver/files/public")

	server = HTTP::Server.new do |context|
		if context.request.path.ends_with?("/")
			context.request.path=(context.request.path + "index.htm")
		end
		public_file_handler.call(context)
	end

	address = server.bind_tcp 8080
	#puts "Listening on http://#{address}"
	#server.listen

end
