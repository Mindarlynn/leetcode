%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec add_two_numbers(L1 :: #list_node{} | null, L2 :: #list_node{} | null) -> #list_node{} | null.

add_two_numbers(null, null, 0) -> null;
add_two_numbers(null, null, Carry) -> #list_node{val = Carry, next = null};
add_two_numbers(L1, L2, Carry) when (L2 == null) ->
  Add = L1#list_node.val + Carry,
  Div = trunc(Add / 10),
  Rem = Add rem 10,
  #list_node{val = Rem, next = add_two_numbers(L1#list_node.next, null, Div)};
add_two_numbers(L1, L2, Carry) when (L1 == null) ->
  add_two_numbers(L2, null, Carry);
add_two_numbers(L1, L2, Carry) ->
  Add = L1#list_node.val + L2#list_node.val + Carry,
  Div = trunc(Add / 10),
  Rem = Add rem 10,
  #list_node{val = Rem, next = add_two_numbers(L1#list_node.next, L2#list_node.next, Div)}.

add_two_numbers(L1, L2) ->
  add_two_numbers(L1, L2, 0).