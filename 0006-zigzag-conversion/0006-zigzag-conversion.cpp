class Solution {
public:
    string convert(string s, int nr) {
        const int n = s.length();
        vector<string> v(nr, "");

        int k = 0;

        while(k < n){
            for(int i = 0; i < nr && k < n; ++i, ++k){
                v[i] += s[k];
            }
            for(int i = nr - 2; i > 0 && k < n; --i, ++k){
                v[i] += s[k];
            }
        }

        return accumulate(
            next(v.begin()),
            v.end(),
            v[0],
            [](const string& a, const string& b){
                return a + b;
            }
        );
    }
};