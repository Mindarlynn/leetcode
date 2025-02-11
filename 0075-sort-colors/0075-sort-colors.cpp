class Solution {
public:
    void sortColors(vector<int>& nums) {
        int cnts[3] = {0,};
        for(int e : nums)
            cnts[e]++;

        int idx = 0;
        for(int i = 0; i < 3; ++i){
            for(int j = 0; j < cnts[i]; ++j){
                nums[idx++] = i;
            }
        }
    }
};