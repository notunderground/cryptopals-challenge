class Set1
  # Challenge 1: Convert hex to base64
  # Cryptopals rule 
  # Always operate on raw bytes, never on encoded strings. Only use hex and base64 for pretty-printing.
  require 'base64'

  def self.hex_to_64(str)
    decoded_hex = str.scan(/../).map { |c| c.hex.chr }.join 
    Base64.strict_encode64 decoded_hex
  end
  
  # Challenge 2: Fixed XOR
  # Write a function that takes two equal-length buffers and produces their XOR combination.
  def self.xor_strings(str1, str2)
    decoded_and_xor = str1.to_i(16) ^ str2.to_i(16)
    decoded_and_xor.to_s(16)
  end
  
end
