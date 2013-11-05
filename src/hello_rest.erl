-module(hello_rest).

-export([
    start/0
]).

start() ->
    MyServer = fun
      (get,  "",            _) -> "Hello, world! (bare)";
      (get,  "/",           _) -> "Hello, world! (bare root)";
      (get,  "/index",      _) -> "Hello, world! (index)";
      (get,  "/index.html", _) -> "Hello, world! (index.html)";
      (post, _,             _) -> { 501, "No posts, please" };
      (_,    _,             _) -> { 501, "Not implemented (womp, womp)" }
    end,

    htstub:rest(MyServer, 8080).
