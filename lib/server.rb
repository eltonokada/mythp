require 'socket'

webserver = TCPServer.new("127.0.0.1", 2911)
puts "server listening on port 2911"

loop do                      
  client = webserver.accept       
  begin
    displayfile = File.open('../www/sample/index.html', 'r')
    content = displayfile.read()
    client.print content
  rescue Errno::ENOENT
    client.print "File not found"
  end
  client.close                 
end