class Solution {
public:
    string make_range(int l, int r){
        if(l == r) return to_string(l);
        return to_string(l) + "->" + to_string(r);
    }

    vector<string> summaryRanges(vector<int>& nums) {
        const int n = nums.size();

        if(n == 0) return {};

        int l = nums[0], r = nums[0];
        vector<string> ans{};

        for(int i = 1; i < n; ++i){
            if(nums[i] > r + 1){
                ans.push_back(make_range(l, r));
                l = nums[i];
            }
            
            r = nums[i];
        }

        ans.push_back(make_range(l, r));

        return ans;
    }
};