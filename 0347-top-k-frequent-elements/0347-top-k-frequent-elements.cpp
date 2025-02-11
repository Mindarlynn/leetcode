class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        unordered_map<int, int> um{};

        for(const int& e : nums) um[e]++;
        
        vector<pair<int, int>> umv{};
        
        for(const auto& e : um) umv.emplace_back(e);

        sort(umv.begin(), umv.end(), [](auto a, auto b) -> bool{
            return a.second > b.second;
        });

        vector<int> ans{};
        auto it = umv.cbegin();
        while(k > 0){
            ans.push_back(it->first);
            ++it, --k;
        }

        return ans;
    }
};