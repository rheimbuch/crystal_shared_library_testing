require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'ffi', '~> 1.12'
end

module Lib
  extend FFI::Library

  LIB_NAME = ('lib.' + FFI::Platform::LIBSUFFIX).freeze

  LIB_PATH = File.expand_path(
    LIB_NAME,
    __dir__
  )

  ffi_lib LIB_PATH

  attach_function :lib_init, [], :void
  attach_function :lib_hello, [], :void
end

if __FILE__ == $0
  Lib.lib_init
  Lib.lib_hello
end