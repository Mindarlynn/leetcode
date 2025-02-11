%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

flat(null, Tmp, K) -> 
    case length(Tmp) == K of
        true -> lists:reverse(Tmp);
        false -> Tmp
    end;
flat(Head, Tmp, K) ->
    case length(Tmp) == K of
        true -> lists:reverse(Tmp) ++ flat(Head, [], K);
        false -> flat(Head#list_node.next, Tmp ++ [Head#list_node.val], K)
    end.

mk_list([]) -> null;
mk_list([H|T]) -> 
    #list_node{val = H, next = mk_list(T)}.

-spec reverse_k_group(Head :: #list_node{} | null, K :: integer()) -> #list_node{} | null.
reverse_k_group(Head, K) ->
    mk_list(flat(Head, [], K)).