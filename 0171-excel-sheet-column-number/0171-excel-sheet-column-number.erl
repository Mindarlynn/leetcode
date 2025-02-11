-spec title_to_number(ColumnTitle :: unicode:unicode_binary()) -> integer().

convert(List) -> convert(List, 0).
convert([], Val) -> Val;
convert([H | T], Val) ->
    convert(T, Val * 26 + H).

title_to_number(ColumnTitle) ->
    convert([X - $A + 1 || <<X>> <= ColumnTitle]).