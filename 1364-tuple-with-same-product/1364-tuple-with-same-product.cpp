class Solution {
public:
    int tupleSameProduct(vector<int>& nums) {
        int n = nums.size();
        unordered_map<int, int> m{};

        for(int i = 0; i < n; ++i){
            for(int j = i + 1; j < n; ++j){
                int mul = nums[i] * nums[j];
                m[mul]++;
            }
        }

        int ans = 0;

        for(auto& [mulval, count] : m){
            if(count == 1) continue;
            ans += 4 * count * (count - 1);
        }

        return ans;
    }
};