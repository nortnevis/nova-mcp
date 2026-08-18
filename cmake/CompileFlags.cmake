add_library(project_options INTERFACE)
add_library(project::options ALIAS project_options)

target_compile_options(
  project_options
  INTERFACE $<$<OR:$<CXX_COMPILER_ID:GNU>,$<CXX_COMPILER_ID:Clang>>:
            -Wall
            -Wextra
            -Wpedantic
            -Werror=return-type
            -Wconversion
            -Wshadow
            -Wnon-virtual-dtor
            >
            $<$<CXX_COMPILER_ID:MSVC>:
            /W4
            /permissive-
            /w14265 # W4: class has virtual functions, but destructor is not
                    # virtual
            /EHsc
            >)

target_compile_options(
  project_options
  INTERFACE $<$<AND:$<CONFIG:Debug>,$<NOT:$<CXX_COMPILER_ID:MSVC>>>: -g3 -O0 >)
