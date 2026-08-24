include(FetchContent)

find_or_fetch_dependency(
  simdjson 4.6.6 https://github.com/simdjson/simdjson.git v4.6.6
  simdjson::simdjson)

find_or_fetch_dependency(
  boost_assert 1.91.0 https://github.com/boostorg/assert.git boost-1.91.0
  Boost::assert)

find_or_fetch_dependency(
  boost_config 1.91.0 https://github.com/boostorg/config.git boost-1.91.0
  Boost::config)

find_or_fetch_dependency(boost_core 1.91.0 https://github.com/boostorg/core.git
                         boost-1.91.0 Boost::core)

find_or_fetch_dependency(
  boost_describe 1.91.0 https://github.com/boostorg/describe.git boost-1.91.0
  Boost::describe)

find_or_fetch_dependency(
  boost_endian 1.91.0 https://github.com/boostorg/endian.git boost-1.91.0
  Boost::endian)

find_or_fetch_dependency(boost_json 1.91.0 https://github.com/boostorg/json.git
                         boost-1.91.0 Boost::json)

find_or_fetch_dependency(boost_mp11 1.91.0 https://github.com/boostorg/mp11.git
                         boost-1.91.0 Boost::mp11)

find_or_fetch_dependency(
  boost_static_assert 1.91.0 https://github.com/boostorg/static_assert.git
  boost-1.91.0 Boost::static_assert)

find_or_fetch_dependency(
  boost_system 1.91.0 https://github.com/boostorg/system.git boost-1.91.0
  Boost::system)

find_or_fetch_dependency(
  boost_throw_exception 1.91.0 https://github.com/boostorg/throw_exception.git
  boost-1.91.0 Boost::throw_exception)

find_or_fetch_dependency(
  boost_type_traits 1.91.0 https://github.com/boostorg/type_traits.git
  boost-1.91.0 Boost::type_traits)

find_or_fetch_dependency(boost_url 1.91.0 https://github.com/boostorg/url.git
                         boost-1.91.0 Boost::url)

find_or_fetch_dependency(
  boost_variant2 1.91.0 https://github.com/boostorg/variant2.git boost-1.91.0
  Boost::variant2)

find_or_fetch_dependency(
  boost_winapi 1.91.0 https://github.com/boostorg/winapi.git boost-1.91.0
  Boost::winapi)

# Not packaged in vcpkg yet: always fetched from GitHub.
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
  http
  GIT_REPOSITORY https://github.com/cppalliance/http.git
  GIT_TAG develop
  GIT_SHALLOW TRUE)

FetchContent_Declare(
  beast2
  GIT_REPOSITORY https://github.com/cppalliance/beast2.git
  GIT_TAG develop
  GIT_SHALLOW TRUE)

FetchContent_MakeAvailable(capy corosio http beast2)
