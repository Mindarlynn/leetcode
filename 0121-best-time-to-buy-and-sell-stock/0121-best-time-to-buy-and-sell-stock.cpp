class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int buy = prices[0];
        int max = 0;
        for(int i = 1; i < prices.size(); ++i){
            max = ::max(max, ::max(prices[i] - buy, 0));
            buy = ::min(buy, prices[i]);
        }

        return max;
    }
};