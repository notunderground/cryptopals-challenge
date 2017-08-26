require 'hex_to_base64'

describe HexToBase64 do
  describe ".hex_to_64" do
    context "given string of hex returns string base64" do
      
      it "returns base64 str" do
        start_str = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
        answer_str = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
        h2b = HexToBase64.new
        expect(h2b.hex_to_64(start_str)).to eql(answer_str)
      end
    
    end
  end
end
