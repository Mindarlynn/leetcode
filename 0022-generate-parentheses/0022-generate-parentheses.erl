-spec generate_parenthesis(N :: integer()) -> [unicode:unicode_binary()].


generate_parenthesis(Op, Cl, N, Str) ->
    Ans1 = case length(Str) == 2 * N of
        true -> [list_to_binary(Str)];
        _ -> []
    end,
    Ans2 = case Op < N of
        true -> generate_parenthesis(Op + 1, Cl, N, Str ++ [$(]);
        _ -> []
    end,
    Ans3 = case Cl < Op of
            true -> generate_parenthesis(Op, Cl + 1, N, Str ++ [$)]);
            _ -> []
    end,

    Ans1 ++ Ans2 ++ Ans3.

generate_parenthesis(N) ->
    generate_parenthesis(1, 0, N, [$(]).