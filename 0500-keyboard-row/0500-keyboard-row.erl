-spec find_words(Words :: [unicode:unicode_binary()]) -> [unicode:unicode_binary()].

print(X) -> io:format("~p~n", [X]).

lowercase(X) when X >= $A, X =< $Z -> X + 32;
lowercase(X) -> X.

find(C) when
    C == $q; C == $w; C == $e; C == $r; C == $t; 
    C == $y; C == $u; C == $i; C == $o; C == $p -> 0;
find(C) when
    C == $a; C == $s; C == $d; C == $f; C == $g;
    C == $h; C == $j; C == $k; C == $l -> 1;
find(C) when
    C == $z; C == $x; C == $c; C == $v; C == $b;
    C == $n; C == $m -> 2.

count(L, E) -> length([X || X <- L, X == E]).

find_words([], L) -> L;
find_words([W | Ws], L) ->
    Word = lists:map(fun lowercase/1, binary_to_list(W)),
    Res = lists:map(fun find/1, Word),
    Max = lists:max([count(Res, 0), count(Res, 1), count(Res, 2)]),
    case Max == length(Word) of
        true -> find_words(Ws, L ++ [W]);
        false -> find_words(Ws, L)
    end.
    
find_words(Words) ->
    find_words(Words, []).