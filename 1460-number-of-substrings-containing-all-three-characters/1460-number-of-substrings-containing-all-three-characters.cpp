class Solution {
public:
    int numberOfSubstrings(string s) {
        const int n = s.length();
        int cnt[3] = {0, 0, 0}, l = 0, r = 0;
        int ans = 0;

        while(r < n){
            ++cnt[s[r] - 'a'];
            
            while(cnt[0] > 0 && cnt[1] > 0 && cnt[2] > 0){
                ans += 1 + (n - 1 - r);

                --cnt[s[l] - 'a'];
                ++l;
            }

            ++r;
        }

        return ans;
    }
};