%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec remove_elements(Head :: #list_node{} | null, Target :: integer()) -> #list_node{} | null.

remove_elements(null, Target) -> null;
remove_elements(Head, Target) ->
    Next = Head#list_node.next,
    Val = Head#list_node.val,
    case Val == Target of
        true -> remove_elements(Next, Target);
        false -> #list_node{val = Val, next = remove_elements(Next, Target)}
    end.
