-spec is_valid(S :: unicode:unicode_binary()) -> boolean().

get_prev(H)->
  if
    H == 41 -> 40;
    H == 93 -> 91;
    H == 125 -> 123;
    true -> 0
  end.

push(stack, Value, Stack) -> [Value | Stack].
top(stack, []) -> [];
top(stack, [H | _]) -> H.
pop(stack, []) -> [];
pop(stack, [_ | T]) -> T.
is_empty(stack, []) -> true;
is_empty(stack, [_]) -> false;
is_empty(stack, [_ | _]) -> false.

action(Value) ->
  case Value of
    40 -> push;
    41 -> pop;
    91 -> push;
    93 -> pop;
    123 -> push;
    125 -> pop
  end.

validate(push, H, T, Stack) ->
  validate(T, push(stack, H, Stack));
validate(pop, H, T, Stack) ->
  case is_empty(stack, Stack) of
    true -> false;
    false ->
      case top(stack, Stack) == get_prev(H) of
        true -> validate(T, pop(stack, Stack));
        false -> false
      end
  end.

validate([], Stack) -> is_empty(stack, Stack);
validate([H | T], Stack) -> 
  validate(action(H), H, T, Stack).

is_valid(S) ->
  validate(binary_to_list(S), []).