require "./sptrans_api.cr"
require "./webserver/webserver.cr"

module Dispoli
	VERSION = "0.1.0"

	handlers = Webserver::Handlers.new "xxxxx"

	server = HTTP::Server.new do |context|
		handlers.url_type context
	end

	spawn do
		loop do
			handlers.sptrans_api.update_arrive_list()
			sleep 1.minute
		end
	end

	spawn do
		address = server.bind_tcp 8080
		puts "Listening on http://#{address}"
		server.listen
	end

	sleep

end
