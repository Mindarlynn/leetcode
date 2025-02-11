class Solution {
public:
    unordered_map<int, int> memo{};

    int fib(int n) {
        if(n <= 1) return n;
        if(!memo[n]){
            memo[n] = fib(n - 1) + fib(n - 2);
        }
        return memo[n];
    }
};