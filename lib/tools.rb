module Tools
  require 'net/http'
  
  def Tools.get_data4
    uri = URI("http://cryptopals.com/static/challenge-data/4.txt")
    
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri
      response = http.request request
      
      return response.body.split("\n")
    end
  end
  
  def Tools.get_data6
    uri = URI("http://cryptopals.com/static/challenge-data/6.txt")
    
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri
      response = http.request request
      
      return response.body.split("\n")
    end
  end
end