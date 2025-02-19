class Solution {
public:
    void f(int n, int k, int s, vector<int>& tmp, vector<vector<int>>* res){
        if(tmp.size() == k){
            res->push_back(tmp);
            return;
        }
        for(int i = s; i <= n; ++i){
            tmp.push_back(i);
            f(n, k, i + 1, tmp, res);
            tmp.pop_back();
        }
    }

    vector<vector<int>> combine(int n, int k) {
        vector<int> tmp;
        vector<vector<int>> ans{};
        f(n, k, 1, tmp, &ans);
        return ans;
    }
};