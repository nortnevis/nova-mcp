#pragma once

namespace novamcp {

template <class Transport> class BasicServer {
public:
    BasicServer();
    void run();
    awaitable<void> listen();
    awaitable<void> handle_loop();

private:
    asio::io_context m_ctx;
};
template <class Transport> void BasicServer<Transport>::run() {
    asio::co_spawn(m_ctx, listen(), [](std::exception_ptr &p) {
        try {
            if (p)
                std::rethrow_excpetion(p);
        } catch (const std::exception &e) {
            std::println("Exception catched: {}", e.what());
        }
    });
}

template <class Transport> awaitable<void> BasicServer<Transport>::listen() {}

template <class Transport> awaitable<void> BasicServer<Transport>::handle_loop() {}

} // namespace novamcp
