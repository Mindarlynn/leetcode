%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec sum_even_grandparent(Root :: #tree_node{} | null) -> integer().

sum_even_grandparent(Root) ->
    sum_even_grandparent(Root#tree_node.left, Root#tree_node.val, 0) +
    sum_even_grandparent(Root#tree_node.right, Root#tree_node.val, 0).
sum_even_grandparent(null, _, _) -> 0;
sum_even_grandparent(Node, Parent, GrandParent) ->
    sum_even_grandparent(Node#tree_node.left, Node#tree_node.val, Parent) +
    sum_even_grandparent(Node#tree_node.right, Node#tree_node.val, Parent) +
    case GrandParent rem 2 of
        0 when GrandParent > 0 -> Node#tree_node.val;
        _ -> 0
    end.