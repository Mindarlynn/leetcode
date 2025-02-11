class Solution {
public:
    int majorityElement(vector<int>& nums) {
        int n = nums.size();
        unordered_map<int, int> m{};
        
        for(int i = 0; i < nums.size(); ++i)
            m[nums[i]]++;

        for(auto [a, b] : m){
            if(b > n / 2) return a;
        }
        return -1;
    }
};