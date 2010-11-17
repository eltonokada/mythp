require 'socket'
require 'mythp_response'

webserver = TCPServer.new("localhost", 2911)
config = "sample"
puts "mythp listening on port 2911"

loop do
  session = webserver.accept
  mythp_response = MythpResponse.new(session, config)

  begin
    mythp_response.output
  rescue Errno::ENOENT
    session.print("HTTP/1.1 404/Not Found\r\nContent-type: text/html\r\n\r\n")
  end
  session.close
end