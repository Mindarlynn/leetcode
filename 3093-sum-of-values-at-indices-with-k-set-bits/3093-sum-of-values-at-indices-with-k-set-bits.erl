-spec sum_indices_with_k_set_bits(Nums :: [integer()], K :: integer()) -> integer().

sum_indices_with_k_set_bits_impl([], _, Result) -> Result;
sum_indices_with_k_set_bits_impl([{Idx, H} | T], K, Result) ->
    case lists:foldl(
        fun (X, Cnt) ->
            case X =:= $1 of
                true -> Cnt + 1;
                false -> Cnt
            end
        end,
        0, integer_to_list(Idx - 1, 2)
    ) =:= K of
        true -> sum_indices_with_k_set_bits_impl(T, K, Result + H);
        false -> sum_indices_with_k_set_bits_impl(T, K, Result)
    end.

sum_indices_with_k_set_bits(Nums, K) ->
    sum_indices_with_k_set_bits_impl(lists:enumerate(Nums), K, 0).