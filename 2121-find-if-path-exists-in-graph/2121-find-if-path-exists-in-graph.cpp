class Solution {
public:
    bool trav(vector<vector<int>>& g, vector<bool>& vis, int l, int target){
        if(l == target) return true;

        bool res = false;
        for(int i = 0; i < g[l].size(); ++i){
            if(vis[g[l][i]]) continue;
            vis[g[l][i]] = true;
            res |= trav(g, vis, g[l][i], target);
        }
        return res;
    }

    bool validPath(int n, vector<vector<int>>& edges, int source, int destination) {
        vector<vector<int>> adj(n, vector<int>());
        
        for(int i = 0; i < edges.size(); ++i){
            int u = edges[i][0], v = edges[i][1];
            adj[u].push_back(v);
            adj[v].push_back(u);
        }
        vector<bool> vis(n, false);
        vis[source] = true;
        return trav(adj, vis, source, destination);;
    }
};