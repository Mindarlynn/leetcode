%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec insert_greatest_common_divisors(Head :: #list_node{} | null) -> #list_node{} | null.

gcd(X, Y) when Y == 0 -> X;
gcd(X, Y) -> gcd(Y, X rem Y).

insert_gcd(Left, Right) when Right == null -> Left;
insert_gcd(Left, Right) ->
    #list_node{
        val = Left#list_node.val,
        next = #list_node{
            val = gcd(
                Left#list_node.val,
                Right#list_node.val
            ),
            next = insert_gcd(Right, Right#list_node.next)
        }
    }.
    
insert_greatest_common_divisors(Head) ->
    insert_gcd(Head, Head#list_node.next).