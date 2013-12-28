# SPDY Module for mruby
SPDY module for mruby. You can access Web site using SPDY protocol from mruby applications or devices with mruby.

## example
```ruby
r = SPDY::Client.get 'https://www.google.co.jp/'

r
r.body
r.body_length
r.spdy_version
r.stream_id
r.syn_reply
r.syn_stream
```

- response

```ruby
#r
{
    :syn_reply=>{
        "x-frame-options"=>"SAMEORIGIN", 
        "x-xss-protection"=>"1; mode=block", 
        "expires"=>"-1", 
        "p3p"=>"CP=\"This is not a P3P policy! See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657 for more info.\"", 
        "server"=>"gws", 
        "set-cookie"=>"; expires=Sun, 29-Jun-2014 17:16:55 GMT; path=/; domain=.google.co.jp; HttpOnly", 
        ":version"=>"HTTP/1.1", 
        "alternate-protocol"=>"443:quic", 
        "cache-control"=>"private, max-age=0", 
        "content-type"=>"text/html; charset=Shift_JIS", 
        "date"=>"Sat, 28 Dec 2013 17:16:55 GMT", 
        ":status"=>"200 OK"
    }, 
    :recieve_bytes=>953.0, 
    :body=>"<html> - (snip) - </html>", 
    :body_length=>953, 
    :spdy_proto_version=>4, 
    :stream_id=>1, 
    :syn_stream=>{
        ":method"=>"GET", 
        ":path"=>"/", 
        ":scheme"=>"https", 
        ":version"=>"HTTP/1.1", 
        ":host"=>"www.google.co.jp", 
        "accept"=>"*/*", 
        "user-agent"=>"mruby-spdy/0.0.1"
    }
}

#r.body
"<html> - (snip) - </html>"

#r.body_length
953

#r.spdy_version
4

#r.syn_stream
{
  ":method"=>"GET",
  ":path"=>"/",
  ":scheme"=>"https",
  ":version"=>"HTTP/1.1",
  ":host"=>"www.google.co.jp",
  "accept"=>"*/*",
  "user-agent"=>"mruby-spdy/0.0.1"
}

#r.syn_reply
{
  "x-frame-options"=>"SAMEORIGIN",
  "x-xss-protection"=>"1; mode=block",
  "expires"=>"-1",
  "p3p"=>"CP=\"This is not a P3P policy! See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657 for more info.\"",
  "server"=>"gws",
  "set-cookie"=>"; expires=Sun, 29-Jun-2014 17:16:55 GMT; path=/; domain=.google.co.jp; HttpOnly",
  ":version"=>"HTTP/1.1",
  "alternate-protocol"=>"443:quic",
  "cache-control"=>"private, max-age=0",
  "content-type"=>"text/html; charset=Shift_JIS",
  "date"=>"Sat, 28 Dec 2013 17:16:55 GMT",
  ":status"=>"200 OK"
}

```

## install by mrbgems
 - Download

```
git clone https://github.com/mruby/mruby.git
git clone https://github.com/matsumoto-r/mruby-spdy.git
```

 - spdylay build

```
cd mruby-spdy
git submodule init
git submodule update
cd src/spdylay
autoreconf -i
automake
autoconf
./configure
make
cd ../../../
```

 - add conf.gem line to `build_config.rb`

```
cd mruby
```
```ruby
MRuby::Build.new do |conf|

  # ... (snip) ...

  conf.gem '../mruby-spdy'
end
```

 - build

```
rake
```

# License
under the MIT License:

* http://www.opensource.org/licenses/mit-license.php


