require "./crystal_library_runtime"

fun lib_add(a : Int32, b : Int32): Int32
  return a + b
end

fun lib_hello : Void
  puts "Hello from Crystal"
end
