require "http/server"
require "http/server/handler"

class IndexHandler
  include HTTP::Handler

  def call(context)
    req = context.request
    if req.method == "GET" && req.path == "/"
      filename = "./index.html"
      context.response.content_type = "text/html"
      context.response.content_length = File.size(filename)
      File.open(filename) do |file|
        IO.copy(file, context.response)
      end
      return
    end
    call_next(context)
  end
end

server = HTTP::Server.new([
  HTTP::ErrorHandler.new,
  # HTTP::LogHandler.new,
  # HTTP::CompressHandler.new,
  IndexHandler.new,
  HTTP::StaticFileHandler.new("."),
])

puts "Listening on http://0.0.0.0:8080"

server.bind_tcp "0.0.0.0", 8080
server.listen
