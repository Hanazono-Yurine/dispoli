require "./sptrans_api.cr"
require "./webserver/webserver.cr"

module Dispoli
	VERSION = "0.1.0"

	test = Sptrans.new("")
	if test.login?
	end
end
