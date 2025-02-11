class Solution {
public:
    int bsearch(vector<int>& nums, const int& target, int l, int r){
        int m = (l + r) / 2;
        
        if(nums[m] == target){
            return m;
        }
        if(l == m || m == r) return -1;
        if(nums[m] < target){
            return bsearch(nums, target, m + 1, r);
        }
        if(nums[m] > target){
            return bsearch(nums, target, l, m);
        }
        return -1;
    }

    int search(vector<int>& nums, int target) {
        //if(nums.size() == 1) return nums[0] == target ? 0 : -1;
        return bsearch(nums, target, 0, nums.size());
    }
};