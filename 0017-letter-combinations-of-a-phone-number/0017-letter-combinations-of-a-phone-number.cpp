class Solution {
public:
    string table[10] = {
        "", "",     "abc", "def",
            "ghi",  "jkl", "mno",
            "pqrs", "tuv", "wxyz"
    };

    vector<string> ans {};

    void comb(const string& digits, int idx = 0, string tmp = ""){
        if(digits.length() == idx){
            ans.push_back(tmp);
            return;
        }

        for(int i = 0; i < table[digits[idx] - '0'].length(); ++i){
            comb(digits, idx + 1, tmp + table[digits[idx] - '0'][i]);
        }
    }

    vector<string> letterCombinations(string digits) {
        if(digits.length() == 0) return {};
        comb(digits);
        return ans;
    }
};