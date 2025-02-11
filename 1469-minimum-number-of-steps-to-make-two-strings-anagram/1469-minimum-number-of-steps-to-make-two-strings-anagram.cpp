class Solution {
public:
    int minSteps(string s, string t) {
        unordered_map<char, int> m{};

        for(char c : s){
            m[c]++;
        }
        for(char c : t){
            m[c]--;
        }
        int ans = 0;
        for(auto [_, cnt] : m){
            ans += abs(cnt);
        }

        return ans / 2;
    }
};