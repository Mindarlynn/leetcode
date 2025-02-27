class Solution {
public:
    int lenLongestFibSubseq(vector<int>& arr) {
        const int n = arr.size();
        unordered_set<int> s{arr.begin(), arr.end()};

        int ans = 0;

        for(int i = 0; i < n; ++i){
            for(int j = i + 1; j < n; ++j){
                int x = arr[i], y = arr[j], len = 2;
                while(s.contains(x + y)){
                    y = x + y, x = y - x;
                    ++len;
                }
                ans = max(ans, len);
            }
        }
        return ans > 2 ? ans : 0;
    }
};