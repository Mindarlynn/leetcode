class Solution {
public:
    vector<vector<int>> adj{};

    vector<int> ans{};

    void dfs(vector<bool>& vis, int s){
        if(adj[s].size() == 0){
            ans.push_back(s); return;
        }
        
        for(int i = 0; i < adj[s].size(); ++i){
            if(vis[adj[s][i]]) continue;
            vis[adj[s][i]] = true;
            dfs(vis, adj[s][i]);
        }
    }
    

    vector<int> findSmallestSetOfVertices(int n, vector<vector<int>>& edges) {
        adj.resize(n, {});

        for(int i = 0; i < edges.size(); ++i){
            adj[edges[i][1]].push_back(edges[i][0]);
        }

        vector<bool> visited(n, false);

        for(int i = 0; i < n; ++i){
            if(visited[i]) continue;
            visited[i] = true;
            dfs(visited, i);
        }

        return ans;
    }
};