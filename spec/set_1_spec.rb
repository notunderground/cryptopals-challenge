require 'set_1'

describe Set1 do
  
  describe ".hex_to_64" do
    context "given string of hex returns string base64" do
      it "returns base64 str" do
        start_str = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
        answer_str = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
        
        expect(Set1.hex_to_64(start_str)).to eql(answer_str)
      end
    end
  end
  
  describe ".xor_strings" do
    context "given two hex strings produces one xored string" do
      it "returns one xored hex string" do
        str_1 = "1c0111001f010100061a024b53535009181c"
        str_2 = "686974207468652062756c6c277320657965"
        final_str   = "746865206b696420646f6e277420706c6179"
        
        expect(Set1.xor_strings(str_1, str_2)).to eql(final_str)
      end
    end
  end
end
