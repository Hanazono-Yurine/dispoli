require "./spec_helper"

describe JsonParser do

	describe "#push_to_map" do
		it "JsonParser return test" do
			testJson = %({"hr":"16:09","vs":[{"p":"82512","a":true,"ta":"2023-10-22T19:08:59Z","py":-23.5662345,"px":-46.738654499999996,"sv":null,"is":null},{"p":"82500","a":true,"ta":"2023-10-22T19:08:52Z","py":-23.571716,"px":-46.709317999999996,"sv":null,"is":null}]})

			returnValue = JsonParser.push_to_map(testJson)

			returnValue["hr"].should eq("16:09")
			returnValue["vs"][0]["p"].should eq("82512")
		end
	end

end
