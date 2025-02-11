class Solution {
public:
    inline int max(int a, int b){
        return a > b ? a : b;
    }

    int maximumLength(string s) {
        int n = s.length();
        bool visited[26] = {0,};

        int ans = 0;

        for(int i = 0; i < n; ++i){
            if(visited[s[i] - 'a']) continue;
            visited[s[i] - 'a'] = true;

            for(string sub = string{s[i]}; sub.length() <= n - 2; sub += s[i]){
                int idx = 0;
                int cnt = 0;

                while((idx = s.find(sub, idx)) != string::npos){
                    ++cnt;
                    ++idx;

                    if(cnt >= 3) break;
                }
                
                if(cnt >= 3){
                    ans = max(ans, sub.length());
                }
            }
        }

        return ans == 0 ? -1 : ans;
    }
};