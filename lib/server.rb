require 'socket'

server = TCPServer.open("127.0.0.1", 2911)  # Socket to listen on port 2000
puts "server listening on port 2911"

loop do                      
  client = server.accept       
  client.puts(Time.now.ctime)  
  client.puts "Closing the connection. Bye!"
  client.close                 
end

