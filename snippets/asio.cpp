#include <print>

using namespace boost::asio;
using namespace std::chrono_literals;

awaitable<void> sleep(steady_timer &timer) {
    co_await timer.async_wait();
    std::println("Timer expired");
}

int main(int, const char **) {
    io_context ctx;
    steady_timer timer(ctx);
    timer.expires_after(5s);
    co_spawn(ctx, sleep(timer), [](std::exception_ptr ep) {
        try {
            if (ep) {
                std::rethrow_exception(ep);
            }
        } catch (const std::exception &e) {
            std::println("Exception: {}", e.what());
        } catch (...) {
            std::println("Unknown excpetion");
        }
    });
    std::println("Run io_context");
    ctx.run();
    std::println("Finish io_context");

    return 0;
}
