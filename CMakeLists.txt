cmake_minimum_required(VERSION 3.31 FATAL_ERROR)
cmake_policy(VERSION 3.31)
set(CMAKE_LANG "en_US.UTF-8")

include(cmake/SetupEnvironment.cmake)

project(
  TemplateProject
  DESCRIPTION "This is a template cmake project."
  VERSION ${GIT_DESCRIBED_TAG}
  LANGUAGES CXX)

include(cmake/CompileFlags.cmake)
find_or_fetch_dependency(
  simdjson 4.6.6 https://github.com/simdjson/simdjson.git v4.6.6
  simdjson::simdjson)

add_library(pch STATIC ${CMAKE_SOURCE_DIR}/pch/pch.cpp)
target_precompile_headers(
  pch PRIVATE "$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_SOURCE_DIR}/pch/pch.hpp>")
target_link_libraries(pch PUBLIC simdjson::simdjson project::options)

file(GLOB_RECURSE hpp_files CONFIGURE_DEPENDS include/*.hpp)
file(GLOB_RECURSE cpp_files CONFIGURE_DEPENDS src/*.cpp)

add_executable(app ${hpp_files} ${cpp_files})
target_precompile_headers(app REUSE_FROM pch)
target_link_libraries(app PRIVATE pch)

if(EXISTS "${PROJECT_SOURCE_DIR}/snippets/")
  add_subdirectory(snippets)
endif()
