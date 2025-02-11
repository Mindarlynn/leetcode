class Solution {
public:
    int maxSatisfaction(vector<int>& sat) {
        const int n = sat.size();
        sort(sat.rbegin(), sat.rend());

        int ans = 0, sum = 0;

        for(int i = 0; i < n; ++i){
            sum += sat[i];
            if(sum < 0) break;
            ans += sum;
        }

        return ans;
    }
};