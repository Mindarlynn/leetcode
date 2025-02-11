%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec remove_nth_from_end(Head :: #list_node{} | null, N :: integer()) -> #list_node{} | null.

list_length(null) -> 0;
list_length(Root) -> 1 + list_length(Root#list_node.next).

remove_nth_from_end(null, Target, Idx) -> 
    null;
remove_nth_from_end(Head, Target, Idx) when (Target == Idx) -> 
    remove_nth_from_end(Head#list_node.next, Target, Idx + 1);
remove_nth_from_end(Head, Target, Idx) ->
    #list_node{val = Head#list_node.val, next = remove_nth_from_end(Head#list_node.next, Target, Idx + 1)}.

remove_nth_from_end(Head, N) ->
    Len = list_length(Head),
    remove_nth_from_end(Head, Len - N, 0).