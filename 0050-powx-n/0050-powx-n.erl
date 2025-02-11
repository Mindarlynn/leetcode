-spec my_pow(X :: float(), N :: integer()) -> float().

my_pow(X, 0, Val) -> Val;
my_pow(X, N, Val) when (N rem 2) == 0 -> my_pow(X * X, N div 2, Val);
my_pow(X, N, Val) -> my_pow(X, N - 1, X * Val).

my_pow(X, N) when N < 0 -> my_pow(1.0/X, -N, 1);
my_pow(X, N) -> my_pow(X, N, 1).