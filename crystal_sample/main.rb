# require 'bundler/inline'

# gemfile do
#   source 'https://rubygems.org'
#   gem 'ffi', '~> 1.12'
# end

require 'ffi'

module Lib
  extend FFI::Library

  LIB_NAME = ('lib.' + FFI::Platform::LIBSUFFIX).freeze

  LIB_PATH = File.expand_path(
    LIB_NAME,
    __dir__
  )

  ffi_lib LIB_PATH

  attach_function :lib_hello, [], :void
  attach_function :lib_add, [:int, :int], :int
end

if __FILE__ == $0
  puts "Calling lib_add"
  result = Lib.lib_add(1, 3)
  puts "result = #{result}"
  puts "Calling lib_hello"
  #Lib.lib_init
  Lib.lib_hello
end