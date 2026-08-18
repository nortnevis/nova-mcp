#include <print>

namespace tools {

std::string foo(std::string_view email, std::string_view user) {
    std::println("Successfully received email '{}' from '{}'", email, user);
    simdjson::builder::string_builder response;

    response.start_object();
    response.append_key_value("result", "ok");
    response.end_object();

    return std::string(response.c_str());
}

} // namespace tools

template <size_t I, std::meta::info Func>
using param_type_t = typename[:std::meta::type_of(std::meta::parameters_of(Func)[I]):];

template <std::meta::info Func, typename... Args> consteval bool matches_signature() {
    if (std::size(std::meta::parameters_of(Func)) != sizeof...(Args)) {
        return false;
    }

    return []<size_t... Id>(std::index_sequence<Id...>) {
        return (std::is_convertible_v<Args, param_type_t<Id, Func>> && ...);
    }(std::make_index_sequence<sizeof...(Args)>{});
}

template <std::meta::info Func, typename... Args>
concept invocable_reflection = matches_signature<Func, Args...>();

struct Proxy {
    std::string_view name;

    Proxy &operator[](std::string_view func_name) {
        this->name = func_name;
        return *this;
    }

    template <typename... Args> void operator()(Args... args) {
        bool found = false;

        constexpr auto ns_meta = ^^::tools;
        constexpr auto ctx = std::meta::access_context::current();
        template for (constexpr auto member : std::define_static_array(std::meta::members_of(ns_meta, ctx))) {
            if (std::meta::is_function(member) && std::meta::has_identifier(member) &&
                std::meta::identifier_of(member) == this->name) {
                if constexpr (invocable_reflection<member, Args...>) {
                    [:member:](std::forward<Args>(args)...);
                    found = true;
                }
            }
        }
    }
};

namespace js = simdjson;
int main(int, char **) {
    js::ondemand::parser parser;
    auto json = R"({ "method": "foo", "params": {"email": "user@email.com", "name": "user"} })"_padded;
    js::ondemand::document doc = parser.iterate(json);

    std::string_view method = doc["method"];

    js::ondemand::object params = doc["params"];
    std::string_view email = params["email"];
    std::string_view name = params["name"];

    Proxy proxy_func;
    proxy_func["foo"](email, name);

    auto str = tools::foo(email, name);
    std::println("Method: {}", method);
    std::println("Response: {}", str);

    return 0;
}
