class Solution {
public:
    int search(vector<int>& nums, int target) {
        const int n = nums.size();

        int l = 0, r = n - 1;

        while(l < r){
            int m = (l + r) / 2;
            if(nums[m] > nums[r]) l = m + 1;
            else r = m;
        }

        const int rr = l;
        l = 0, r = n - 1;

        while(l <= r){
            int _m = (l + r) / 2;
            int m = (_m + rr) % n;

            if(nums[m] == target) return m;
            if(nums[m] < target) l = _m + 1;
            else r = _m - 1;
        }

        return -1;
    }
};