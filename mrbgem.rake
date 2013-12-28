MRuby::Gem::Specification.new('mruby-spdy') do |spec|
  spec.license = 'MIT'
  spec.authors = 'MATSUMOTO Ryosuke'
  spec.linker.libraries << ['ssl', 'crypto', 'z']
  spec.linker.flags_before_libraries << "../mruby-spdy/src/spdylay/lib/.libs/libspdylay.a"
  spec.cc.flags << '-I../mruby-spdy/src/spdylay/lib/includes'
end
