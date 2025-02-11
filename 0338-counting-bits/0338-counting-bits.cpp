class Solution {
public:
    vector<int> countBits(int n) {
        vector<int> ans{};
        ans.resize(n+1);

        /*
        DP Table after loop finished
        ans[0] = 0
        ans[001(2)] = ans[000(2)] + (1 & 1) = 0 + 1 = 1
        ans[010(2)] = ans[001(2)] + (2 & 1) = 1 + 0 = 1
        ans[011(2)] = ans[001(2)] + (3 & 1) = 1 + 1 = 2
        ans[100(2)] = ans[010(2)] + (4 & 1) = 1 + 0 = 1
        ans[101(2)] = ans[010(2)] + (5 & 1) = 1 + 1 = 2
        ans[110(2)] = ans[011(2)] + (6 & 1) = 2 + 0 = 2
        ans[111(2)] = ans[011(2)] + (7 & 1) = 2 + 1 = 3
        ...
        */

        for(int i =  1; i <= n; ++i){
            ans[i] = ans[i >> 1] + (i & 1);
        }

        return ans;
    }
};