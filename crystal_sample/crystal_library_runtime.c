// Implement these in crystal using `fun`
extern void __crystal_library_runtime_constructor();
extern void __crystal_library_runtime_destructor();

// Construct and destructor
static void crystal_library_runtime_constructor() __attribute__((constructor));
static void crystal_library_runtime_destructor() __attribute__((destructor));

void crystal_library_runtime_constructor() {
    __crystal_library_runtime_constructor();
}

void crystal_library_runtime_destructor() {
    __crystal_library_runtime_destructor();
}