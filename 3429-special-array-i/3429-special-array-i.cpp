class Solution {
public:
    bool isArraySpecial(vector<int>& nums) {
        for(int i = 1; i < nums.size(); ++i){
            if((0b1 & nums[i]) == (0b1 & nums[i - 1])) return false;
        }
        return true;
    }
};