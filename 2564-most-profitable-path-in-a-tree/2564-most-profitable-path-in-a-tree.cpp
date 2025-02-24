class Solution {
public:
    void make_bob_path(vector<vector<int>>& g, vector<bool>& vis, int cur, vector<int>& path, vector<int>* res){
        if(cur == 0) {
            if((res->size() > path.size()) || res->empty())
                (*res) = path;
            return;
        }

        for(int i = 0; i < g[cur].size(); ++i){
            if(vis[g[cur][i]]) continue;
            vis[g[cur][i]] = true;
            path.push_back(g[cur][i]);
            make_bob_path(g, vis, g[cur][i], path, res);
            path.pop_back();
            vis[g[cur][i]] = false;
        }
    }

    void gogoalice(vector<vector<int>>& g, vector<int>& amount, vector<bool>& vis, int alice_cur, int alice_net, vector<int>& bob_path, int bob_cur, int* res){
        bool is_leaf = true;

        for(int i = 0; i < g[alice_cur].size(); ++i){
            if(vis[g[alice_cur][i]]) continue;
            is_leaf = false;
            vis[g[alice_cur][i]] = true;

            if(bob_cur < bob_path.size()){
                const int bob_footprint = amount[bob_path[bob_cur]];    

                int to_add;
                if(g[alice_cur][i] == bob_path[bob_cur]){
                    to_add = amount[g[alice_cur][i]] / 2;
                }
                else{
                    to_add = amount[g[alice_cur][i]];
                }
                amount[bob_path[bob_cur]] = 0;

                gogoalice(g, amount, vis, g[alice_cur][i], alice_net + to_add, bob_path, bob_cur + 1, res);

                amount[bob_path[bob_cur]] = bob_footprint;
            }
            else{
                const int to_add = amount[g[alice_cur][i]];
                gogoalice(g, amount, vis, g[alice_cur][i], alice_net + to_add, bob_path, bob_cur + 1, res);
            }

            vis[g[alice_cur][i]] = false;
        }

        if(is_leaf){
            (*res) = max(*res, alice_net);
        }
    }

    int mostProfitablePath(vector<vector<int>>& edges, int bob, vector<int>& amount) {
        const int n = amount.size();
        vector<vector<int>> adj(n, vector<int>());

        for(int i = 0; i < n - 1; ++i){
            int u = edges[i][0], v = edges[i][1];
            adj[u].push_back(v);
            adj[v].push_back(u);
        }

        vector<int> bob_path;
        {
            vector<bool> vis(n, false);
            vector<int> path;
            vis[bob] = true;
            make_bob_path(adj, vis, bob, path, &bob_path);
        }

        int ans = INT_MIN;
        {
            vector<bool> vis(n, false);
            vis[0] = true;
            amount[bob] = 0;
            gogoalice(adj, amount, vis, 0, amount[0], bob_path, 0, &ans);
        }
        return ans;
    }
};