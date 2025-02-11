-record(car_slot, {
    type,
    capacity,
    current
}).

init_mnesia() ->
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(car_slot, [{attributes, record_info(fields, car_slot)}]).

-spec parking_system_init_(Big :: integer(), Medium :: integer(), Small :: integer()) -> any().
parking_system_init_(Big, Medium, Small) ->
    init_mnesia(),
    BigSlot = #car_slot{type = 1, capacity = Big, current = 0},
    MediumSlot = #car_slot{type = 2, capacity = Medium, current = 0},
    SmallSlot = #car_slot{type = 3, capacity = Small, current = 0},
    F = fun() ->
        mnesia:write(BigSlot),
        mnesia:write(MediumSlot),
        mnesia:write(SmallSlot)
    end,
    mnesia:transaction(F),
    null.

-spec parking_system_add_car(CarType :: integer()) -> boolean().
parking_system_add_car(CarType) ->
    F = fun() ->
        [E] = mnesia:read(car_slot, CarType, write),
        case E#car_slot.capacity > E#car_slot.current of
            true -> 
                NewE = E#car_slot{current = E#car_slot.current + 1},
                mnesia:write(NewE),
                true;
            false ->
                false
        end
    end,
    {_, Result} = mnesia:transaction(F),
    Result.

%% Your functions will be called as such:
%% parking_system_init_(Big, Medium, Small),
%% Param_1 = parking_system_add_car(CarType),

%% parking_system_init_ will be called before every test case, in which you can do some necessary initializations.