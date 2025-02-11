class Solution {
public:
    long long countBadPairs(vector<int>& nums) {
        long long ans = 0;
        int n = nums.size();

        unordered_map<int, int> m{};

        for(int i = 0; i < n; ++i){
            int sub = nums[i] - i;
            ans += i - m[sub];
            m[sub]++;
        }

        return ans;
    }
};