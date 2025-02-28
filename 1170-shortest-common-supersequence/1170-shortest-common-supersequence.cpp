class Solution {
public:
    string shortestCommonSupersequence(string str1, string str2) {
        int n = str1.length(), m = str2.length();
        vector<vector<int>> dp(1001, vector<int>(1001, 0));
        
        for(int i = 0; i < n; ++i){
            for(int j = 0; j < m; ++j){
                dp[i + 1][j + 1] = str1[i] == str2[j] ? dp[i][j] + 1 : max(dp[i][j + 1], dp[i + 1][j]);
            }
        }

        string ans;

        while(n && m){
            if(dp[n][m] == dp[n - 1][m])
                ans += str1[--n];
            else if(dp[n][m] == dp[n][m - 1])
                ans += str2[--m];
            else
                ans += min(str1[--n], str2[--m]);
        }

        return str1.substr(0, n) + str2.substr(0, m) + string(rbegin(ans), rend(ans));
    }
};