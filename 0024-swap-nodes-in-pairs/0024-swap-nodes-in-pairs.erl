%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec swap_pairs(Head :: #list_node{} | null) -> #list_node{} | null.

flat(null) -> [];
flat(Head) -> [Head#list_node.val] ++ flat(Head#list_node.next).

swaps([]) -> [];
swaps([_T]) -> [_T];
swaps([H | [Mid | T]]) ->
    [Mid] ++ [H] ++ swaps(T).

mk_list([]) -> null;
mk_list([H|T]) ->
    #list_node{val = H, next = mk_list(T)}.

swap_pairs(null) -> null;
swap_pairs(Head) ->
    mk_list(swaps(flat(Head))).
