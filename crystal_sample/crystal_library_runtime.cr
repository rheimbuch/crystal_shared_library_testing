fun __crystal_library_runtime_constructor() : Void
  LibC.printf "Start __crystal_library_runtime_constructor\n"
  LibC.printf "\tInitializing GC...\n"
  GC.init
  LibC.printf "\tInitialized GC\n\n"
  argv = ["fake-program_name".to_unsafe].to_unsafe
  LibC.printf "\tCalling __crystal_main...\n"
  LibCrystalMain.__crystal_main(1, argv)
  LibC.printf "\tCalled __crystal_main\n"
  LibC.printf "End __crystal_library_runtime_constructor\n"
end

fun __crystal_library_runtime_destructor() : Void
  LibC.printf "Start __crystal_library_runtime_destructor\n"
  AtExitHandlers.run 0
  STDOUT.flush
  STDERR.flush
  LibC.printf "End __crystal_library_runtime_destructor\n"
end