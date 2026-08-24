include(FetchContent)

find_or_fetch_dependency(
  simdjson 4.6.6 https://github.com/simdjson/simdjson.git v4.6.6
  simdjson::simdjson)

find_or_fetch_dependency(
  boost_assert 1.91.0 https://github.com/boostorg/assert.git boost-1.91.0
  Boost::assert)

find_or_fetch_dependency(boost_core 1.91.0 https://github.com/boostorg/core.git
                         boost-1.91.0 Boost::core)

FetchContent_Declare(
  capy
  GIT_REPOSITORY https://github.com/cppalliance/capy.git
  GIT_TAG develop
  GIT_SHALLOW TRUE)

FetchContent_Declare(
  corosio
  GIT_REPOSITORY https://github.com/cppalliance/corosio.git
  GIT_TAG develop
  GIT_SHALLOW TRUE)

FetchContent_Declare(
  beast2
  GIT_REPOSITORY https://github.com/cppalliance/beast2.git
  GIT_TAG develop
  GIT_SHALLOW TRUE)

FetchContent_MakeAvailable(capy corosio beast2)
