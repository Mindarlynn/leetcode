class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        unordered_map<int, int> freq{};
        priority_queue<pair<int, int>> pq{};
        for(const auto& e : nums) freq[e]++;
        for(const auto& [key, val] : freq) pq.push({val, key});
        vector<int> ans{};
        while(k-- > 0){
            ans.push_back(pq.top().second); pq.pop();
        }
        return ans;
    }
};