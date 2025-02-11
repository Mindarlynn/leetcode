-spec roman_to_int(S :: unicode:unicode_binary()) -> integer().

build_new_str([], Str) -> Str;
build_new_str([H1 | [H2 | T]], Str) when [H1] =:= "I", [H2] =:= "V" ->
    build_new_str(T, Str ++ "IIII");
build_new_str([H1 | [H2 | T]], Str) when [H1] =:= "I", [H2] =:= "X" ->
    build_new_str(T, Str ++ "VIIII");
build_new_str([H1 | [H2 | T]], Str) when [H1] =:= "X", [H2] =:= "L" ->
    build_new_str(T, Str ++ "XXXX");
build_new_str([H1 | [H2 | T]], Str) when [H1] =:= "X", [H2] =:= "C" ->
    build_new_str(T, Str ++ "LXXXX");
build_new_str([H1 | [H2 | T]], Str) when [H1] =:= "C", [H2] =:= "D" ->
    build_new_str(T, Str ++ "CCCC");
build_new_str([H1 | [H2 | T]], Str) when [H1] =:= "C", [H2] =:= "M" ->
    build_new_str(T, Str ++ "DCCCC");
build_new_str([H | T], Str) -> 
    build_new_str(T, Str ++ [H]).

rti([], _, Result) -> Result;
rti([H | T], Map, Result) -> rti(T, Map, Result + maps:get([H], Map)).

roman_to_int(S) ->
  Str = binary_to_list(S),
  Map = #{ 
    "I"=>             1,
    "V"=>             5,
    "X"=>             10,
    "L"=>             50,
    "C"=>             100,
    "D"=>             500,
    "M"=>             1000
  },
  rti(build_new_str(Str, []), Map, 0).