class Solution {
public:
    vector<int> getMaximumXor(vector<int>& nums, int maximumBit) {
        int xoracc = 0;

        for(const int& e : nums) xoracc ^= e;

        vector<int> ans{};
        for(auto it = nums.crbegin(); it != nums.crend(); ++it){
            ans.push_back(xoracc ^ ((1 << maximumBit) - 1));
            xoracc ^= *it;
        }

        return ans;
    }
};