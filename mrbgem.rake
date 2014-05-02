MRuby::Gem::Specification.new('mruby-spdy') do |spec|
  spec.license = 'MIT'
  spec.authors = 'MATSUMOTO Ryosuke'
  spec.version = '0.0.1'
  spec.summary = 'SPDY Client and Server Module'
  spec.linker.libraries << ['ssl', 'crypto', 'z', 'event', 'event_openssl']

  require 'open3'

  spdylay_dir = "#{build_dir}/spdylay"
  spdylay_lib = "#{build_dir}/spdylay/lib/.libs"
  libspdylaya = "#{spdylay_lib}/libspdylay.a"
  if ENV['SPDYLAY_CURRENT'] != "true"
    spdylay_ver = "0daafd53e4d3063f5bb602e0f7b3809133226b5e"
  end

  def run_command env, command
    STDOUT.sync = true
    puts "mruby-spdy build: [exec] #{command}"
    Open3.popen2e(env, command) do |stdin, stdout, thread|
      print stdout.read
      fail "#{command} failed" if thread.value != 0
    end
  end

  FileUtils.mkdir_p build_dir

  if ! File.exists? spdylay_dir
    Dir.chdir(build_dir) do
    e = {}
      run_command e, 'git clone https://github.com/tatsuhiro-t/spdylay.git'
    end
  end

  if ! File.exists? libspdylaya
    Dir.chdir spdylay_dir do
      e = {}
    if ENV['SPDYLAY_CURRENT'] != "true"
      run_command e, "git checkout #{spdylay_ver} ."
    end
      run_command e, 'git submodule init'
      run_command e, 'git submodule update'
      run_command e, 'autoreconf -i'
      run_command e, 'automake'
      run_command e, 'autoconf'
      run_command e, './configure'
      run_command e, 'make'
    end
  end

  spec.linker.flags_before_libraries << libspdylaya
  spec.cc.flags << "-I#{spdylay_dir}/lib/includes"
end
