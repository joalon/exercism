-module(bank_account).
-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).

%% API

create() ->
	not_implemented_yet.


deposit() ->
	not_implemented_yet.


withdraw() -> 
	not_implemented_yet.




%% Implementation
handle_call(_,_,_) ->
	not_implemented_yet.

handle_cast(_,_) ->
	not_implemented_yet.

handle_info(_,_) ->
	not_implemented_yet.

init(_) ->
	not_implemented_yet.

terminate(_,_) ->
	ok.

code_change(_,_,_) ->
	not_implemented_yet.
