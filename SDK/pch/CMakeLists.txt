add_library(novamcp_pch STATIC src/pch.cpp)
target_precompile_headers(novamcp_pch PRIVATE include/novamcp/pch.hpp)
# "$<$<COMPILE_LANGUAGE:CXX>:pch.hpp>")
target_link_libraries(novamcp_pch PUBLIC simdjson::simdjson Boost::asio
                                         Boost::beast project::options)

target_include_directories(novamcp_pch PUBLIC include)
add_library(novamcp::pch ALIAS novamcp_pch)
