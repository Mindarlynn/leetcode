%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec merge_k_lists(Lists :: [#list_node{} | null]) -> #list_node{} | null.

flat(null) -> [];
flat(List) -> [List#list_node.val] ++ flat(List#list_node.next).

full_flat([]) -> [];
full_flat([H|T]) -> flat(H) ++ full_flat(T).

mk_list([]) -> null;
mk_list([H|T]) -> #list_node{val = H, next = mk_list(T)}.

merge_k_lists(Lists) ->
    mk_list(lists:sort(full_flat(Lists))).