class Set1
  require 'base64'
  
  # Challenge 1: Convert hex to base64
  # Cryptopals rule 
  # Always operate on raw bytes, never on encoded strings. Only use hex and base64 for pretty-printing.
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
  
  # Challenge 3: Single-byte XOR cipher
  # The hex encoded string: 1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736
  # ... has been XOR'd against a single character. Find the key, decrypt the message.
  # You can do this by hand. But don't: write code to do it for you.
  # How? Devise some method for "scoring" a piece of English plaintext. 
  # Character frequency is a good metric. Evaluate each output and choose the one with the best score.
  def self.xor_cypher(str)
    
  end
  
  def self.hex_to_text(str)
    str.scan(/../).map { |c| c.hex.chr }.join 
  end
end
