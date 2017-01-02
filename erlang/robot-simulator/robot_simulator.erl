-module(robot_simulator).
-compile(export_all).

-behaviour(gen_server).


%% Client API %%
create() ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, {undefined, {undefined, undefined}}, []),
	?MODULE.

direction(Name) ->
	gen_server:call(Name, direction).
               
position(Name) ->
	gen_server:call(Name, position).

place(Name, Direction, Position) ->
	gen_server:call(Name, {place, Direction, Position}).

right(Name) ->
	gen_server:call(Name, {turn, right}).

left(Name) ->
	gen_server:call(Name, {turn, left}).

advance(Name) ->
	gen_server:call(Name, advance).

control(Name, CommandList) ->
	gen_server:call(Name, {control, CommandList}).


%% Gen_server API %%
init(Args) ->
	{ok, Args}.


handle_call(direction, _From, {Direction, Position}) ->
	{reply, Direction, {Direction, Position}};

handle_call(position, _From, {Direction, Position}) ->
	{reply, Position, {Direction, Position}};

handle_call(advance, _From, {Direction, _Position} = Data) ->
	{reply, ok, {Direction, move_forward(Data)}};

handle_call({place, NewDirection, NewPosition}, _From, _Data) ->
	{reply, ok, {NewDirection, NewPosition}};

handle_call({turn, TurnTo}, _From, {Direction, Position}) ->
	{reply, ok, {change_direction(Direction, TurnTo), Position}};

handle_call({control, CommandList}, _From, Data) ->
	{reply, ok, execute_commands(CommandList, Data)}.


%% Helpers %%

execute_commands([], Data) ->
	Data;

execute_commands("R" ++ Rest, {Direction, Position}) ->
	execute_commands(Rest, {change_direction(Direction, right), Position});

execute_commands("L" ++ Rest, {Direction, Position}) ->
	execute_commands(Rest, {change_direction(Direction, left), Position});

execute_commands("A" ++ Rest, {Direction, _Position} = Data) ->
	execute_commands(Rest, {Direction, move_forward(Data)} );

execute_commands([Other | Rest], Data) ->
	execute_commands(Rest, Data).


move_forward({north,{X,Y}}) ->
	{X, Y+1};
move_forward({east,{X,Y}}) ->
	{X+1, Y};
move_forward({south,{X,Y}}) ->
	{X, Y-1};
move_forward({west,{X,Y}}) ->
	{X-1, Y}.


change_direction(north, right) ->
	east;
change_direction(north, left) ->
	west;

change_direction(east, right) ->
	south;
change_direction(east, left) ->
	north;

change_direction(south, right) ->
	west;
change_direction(south, left) ->
	east;

change_direction(west, right) ->
	north;
change_direction(west, left) ->
	south.
