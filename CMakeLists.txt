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
find_or_fetch_dependency(boost_asio 1.92.0 https://github.com/boostorg/asio.git
                         boost-1.92.0 Boost::asio)
find_or_fetch_dependency(
  boost_beast 1.92.0 https://github.com/boostorg/beast.git boost-1.92.0
  Boost::beast)

add_subdirectory(SDK/pch)
add_subdirectory(SDK/server)

if(EXISTS "${PROJECT_SOURCE_DIR}/examples/")
  add_subdirectory(examples)
endif()

if(EXISTS "${PROJECT_SOURCE_DIR}/snippets/")
  add_subdirectory(snippets)
endif()
