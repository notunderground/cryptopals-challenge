class HexToBase64
  # Challenge 1: Convert hex to base64
  #
  # Cryptopals rule 
  # Always operate on raw bytes, never on encoded strings. Only use hex and base64 for pretty-printing.
  require 'base64'

  def hex_to_64 s
    decoded_hex = s.scan(/../).map { |c| c.hex.chr }.join 
    Base64.strict_encode64 decoded_hex
  end
end
