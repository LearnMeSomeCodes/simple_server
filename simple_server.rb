
require 'socket'

# Create a nice separator for the text output
def sep
  "-" * 40
end

def show(data)
  puts sep
  puts data
  puts sep
  puts
end


server = TCPServer.new 2000 # Server bound to port 2000

loop do
  puts "Waiting for a connection..."
  client = server.accept    # Wait for a client to connect


  puts "Received the following from the client:"
  show(client.gets)


  puts "How would you like to respond?"
  content = gets.chomp

  response = "HTTP/1.1 200 OK
Content-Type: text/plain; charset=ISO-8859-1
Content-Length: #{content.length}

#{content}"

  puts
  puts "Alright.  Sending this response:"
  show(response)

  client.puts response

  client.close
end

