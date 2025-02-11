class Solution {
public:

#define REPLACED 1e9

    void shift_left(vector<int>& v, int insert_idx = 0, int search_idx = 1){
        if(insert_idx < 0 || insert_idx >= v.size()) return;
        if(search_idx < 0 || search_idx >= v.size()) return;

        if(v[insert_idx] != REPLACED) shift_left(v, insert_idx + 1, insert_idx + 2);
        else if(v[search_idx] == REPLACED) shift_left(v, insert_idx, search_idx + 1);
        else{
            v[insert_idx] = v[search_idx];
            v[search_idx] = REPLACED;
            shift_left(v, insert_idx + 1, search_idx + 1);
        }
    }



    int removeDuplicates(vector<int>& nums) {
        int prev = nums[0];
        int cnt = 0;
        int rm_cnt = 0;
        
        for(int i = 0; i < nums.size(); ++i){
            if(prev != nums[i]){
                prev = nums[i];
                cnt = 1;
            }
            else if(nums[i] == prev && cnt >= 2){
                nums[i] = REPLACED;
                rm_cnt++;
            }
            else{
                ++cnt;
            }
        }

        shift_left(nums);
        return nums.size() - rm_cnt;
    }
};