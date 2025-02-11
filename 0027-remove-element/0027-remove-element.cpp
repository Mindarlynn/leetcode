class Solution {
public:
    void shift_left(vector<int>& v, int idx){
        for(int i = idx; i < v.size() - 1; ++i){
            v[i] = v[i + 1];
        }
    }

    int removeElement(vector<int>& nums, int val) {
        int n = nums.size();

        for(int i = 0; i < n;){
            if(nums[i] == val){
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