class Solution {
public:
    int longestOnes(vector<int>& nums, int k) {
        const int n = nums.size();
        int l = 0;
        int ans = 0;

        for(int r = 0; r < n; ++r){
            if(nums[r] == 0){
                if(k > 0){
                    k -= 1;
                }
                else{
                    while(nums[l] != 0) {
                        ++l;
                    }
                    ++l;
                }
            }
            ans = max(ans, r - l + 1);
        }

        return ans;
    }
};