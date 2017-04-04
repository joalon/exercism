-module(bank_account).
-behaviour(gen_server).

-export([create/0, deposit/2, withdraw/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).

%% API

create() ->
	gen_server:start_link(?MODULE, [], []).


deposit(BankAccount, Amount) ->
	not_implemented_yet.


withdraw(BankAccount, Amount) -> 
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
