module SPDY
  class Client
    def Client.get(url)
      response_hash = spdy_get(url)
      Response.new(response_hash)
    end
  end
  class Response
    def initialize(response_hash)
      @response = response_hash
    end
    def body; @response[:body]; end
    def body_length; @response[:body_length]; end
    def spdy_version; @response[:spdy_proto_version]; end
    def stream_id; @response[:stream_id]; end
    def syn_reply; @response[:syn_reply]; end
    def syn_stream; @response[:syn_stream]; end
  end
end
