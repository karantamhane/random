require 'socket'

class EchoClient
  def initialize
    #puts 'init'
    @client = Socket.new(:INET, :STREAM)
    @addr = Socket.pack_sockaddr_in(4481, 'localhost')
    #puts 'created socket'
  end

  def write_data
    #puts 'writing'
    @client.connect(@addr)
    5.times do
      client = gets
      #puts client
      @client.write client
      puts @client.readpartial(1024)
    end
    @client.close
  end
end

  client = EchoClient.new
  client.write_data