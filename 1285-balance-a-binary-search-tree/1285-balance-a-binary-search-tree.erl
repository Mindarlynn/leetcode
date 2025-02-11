%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

flatten_tree(null) -> [];
flatten_tree(Node) ->
    flatten_tree(Node#tree_node.left) ++ 
    [Node#tree_node.val] ++ 
    flatten_tree(Node#tree_node.right).

partition(List) -> 
    N = length(List),
    PivotIdx = N div 2 + 1,
    Left = [X || {Idx, X} <- lists:enumerate(List), Idx < PivotIdx],
    Right = [X || {Idx, X} <- lists:enumerate(List), Idx > PivotIdx],
    {Left, lists:nth(PivotIdx, List), Right}.

build_tree([]) -> null;
build_tree(List) -> 
    {Left, Pivot, Right} = partition(List),
    #tree_node{
        val = Pivot,
        left = build_tree(Left),
        right = build_tree(Right)
    }.

-spec balance_bst(Root :: #tree_node{} | null) -> #tree_node{} | null.
balance_bst(null) -> null;
balance_bst(Root) ->
    FlattenList = lists:sort(flatten_tree(Root)),
    build_tree(FlattenList).