#include <novamcp/server.hpp>
namespace nv = novamcp;
int main(int, const char **) {
    std::println("Hello, World!");
    nv::BasicServer srv;
    return 0;
}
