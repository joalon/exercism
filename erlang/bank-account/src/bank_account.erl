-module(bank_account).
-behaviour(gen_server).

-export([create/0, balance/1, deposit/2, withdraw/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).

%% API

create() ->
	gen_server:start_link(?MODULE, [0], []).


deposit(BankAccount, Amount) ->
	not_implemented_yet.


withdraw(BankAccount, Amount) -> 
	not_implemented_yet.


balance(BankAccount) ->
	gen_server:call(BankAccount, balance).


%% Implementation

handle_call(balance, _From, Balance) ->
	{ reply, Balance, Balance }.


handle_cast(_,_) ->
	not_implemented_yet.

handle_info(_,_) ->
	not_implemented_yet.

init(_Args) ->
	{ok, 0}.


terminate(_,_) ->
	ok.

code_change(_,_,_) ->
	not_implemented_yet.
