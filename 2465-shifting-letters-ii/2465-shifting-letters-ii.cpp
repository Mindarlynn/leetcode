class Solution {
public:
    string shiftingLetters(string s, vector<vector<int>>& shifts) {
        int n = s.length();

        vector<int> shift(n + 1, 0);

        for(int i = 0; i < shifts.size(); ++i){
            int l = shifts[i][0], r = shifts[i][1], d = shifts[i][2] == 1 ? 1 : -1;
            shift[l] += d;
            shift[r + 1] -= d;
        }
        
        for(int i = 1; i < n; ++i){
            shift[i] += shift[i - 1];
        }

        for(int i = 0; i < n; ++i){
            s[i] = (s[i] - 'a' + (shift[i] % 26 + 26) % 26) % 26 + 'a';
        }

        return s;
    }
};