#define INVALID 1e9

class Solution {
public:
    int minSubArrayLen(int target, vector<int>& nums) {
        int n = nums.size();
        int left = 0, right = 0, sum = 0;

        int ans = INVALID;

        for(; right < n; ++right){
            sum += nums[right];

            while(target <= sum){
                ans = ::min(ans, right - left + 1);
                sum -= nums[left++];
            }
        }
        return ans == INVALID ? 0 : ans;
    }
};