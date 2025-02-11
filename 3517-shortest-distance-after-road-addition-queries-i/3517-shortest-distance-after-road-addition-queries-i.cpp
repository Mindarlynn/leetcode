class Solution {
public:
    vector<int> mat[500] = {{},};

    int short_path_len(int n, vector<int>& memo, int start = 0){
        if(start == n - 1) return 0;
        if(memo[start]) return memo[start];
        
        int min = 1e9;
        for(auto it = mat[start].cbegin(); it != mat[start].cend(); ++it){
            min = ::min(short_path_len(n, memo, *it), min);
        }
        
        return memo[start] = 1 + min;
    }

    vector<int> shortestDistanceAfterQueries(int n, vector<vector<int>>& queries) {
        for(int i = 0; i < n; ++i){
            mat[i].push_back(i + 1);
        }

        vector<int> ans{};

        for(int i = 0; i < queries.size(); ++i){
            int u = queries[i][0], v = queries[i][1];
            mat[u].push_back(v);
            vector<int> memo(n, 0);
            // DO SOMETHING
            ans.push_back(short_path_len(n, memo));
        }

        return ans;
    }
};