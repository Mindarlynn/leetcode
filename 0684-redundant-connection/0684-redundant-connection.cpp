class Solution {
public:
    bool isCyclicUtil(int v, vector<vector<int>>& adj, bool visited[], int parent) {
        visited[v] = true;

        for (int i : adj[v]) {
            if (!visited[i]) {
                if (isCyclicUtil(i, adj, visited, v))
                    return true;
            }
            else if (i != parent)
                return true;
        }
        return false;
    }

    bool isCyclic(int V, vector<vector<int>>& adj) {
        bool* visited = new bool[V]{false};

        for (int u = 0; u < V; u++) {
            if (!visited[u])
                if (isCyclicUtil(u, adj, visited, -1))
                    return true;
        }
        return false;
    }
    

    vector<int> findRedundantConnection(vector<vector<int>>& edges) {
        int n = edges.size();

        vector<vector<int>> g(n, vector<int>{});


        for(int i = 0; i < n; ++i){
            int v1 = edges[i][0] - 1, v2 = edges[i][1] - 1;
            
            g[v1].push_back(v2);
            g[v2].push_back(v1);
        }

        for(int i = n - 1; i >= 0; --i){
            int v1 = edges[i][0] - 1, v2 = edges[i][1] - 1;

            g[v1].erase(std::remove(g[v1].begin(), g[v1].end(), v2), g[v1].end());
            g[v2].erase(std::remove(g[v2].begin(), g[v2].end(), v1), g[v2].end());

            if(isCyclic(n, g)){
                g[v1].push_back(v2);
                g[v2].push_back(v1);
            }
            else{
                return edges[i];
            }
        }

        return {};
    }
};