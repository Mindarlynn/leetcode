-spec convert_to_title(ColumnNumber :: integer()) -> unicode:unicode_binary().

convert(ColumnNumber) -> 
    case (ColumnNumber >= 0) and (ColumnNumber < 26) of
        true -> [$A + ColumnNumber];
        false -> convert(ColumnNumber div 26 - 1) ++ convert(ColumnNumber rem 26)
    end.

convert_to_title(ColumnNumber) -> 
    list_to_binary(convert(ColumnNumber - 1)).