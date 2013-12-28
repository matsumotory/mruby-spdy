assert("SPDY::Response#spdy_version") do
  r = SPDY::Client.get "https://www.google.co.jp/"
  assert_equal(4, r.spdy_version)
end

assert("SPDY::Response#syn_stream") do
  r = SPDY::Client.get "https://www.google.co.jp/"
  assert_equal("GET", r.syn_stream[":method"])
  assert_equal("/", r.syn_stream[":path"])
  assert_equal("https", r.syn_stream[":scheme"])
  assert_equal("HTTP/1.1", r.syn_stream[":version"])
  assert_equal("www.google.co.jp", r.syn_stream[":host"])
  assert_equal("*/*", r.syn_stream["accept"])
end
