%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec delete_duplicates(Head :: #list_node{} | null) -> #list_node{} | null.

delete_duplicates(Head, Prev) -> 
    case Head of
        null -> null;
        _ ->
            Val = Head#list_node.val,
            Next = Head#list_node.next,

            case Val == Prev of
                true -> delete_duplicates(Next, Val);
                false -> #list_node{val = Val, next = delete_duplicates(Next, Val)}
            end
    end.
            
delete_duplicates(Head) ->
    delete_duplicates(Head, 999).