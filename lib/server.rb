require 'socket'

webserver = TCPServer.new("127.0.0.1", 2911)
puts "mythp listening on port 2911"

loop do
  session = webserver.accept  
  request = session.gets     
  request_path = request.split[1]
  begin
    session.print File.open("../www/sample#{request_path}", "r").read
  rescue Errno::ENOENT
    session.print("HTTP/1.1 404/Not Found\r\nContent-type: text/html\r\n\r\n")
  end
  session.close                 
end