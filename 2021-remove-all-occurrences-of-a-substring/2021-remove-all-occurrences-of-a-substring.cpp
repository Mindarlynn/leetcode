class Solution {
public:
    string removeOccurrences(string s, string part) {
        size_t pos;
        const int m = part.length();
        while((pos = s.find(part)) != string::npos){
            s.replace(pos, m, "");
        }
        return s;
    }
};