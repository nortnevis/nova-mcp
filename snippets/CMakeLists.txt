add_executable(func_reflection "reflection.cpp")
target_precompile_headers(func_reflection REUSE_FROM novamcp::pch)
target_link_libraries(func_reflection PRIVATE novamcp::pch)

add_executable(asio "asio.cpp")
target_precompile_headers(asio REUSE_FROM novamcp::pch)
target_link_libraries(asio PRIVATE novamcp::pch)
