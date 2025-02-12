class Solution {
public:
    int maximumSum(vector<int>& nums) {
        int n = nums.size();

        unordered_map<int, priority_queue<int>> m{};

        for(int i = 0; i < n; ++i){
            int digit_sum = 0;
            int number = nums[i];
            while (number > 0)
            {
                digit_sum += number%10;
                number /= 10;
            }
            m[digit_sum].push(nums[i]);
        }
        
        int ans = -1;

        for(auto& [_, pq] : m){
            if(pq.size() < 2) continue;
            int l = pq.top(); pq.pop(); int r = pq.top();
            ans = ::max(ans, l + r);
        }

        return ans;
    }
};