#pragma once

#include <chrono>
#include <concepts>
#include <functional>
#include <iostream>
#include <meta>
#include <print>
#include <string>
#include <utility>
#include <vector>

#include <boost/asio.hpp>
#include <boost/beast.hpp>
#include <simdjson.h>

namespace novamcp {

using namespace boost;
using asio::awaitable;
using asio::co_spawn;
using asio::use_awaitable;

} // namespace novamcp
