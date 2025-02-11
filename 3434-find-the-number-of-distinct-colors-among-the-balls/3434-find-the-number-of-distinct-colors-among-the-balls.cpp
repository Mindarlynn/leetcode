class Solution {
public:
    vector<int> queryResults(int limit, vector<vector<int>>& q) {
        unordered_map<int, int> b, m{};
        int d = 0;
        const int n = limit;

        vector<int> ans{};
        

        for(int i = 0; i < q.size(); ++i){
            int x = q[i][0], y = q[i][1];


            m[b[x]]--;
            if(m[b[x]] == 0) --d;

            b[x] = y;
            m[y]++;

            if(m[y] == 1) ++d;

            ans.push_back(d);

        }

        return ans;
    }
};