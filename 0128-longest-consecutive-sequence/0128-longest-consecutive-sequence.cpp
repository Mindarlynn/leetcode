class Solution {
public:
    int longestConsecutive(vector<int>& nums) {
        const int n = nums.size();
        if(n == 0) return 0;
        sort(nums.begin(), nums.end());
        
        int prev = nums[0];
        int len = 1;
        int ans = 0;

        for(int i = 1; i < n; ++i){
            if(nums[i] == prev) continue;
            if(nums[i] > prev + 1){
                ans = ::max(ans, len);
                len = 0;
            }
            ++len;
            prev = nums[i];
        }

        return ::max(ans, len);
    }
};