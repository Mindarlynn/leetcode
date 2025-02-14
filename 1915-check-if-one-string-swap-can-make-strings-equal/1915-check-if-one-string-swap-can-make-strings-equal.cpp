class Solution {
public:
    bool areAlmostEqual(string s1, string s2) {
        const int n = s1.length();

        
        unordered_map<char, int> m[2]{};
        int diff = 0;

        for(int i = 0; i < n; ++i){
            if(s1[i] != s2[i]) ++diff;
            m[0][s1[i]]++;
            m[1][s2[i]]++;
        }

        return m[0] == m[1] && diff <= 2;
    }
};