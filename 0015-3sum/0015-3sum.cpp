class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        sort(nums.begin(), nums.end());

        const int n = nums.size();
        vector<vector<int>> ans{};

        set<tuple<int, int, int>> s{};

        for(int i = 0; i < n; ++i){
            int l = i + 1, r = n - 1;
            int ival = nums[i];

            while(l < r){
                int lval = nums[l], rval = nums[r], sum = ival + lval + rval;

                if(sum == 0) if(!s.contains({ival, lval, rval})) ans.push_back({ival, lval, rval}), s.insert({ival, lval, rval});
                if(sum < 0) ++l;
                else --r;
            }
        }

        return ans;
    }
};