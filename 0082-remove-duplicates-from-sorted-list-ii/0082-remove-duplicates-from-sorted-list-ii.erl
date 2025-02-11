%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec delete_duplicates(Head :: #list_node{} | null) -> #list_node{} | null.

del(null, _, true) -> null;
del(null, Prev, false) -> #list_node{ val = Prev, next = null };
del(Node, -101, _) -> del(Node#list_node.next, Node#list_node.val, false);
del(Node, Prev, Duplicated) when Prev /= Node#list_node.val ->
    case Duplicated of
        true -> del(Node#list_node.next, Node#list_node.val, false);
        false -> #list_node{
                    val = Prev,
                    next = del(Node#list_node.next, Node#list_node.val, false)
                }
    end;
del(Node, Prev, Duplicated) -> del(Node#list_node.next, Prev, true).

delete_duplicates(null) -> null;
delete_duplicates(Head) ->
    del(Head, -101, false).