%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec sorted_array_to_bst(Nums :: [integer()]) -> #tree_node{} | null.

sorted_array_to_bst([]) -> null;
sorted_array_to_bst([Mid]) -> #tree_node{val = Mid, left = null, right = null};
sorted_array_to_bst([[Left | Mid]]) -> #tree_node{val = Mid, left = Left, right = null};
sorted_array_to_bst([[Left | [Mid | Right]]]) -> #tree_node{val = Mid, left = Left, right = Right};
sorted_array_to_bst(Nums) ->
    N = length(Nums),
    {Left, Rest} = lists:split(N div 2, Nums),
    [Mid | Right] = Rest,
    #tree_node{val = Mid, left = sorted_array_to_bst(Left), right = sorted_array_to_bst(Right)}.