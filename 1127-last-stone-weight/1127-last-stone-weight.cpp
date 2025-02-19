class Solution {
public:
    int lastStoneWeight(vector<int>& stones) {
        priority_queue<int> pq{};

        for(const auto& e : stones){
            pq.push(e);
        }
        
        while(pq.size() != 1){
            int A = pq.top(); pq.pop(); int B = pq.top(); pq.pop();
            pq.push(A - B);
        }
        return pq.top();
    }
};