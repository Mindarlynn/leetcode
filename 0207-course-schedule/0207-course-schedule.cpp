class Solution {
public:
    bool has_cycle(vector<vector<int>>& g, vector<bool>& vis, vector<int>& memo, int o){
        if(memo[o] == 1) return true;
        if(memo[o] == 0) return false;

        if(vis[o]) return true;
        vis[o] = true;
        bool res = false;
        for(int i = 0; i < g[o].size(); ++i){
            res |= has_cycle(g, vis, memo, g[o][i]);
            if(res) break;
        }
        return memo[o] = res;
    }

    bool canFinish(int n, vector<vector<int>>& p) {
        vector<vector<int>> adj(n, vector<int>());

        for(int i = 0; i < p.size(); ++i){
            int u = p[i][0], v = p[i][1];
            adj[v].push_back(u);
        }

        bool ans = false;
        vector<int> memo(n, -1);
        for(int i = 0; i < n; ++i){
            vector<bool> vis(n, false);
            ans |= has_cycle(adj, vis, memo, i);
        }

        return !ans;
    }
};