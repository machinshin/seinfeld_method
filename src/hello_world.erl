-module(hello_world).

-export([
    server/1,
    start/0
]).

server(_) ->
    <<"<!doctype html><html><body>Hello, World. Zugzwang!</body></html>">>.

start() ->
    htstub:serve( fun hello_world:server/1, 8080 ).

