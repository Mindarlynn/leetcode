-spec create_user_list(N :: integer()) -> [tuple()].
create_user_list(N)     -> create_user_list(0, N).

-spec create_user_list(I :: integer(), N :: integer()) -> [tuple()].
create_user_list(N, N)  -> [];
create_user_list(I, N)  -> [{I, -1, 0}] ++ create_user_list(I + 1, N).


-spec set_user_online(Users :: [tuple()], CurrentTime :: integer()) -> [tuple()].
set_user_online(Users, CurrentTime) ->
    lists:map(
        fun (User) ->
            {Id, TTO, MentionCount} = User,

            if
                TTO =< CurrentTime -> {Id, -1, MentionCount};
                true -> User
            end
        end, Users
    ).


-spec set_user_offline(Users :: [tuple()], CurrentTime :: integer(), TargetId :: integer()) -> [tuple()].
set_user_offline(Users, CurrentTime, TargetId) ->
    lists:map(
        fun (User) ->
            case User of
                {TargetId, _, MentionCount} -> {TargetId, CurrentTime + 60, MentionCount};
                _ -> User
            end
        end, Users
    ).


-spec is_online(OTT :: integer()) -> integer().
is_online(-1)   -> 1;
is_online(_)    -> 0.


-spec split(Str :: string(), Delim :: char()) -> [string()].
split(Str, Delim)               -> split(Str, [], Delim).

-spec split(Str :: string(), Tmp :: string(), Delim :: char()) -> [string()].
split([], [], _)                -> [];
split([], Tmp, Delim)           -> [Tmp];
split([Delim | T], Tmp, Delim)  -> [Tmp] ++ split(T, [], Delim);
split([H | T], Tmp, Delim)      -> split(T, Tmp ++ [H], Delim).


-spec freq(List :: [integer()]) -> map().
freq(List)          -> freq(List, maps:new()).

-spec freq(List :: [integer()], Map :: map()) -> map().
freq([], Map)       -> Map;
freq([H|T], Map)    -> freq(T, maps:update_with(H, fun(X) -> X + 1 end, 1, Map)).


-spec make_inc_list_with_ids(N :: integer(), Ids :: [integer()]) -> [integer()].
make_inc_list_with_ids(N, Ids) -> 
    IdsMap = freq(Ids),
    NSIncList = maps:to_list(
        lists:foldl(
            fun(I, Map) ->
                case maps:is_key(I, Map) of
                    true -> Map;
                    false -> maps:put(I, 0, Map)
                end
            end, IdsMap, lists:seq(0, N - 1)
        )
    ),
    SIncList = lists:keysort(1, NSIncList),
    lists:map(fun(E) -> element(2, E) end, SIncList).


-spec increase_mention_count(User :: [tuple()], IncList :: [integer()]) -> [tuple()].
increase_mention_count(User, IncList) ->
    lists:map(
        fun ({{Id, TTO, MentionCount}, Inc}) ->
            {Id, TTO, MentionCount + Inc}
        end, lists:zip(User, IncList)
    ).


-spec process_message(Users :: [tuple()], Mentions :: string()) -> [tuple()].
process_message(Users, Mentions) ->
    N = length(Users),
    IncList = case hd(Mentions) of
        $A -> 
            lists:duplicate(N, 1);
        $H -> 
            lists:map(
                fun ({_, TTO, _}) ->
                    is_online(TTO)
                end, Users
            );
        _ -> 
            Ids = split(Mentions, 32), %32 is whitespace
            IntIds = lists:sort(
                lists:map(
                    fun (Id) ->
                        list_to_integer(element(2, lists:split(2, Id)))
                    end, Ids       
                )
            ),
            make_inc_list_with_ids(N, IntIds)
    end,
    increase_mention_count(Users, IncList).


-spec parse_event(Users :: [tuple()], Event :: [tuple()]) -> [tuple()].
parse_event(Users, Event) ->
    {Msg, CurrentTime, Mentions} = Event,

    OnlinedUsers = set_user_online(Users, CurrentTime),

    case hd(Msg) of
        $M ->
            process_message(OnlinedUsers, Mentions);
        $O ->
            Id = list_to_integer(Mentions),
            set_user_offline(OnlinedUsers, CurrentTime, Id)
    end.


-spec count_mentions(N :: integer(), Es :: [[unicode:unicode_binary()]]) -> [integer()].
count_mentions(N, Es) ->
    NewEs = lists:map(
        fun (Event) ->
            [Message | [TimeStamp | [Mentions | _]]] = lists:map(fun binary_to_list/1, Event),
            {Message, list_to_integer(TimeStamp), Mentions}
        end, Es
    ),

    SortedEs = lists:sort(
        fun(A, B) ->
            {AMsg, ATime, _} = A,
            {BMsg, BTime, _} = B,

            if
                ATime == BTime ->
                    if
                        hd(BMsg) == $O -> false;
                        true -> true
                    end;
                true -> ATime =< BTime
            end
        end, NewEs
    ),

    Us = create_user_list(N),

    NewUs = lists:foldl(
        fun(Event, Users) ->
            parse_event(Users, Event)
        end, Us, SortedEs
    ),

    lists:map(
        fun(User) -> 
            element(3, User)
        end, NewUs
    ).