-spec convert_temperature(Celsius :: float()) -> [float()].
convert_temperature(Celsius) ->
    [Celsius + 273.15] ++ [Celsius * 1.80 + 32.00].