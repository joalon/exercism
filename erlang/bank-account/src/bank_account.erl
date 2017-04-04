-module(bank_account).
-behaviour(gen_server).

-export([create/0, balance/1, deposit/2, withdraw/2, charge/2, close/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).
-export([test_version/0]).

test_version() ->
	1.
%% API

create() ->
	{ok, Pid} = gen_server:start_link(?MODULE, [], []),
	Pid.


deposit(BankAccount, Amount) ->
	{ok, Balance} = gen_server:call(BankAccount, {deposit, Amount}),
	Balance.


withdraw(BankAccount, Amount) -> 
	{ok, WithdrawnAmount} = gen_server:call(BankAccount, {withdraw, Amount}),
	WithdrawnAmount.


balance(BankAccount) ->
	{ok, Balance} = gen_server:call(BankAccount, balance),
	Balance.


charge(BankAccount, Amount) ->
	{ok, Balance} = gen_server:call(BankAccount, {charge, Amount}),
	Amount.


close(BankAccount) ->
	ClosingBalance = balance(BankAccount),
	gen_server:stop(BankAccount),
	ClosingBalance.

%% Implementation

handle_call( balance, _From, Balance ) ->
	{ reply, {ok, Balance}, Balance };

handle_call( { withdraw, Amount }, _From, Balance ) when Amount =< Balance ->
	NewBalance = Balance - Amount,
	{ reply, {ok, NewBalance}, NewBalance };
handle_call( { withdraw, Amount }, _From, Balance) ->

	{ reply, { ok, Balance }, 0};

handle_call( { deposit, Amount }, _From, Balance)  when Amount > 0 ->
	NewBalance = Balance + Amount,
	{ reply, { ok, NewBalance }, NewBalance };
handle_call( { deposit, _Amount }, _From, Balance) ->
	{ reply, { ok, 0 }, Balance};

handle_call( { charge, Amount }, _From, Balance) ->
	NewBalance = Balance - Amount,
	{ reply, { ok, Amount }, NewBalance }.


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
