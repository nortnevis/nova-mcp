#include <novamcp/server.hpp>

using namespace novamcp;

int main(int, const char **) {
    BasicServer srv;
    srv.run();
    return 0;
}
