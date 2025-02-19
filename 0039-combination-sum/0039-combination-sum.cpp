class Solution {
public:
    void f(int t, vector<int>& v, int s, int sum, vector<int>& tmp, vector<vector<int>>* res){
        if(sum > t) return;
        if(sum == t){
            res->push_back(tmp);
            return;
        }
        for(int i = s; i < v.size(); ++i){
            tmp.push_back(v[i]);
            f(t, v, i, sum + v[i], tmp, res);
            tmp.pop_back();
        }
    }

    vector<vector<int>> combinationSum(vector<int>& v, int t) {
        vector<int> tmp;
        vector<vector<int>> ans;
        sort(v.begin(), v.end());
        f(t, v, 0, 0, tmp, &ans);
        return ans;
    }
};