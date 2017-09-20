require 'set_1'
require 'pry'

describe Set1 do
  
  before do 
    @set = Set1.new
  end
  
  describe ".hex_to_64" do
    context "given string of hex returns string base64" do
      it "returns base64 str" do
        start_str = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
        answer_str = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
        
        expect(@set.hex_to_64(start_str)).to eql(answer_str)
      end
    end
  end
  
  describe ".xor_strings" do
    context "given two hex strings produces one xored string" do
      it "returns one xored hex string" do
        str_1 = "1c0111001f010100061a024b53535009181c"
        str_2 = "686974207468652062756c6c277320657965"
        final_str   = "746865206b696420646f6e277420706c6179"
        
        expect(@set.xor_strings(str_1, str_2)).to eql(final_str)
      end
    end
  end
  
  # test not complete / not sure what to test agaisnt don't know outcome
  describe ".xor_cypher" do 
    context "given hex encoded str find the key and decode message" do
      it "returns plaintext from encoded str" do
        encoded_str = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
        
        expect(@set.xor_cypher(encoded_str)).to include(["Cooking MC's like a pound of bacon", 33])
      end
    end
  end
  
  describe ".repeating_key_xor" do
    context "encrypt string with key using xor" do
      it "returns hash" do
        key = "ICE"
        string_1 = "Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal"
        hash_1 = "0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f"
        
        expect(@set.repeating_key_xor(string_1, key)).to eql(hash_1)
      end
    end
  end
  
  describe ".hamming_distance" do
    context "computes amount of differing bits" do
      it "returns integer value" do
        string_1 = "this is a test"
        string_2 = "wokka wokka!!!"
        
        expect(@set.hamming_distance(string_1, string_2)).to eql(37)
      end
    end
  end
end
