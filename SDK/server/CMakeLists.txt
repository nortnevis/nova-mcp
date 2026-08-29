file(GLOB_RECURSE hpp_files CONFIGURE_DEPENDS include/*.hpp)
file(GLOB_RECURSE cpp_files CONFIGURE_DEPENDS src/*.cpp)

add_library(novamcp_server STATIC ${hpp_files} ${cpp_files})
target_include_directories(novamcp_server PUBLIC include)
target_precompile_headers(novamcp_server REUSE_FROM novamcp::pch)
target_link_libraries(novamcp_server PUBLIC novamcp::pch)

add_library(novamcp::server ALIAS novamcp_server)
