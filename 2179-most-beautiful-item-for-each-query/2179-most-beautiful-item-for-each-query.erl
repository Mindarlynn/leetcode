%%%%%%%%%%%%%%%%%
%% ETS Wrapper %%
%%%%%%%%%%%%%%%%%
ets_init() -> ets:new(tb, [named_table, ordered_set, public]).
ets_insert(Item) -> ets:insert(tb, Item).
ets_lookup(Query) -> ets:lookup(tb, Query).
ets_lookup_element(Key, Pos) -> ets:lookup_element(tb, Key, Pos).
ets_prev(Query) -> ets:prev(tb, Query).
ets_destroy() -> ets:delete(tb).
%%%%%%%%%%%%%%%%%

propagate([], _) -> [];
propagate([{Price, Beauty} | T], MaxBeauty) -> 
    [{Price, max(Beauty, MaxBeauty)}] ++ propagate(T, max(Beauty, MaxBeauty)).

-spec maximum_beauty(Items :: [[integer()]], Queries :: [integer()]) -> [integer()].
maximum_beauty(Items, Queries) ->
    PriceSortedItems = lists:usort(
        fun({X1, Y1}, {X2, Y2}) -> 
            if
                X1 == X2 -> Y1 > Y2;
                true -> X1 < X2
            end
        end, [{X, Y} || [X | [Y | _]] <- Items]
    ),

    ets:new(tb, [named_table, ordered_set, public]),
    lists:foreach(fun ets_insert/1, propagate(PriceSortedItems, 0)),

    Ans = lists:map(
        fun (Query) ->
            case ets_lookup(Query) of
                [] ->
                    case ets_prev(Query) of 
                        '$end_of_table' -> 0;
                        PrevKey -> ets_lookup_element(PrevKey, 2)
                    end;
                [{_, Beauty} | _] -> Beauty
            end
        end, Queries
    ),

    ets_destroy(),
    
    Ans.