class Solution {
public:
    int findMin(vector<int>& nums) {
        const int n = nums.size();
        int min = INT_MAX;

        int l = 0, r = n - 1;

        while(l <= r){
            int m = (l + r) / 2;
            min = ::min(min, nums[m]);

            if(l == r) break;

            if(nums[r] < nums[l] && nums[r] < nums[m])
                l = m + 1;
            else
                r = m;
        }

        return min;
    }
};