%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec merge_two_lists(List1 :: #list_node{} | null, List2 :: #list_node{} | null) -> #list_node{} | null.


merge_two_lists(null, null) -> null;
merge_two_lists(List1, null) -> List1;
merge_two_lists(null, List2) -> List2;

merge_two_lists(List1, List2) when List1#list_node.val =< List2#list_node.val ->
    #list_node{
        val = List1#list_node.val,
        next = merge_two_lists(List1#list_node.next, List2)
    };

merge_two_lists(List1, List2) when List1#list_node.val > List2#list_node.val ->
    #list_node{
        val = List2#list_node.val,
        next = merge_two_lists(List1, List2#list_node.next)
    }.