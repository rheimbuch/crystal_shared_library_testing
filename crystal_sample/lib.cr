fun lib_init : Void
  GC.init
  argv = ["fake-program_name".to_unsafe].to_unsafe
  LibCrystalMain.__crystal_main(1, argv)
end

fun lib_hello : Void
  puts "Hello from Crystal"
end
