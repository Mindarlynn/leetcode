class Solution {
public:
    void bcktrack(int n, int len, vector<char>& tmp, vector<string>* ans){
        if(n == len) {
            ans->push_back(string{tmp.begin(), tmp.end()});
            return;
        }
        for(char i = 'a'; i <= 'c'; ++i){
            if(!tmp.empty() && *tmp.rbegin() == i) continue;
            tmp.push_back(i);
            bcktrack(n, len + 1, tmp, ans);
            tmp.pop_back();
        }
    }

    string getHappyString(int n, int k) {
        vector<string> res{};
        vector<char> tmp;
        bcktrack(n, 0, tmp, &res);

        return res.size() < k ? "" : res[k - 1];
    }
};