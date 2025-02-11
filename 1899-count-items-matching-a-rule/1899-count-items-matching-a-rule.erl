-spec count_matches(Items :: [[unicode:unicode_binary()]], RuleKey :: unicode:unicode_binary(), RuleValue :: unicode:unicode_binary()) -> integer().

%% Items: [ [type, color, name], ... ]
%% (RuleKey, RuleValue) = ( "type", "type_val" || "color", "color_val" || "name", "name_val" )
%% 

get_idx(Key) when Key =:= <<"type">> -> 1;
get_idx(Key) when Key =:= <<"color">> -> 2;
get_idx(Key) when Key =:= <<"name">> -> 3.

checker(A, A) -> 1;
checker(_, _) -> 0.

count_matches(Items, RuleKey, RuleValue) ->
    lists:foldl(
        fun (Item, Cnt) ->
            Cnt + checker(lists:nth(get_idx(RuleKey), Item), RuleValue)
        end, 
        0, Items
    ).