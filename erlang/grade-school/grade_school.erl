-module(grade_school).

-compile(export_all).


-record(student, {grade, name}).

new() ->
	[].

add(Student, Grade, Students) ->
	[#student{name = Student, grade = Grade} | Students].

get(Grade, School) ->
	get(Grade, School, []).


get(Grade, [], Acc) ->
	Acc;
get(Grade, [#student{grade = Grade, name = Name}| Rest], Acc) ->
	get(Grade, Rest, [Name | Acc]);
get(Grade, [NonMatchingStudent | Rest], Acc) ->
	get(Grade, Rest, Acc).


sort(Students) ->
	not_implemented_yet.


sort_not_passing_test(Students) ->
	Comp = fun (X, Y) -> {X#student.grade, X#student.name} < {Y#student.grade, Y#student.name} end,
	lists:sort(Comp, Students).
