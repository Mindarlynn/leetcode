class Solution {
public:
    void cache(vector<vector<bool>>& g, vector<bool>& vis, int set, int cur){
        for(int i = 0; i < g[cur].size(); ++i){
            if(!g[cur][i] || vis[i]) continue;

            vis[i] = true;
            g[set][i] = true;
            
            cache(g, vis, set, i);
        }
    }

    vector<bool> checkIfPrerequisite(int n, vector<vector<int>>& p, vector<vector<int>>& q) {
        vector<vector<bool>> g(n, vector<bool>(n, false));

        for(int i = 0; i < p.size(); ++i){
            g[p[i][0]][p[i][1]] = true;
        }


        for(int i = 0; i < n; ++i){
            for(int j = 0; j < g[i].size(); ++j){
                if(!g[i][j]) continue;
                vector<bool> vis(n, false);
                vis[i] = true;
                vis[j] = true;
                cache(g, vis, i, j);
            }
        }

        vector<bool> ans{};
        for(int i = 0; i < q.size(); ++i){
            ans.push_back(g[q[i][0]][q[i][1]]);
        }

        return ans;
    }
};