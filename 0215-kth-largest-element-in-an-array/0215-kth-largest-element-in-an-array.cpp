class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        priority_queue<int> pq{};
        
        for(const auto& e : nums) pq.push(e);
        while(k-- > 1) pq.pop();
        return pq.top();
    }
};