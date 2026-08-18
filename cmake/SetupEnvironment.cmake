# Print some variables
include(CMakePrintHelpers)
cmake_print_variables(CMAKE_TOOLCHAIN_FILE)
cmake_print_variables(CMAKE_CXX_COMPILER_LAUNCHER)

set(CMAKE_CXX_SCAN_FOR_MODULES FALSE)
set(CMAKE_CXX_STANDARD 26)
set(CMAKE_C_STANDARD 23)

include(FetchContent)
macro(find_or_fetch_dependency PACKAGE_NAME MIN_VERSION GIT_REPO
      GIT_REQUIRED_TAG CHECK_TARGET)
  find_package(${PACKAGE_NAME} ${MIN_VERSION} QUIET)

  if(NOT ${PACKAGE_NAME}_FOUND)
    message(
      STATUS
        "${PACKAGE_NAME} (>= ${MIN_VERSION}) not found locally. Fetching via FetchContent..."
    )

    FetchContent_Declare(
      ${PACKAGE_NAME}
      GIT_REPOSITORY ${GIT_REPO}
      GIT_TAG ${GIT_REQUIRED_TAG})

    FetchContent_MakeAvailable(${PACKAGE_NAME})

    if(NOT TARGET ${CHECK_TARGET})
      message(
        FATAL_ERROR
          "FATAL: Dependency '${PACKAGE_NAME}' could not be found system-wide AND FetchContent failed to provide target '${CHECK_TARGET}'!"
      )
    endif()
  else()
    message(
      STATUS "Found ${PACKAGE_NAME} (version: ${${PACKAGE_NAME}_VERSION})")
  endif()
endmacro()

# ccache
find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
  set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
endif()

# Get version
execute_process(
  COMMAND git describe --tags
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  OUTPUT_VARIABLE TAG
  RESULT_VARIABLE OP_RESULT
  OUTPUT_STRIP_TRAILING_WHITESPACE)
if(NOT OP_RESULT EQUAL 0)
  message(FATAL_ERROR "'git describe --tags' returned ${OP_RESULT}")
endif()
string(REGEX MATCH "^([0-9]+)\\.([0-9]+)\\.([0-9]+)" GIT_DESCRIBED_TAG ${TAG})
if(NOT GIT_DESCRIBED_TAG)
  string(REGEX MATCH "^([0-9]+)\\.([0-9]+)\\.([0-9]+)-([0-9]+)"
               GIT_DESCRIBED_TAG ${TAG})
  if(NOT GIT_DESCRIBED_TAG)
    message(
      FATAL_ERROR
        "'git describe --tags' result doesn't match to expected format")
  endif()
  set(TAG_MAJOR "${CMAKE_MATCH_1}")
  set(TAG_MINOR "${CMAKE_MATCH_2}")
  set(TAG_PATCH "${CMAKE_MATCH_3}")
  set(TAG_TWEAK "${CMAKE_MATCH_4}")
  set(GIT_DESCRIBED_TAG "${TAG_MAJOR}.${TAG_MINOR}.${TAG_PATCH}.${TAG_TWEAK}")
endif()
