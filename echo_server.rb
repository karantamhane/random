require 'socket'

class EchoServer
  def initialize
    @server = TCPServer.new(4481)
  end

  def read_data
    #Use threads
    #puts 'before connection accepted'
    @connection, _ = @server.accept
    #puts 'after acceptance'
    loop do
      #puts 'about to write'
      @connection.write("server also says: #{@connection.readpartial(1024)}")
    end
  end
end

server = EchoServer.new
server.read_data