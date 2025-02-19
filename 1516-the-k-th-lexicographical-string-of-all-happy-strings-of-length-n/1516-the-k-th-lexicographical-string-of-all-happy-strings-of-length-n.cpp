class Solution {
public:
    void bcktrack(int n, int k, int len, int& th, vector<char>& tmp, string* ans){
        if(th > k) return;
        if(n == len) {
            if(th == k) (*ans) = string{tmp.begin(), tmp.end()};
            ++th;
            return;
        }
        for(char i = 'a'; i <= 'c'; ++i){
            if(!tmp.empty() && *tmp.rbegin() == i) continue;
            tmp.push_back(i);
            bcktrack(n, k, len + 1, th, tmp, ans);
            tmp.pop_back();
        }
    }

    string getHappyString(int n, int k) {
        string res = "";
        vector<char> tmp;
        int th = 1;
        bcktrack(n, k, 0, th, tmp, &res);

        return res;
    }
};