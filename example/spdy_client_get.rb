r = SPDY::Client.get 'https://www.google.co.jp/'

r.body
r.body_length
r.spdy_version
r.stream_id
r.syn_reply
r.syn_stream
