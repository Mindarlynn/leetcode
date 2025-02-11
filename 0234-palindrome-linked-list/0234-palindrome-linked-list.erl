%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec is_palindrome(Head :: #list_node{} | null) -> boolean().
-import(lists,[reverse/1]). 

list_to_seq(null) -> [];
list_to_seq(Head) ->
    [Head#list_node.val] ++ list_to_seq(Head#list_node.next).

is_palindrome(null) -> false;
is_palindrome(Head) ->
    Seq = list_to_seq(Head),
    Seq =:= reverse(Seq).