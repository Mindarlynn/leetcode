class Solution {
public:
    vector<int> productExceptSelf(vector<int>& nums) {
        int allmul = 1;
        int n = nums.size();

        int zeros = 0;
        for(int i = 0; i < n; ++i){
            if(!nums[i]) ++zeros;
        }

        if(zeros > 1) return vector<int>(n, 0);

        for(int i = 0; i < n; ++i){
            if(nums[i] != 0) allmul *= nums[i];
        }

        for(int i = 0; i < n; ++i){
            if(nums[i] == 0){
                nums[i] = allmul;
            }
            else if(zeros > 0){
                nums[i] = 0;
            }
            else{
                nums[i] = allmul / nums[i];
            }
        }

        return nums;
    }
};