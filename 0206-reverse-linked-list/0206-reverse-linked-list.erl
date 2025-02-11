%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec reverse_list(Head :: #list_node{} | null) -> #list_node{} | null.

reverse_flat(null) -> [];
reverse_flat(Root) -> reverse_flat(Root#list_node.next) ++ [Root#list_node.val].

build_list([]) -> null;
build_list([H | T]) ->
    #list_node{val = H, next = build_list(T)}.

reverse_list(Head) ->
  build_list(reverse_flat(Head)).