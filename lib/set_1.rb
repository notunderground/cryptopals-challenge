class Set1
  require 'base64'
  require_relative 'tools'
  
  # Challenge 1: Convert hex to base64
  # Cryptopals rule 
  # Always operate on raw bytes, never on encoded strings. Only use hex and base64 for pretty-printing.
  def hex_to_64(str)
    decoded_hex = hex_to_ascii(str) 
    Base64.strict_encode64 decoded_hex
  end
  
  # Challenge 2: Fixed XOR
  # Write a function that takes two equal-length buffers and produces their XOR combination.
  def xor_strings(str1, str2)
    decoded_and_xor = str1.hex ^ str2.hex
    decoded_and_xor.to_s(16)
  end
  
  # Challenge 3: Single-byte XOR cipher
  # The hex encoded string: 1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736
  # ... has been XOR'd against a single character. Find the key, decrypt the message.
  # You can do this by hand. But don't: write code to do it for you.
  # How? Devise some method for "scoring" a piece of English plaintext. 
  # Character frequency is a good metric. Evaluate each output and choose the one with the best score..
  def xor_cypher(str)
    # try rewrite using Array#pack 'H*' or String#unpack
    str_byte_arr = str.scan(/../).map { |h| h.to_i(16) }
    processed_buffers = []
    
    #instead of taking two arrays, take in 1
    string_xor_ascii(processed_buffers, str_byte_arr)
    find_plaintext(processed_buffers)
  end
  
  # Challenge 4: Detect single-character XOR
  # One of the 60-character strings in this file has been encrypted by single-character XOR.
  # Find it.
  def decrypt
    data = Tools.get_data
    potential_payloads = []
    
    data.each do |encrypted|
      potential_payloads << xor_cypher(encrypted)
    end
    
    potential_payloads.flatten(1)
                      .sort { |a,b| a[1] <=> b[1] }
                      .last(5)
  end
  
  # Challenge 5: Implement repeating-key XOR
  # Here is the opening stanza of an important work of the English language:
  # Burning 'em, if you ain't quick and nimble
  # I go crazy when I hear a cymbal
  # Encrypt it, under the key "ICE", using repeating-key XOR.
  # 
  # In repeating-key XOR, you'll sequentially apply each byte of the key; the first
  # byte of plaintext will be XOR'd against I, the next C, the next E, then I again
  # for the 4th byte, and so on.
  # 
  # It should come out to:
  # 0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f
  def repeating_key_xor(string, key)
    counter = 0
    encrypted = []
    string.bytes.each do |byte|
      encrypted << (byte ^ key.bytes[counter])
      
      counter = counter == 2 ? 0 : counter + 1
    end
    # binding.pry
    encrypted.map{ |i| sprintf("%02x", i) }.join.strip
  end
  
  # Challenge 6: Break repeating-key XOR
  def hamming_distance(str1, str2)
    ary1 = str1.unpack('b*')[0].chars
    ary2 = str2.unpack('b*')[0].chars
    ary3 = ary1.zip(ary2)
    differing_bits = 0
    ary3.each do |bits|
      differing_bits += 1 if bits[0] != bits[1]  
    end
    differing_bits
  end
  # public helper methods, todo make into module 
  def self.hex_to_text(str)
    str.scan(/../).map { |c| c.hex.chr }.join 
  end
  
  def find_plaintext(arr)
    scored_sorted = arr.map { |s| [s, score_string(s)] }
                       .sort { |a, b| a[1] <=> b[1] }
    scored_sorted.last(5)
  end
  
  private
  
  def hex_to_ascii(str)
    str.scan(/../).map { |c| c.hex.chr }.join 
  end
  
  def score_string(str)
    str.scan(/[a-zA-Z\s]/).count
  end
  
  def string_xor_ascii(arr, str_arr)
    (0..255).each do |i| 
      arr << Set1.hex_to_text( str_arr.map { |n| n ^ i }.map { |n| n.to_s(16) }.join )
    end
  end
end
