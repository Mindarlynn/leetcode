-spec max_depth(S :: unicode:unicode_binary()) -> integer().

max_depth_impl([], _, DepthMax) -> DepthMax;
max_depth_impl([H | T], Depth, DepthMax) when H =:= $( ->
    max_depth_impl(T, Depth + 1, max(Depth + 1, DepthMax));
max_depth_impl([H | T], Depth, DepthMax) when H =:= $) ->
    max_depth_impl(T, Depth - 1, max(Depth - 1, DepthMax));
max_depth_impl([H | T], Depth, DepthMax) ->
    max_depth_impl(T, Depth, DepthMax).
max_depth(S) ->
    max_depth_impl(binary_to_list(S), 0, 0).