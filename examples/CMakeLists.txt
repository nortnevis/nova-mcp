add_executable(server server.cpp)
target_precompile_headers(server REUSE_FROM novamcp::pch)
target_link_libraries(server PRIVATE novamcp::pch novamcp::server)
