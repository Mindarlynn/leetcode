-spec longest_common_prefix(Strs :: [unicode:unicode_binary()]) -> unicode:unicode_binary().
longest_common_prefix(Strs) ->
  prefix([binary_to_list(X) || X <- Strs], []).

make_list(Len, Char)->
    case Len of
        0 -> [];
        _ -> [Char] ++ make_list(Len - 1, Char)
    end.

prefix([], Prefix) -> list_to_binary(Prefix);
prefix(Strs, Prefix) ->
    Heads = [H || [H | _] <- Strs],
    Tails = [T || [_ | T] <- Strs],
    io:format("~p~n", [Heads]),
    case length(Strs) == length(Heads) of
      false -> prefix([], Prefix);
      true -> 
        io:format("~p~n", [Tails]),
        Head = hd(Heads),
        Cmps = make_list(length(Heads), Head),
        case Heads =:= Cmps of
          true -> prefix(Tails, Prefix ++ [Head]);
          false -> prefix([], Prefix)
        end
    end.
    