class Solution {
public:
    void shift_left(vector<int>& v, int idx){
        for(int i = idx; i < v.size() - 1; ++i){
            v[i] = v[i + 1];
        }
    }

    int removeDuplicates(vector<int>& nums) {
        int n = nums.size();

        for(int i = 1; i < n;){
            if(nums[i - 1] == nums[i]){
                shift_left(nums, i);
                --n;
            }
            else{
                ++i;
            }
        }

        return n;
    }
};