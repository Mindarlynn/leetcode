class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        
        int cnt[CHAR_MAX] = {0,};

        int l = 0, r = 0, ans = 0;
        while(l <= r && r < s.length()){
            ++cnt[s[r]];

            bool unique_characters = true;
            for(int i = 0; i < CHAR_MAX; ++i){
                if(cnt[i] <= 1) continue;
                unique_characters = false;
                break;
            }

            ++r;
            if(unique_characters){
                cout << l << ' ' << r << '\n';
                ans = max(ans, r - l);
            }
            else{
                cnt[s[l]] = max(0, cnt[s[l]] - 1);
                ++l;
            }
        }

        return ans;
    }
};