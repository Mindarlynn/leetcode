class Solution {
public:
    vector<vector<int>> pathes{};
    
    void find_pathes(vector<vector<int>>& graph, vector<int> path = {}, int i = 0){
        path.push_back(i);

        if(i == graph.size() - 1){
            pathes.push_back(path);
            return;
        }

        for(int j = 0; j < graph[i].size(); ++j){
            find_pathes(graph, path, graph[i][j]);
        }
    }

    vector<vector<int>> allPathsSourceTarget(vector<vector<int>>& graph) {
        find_pathes(graph);

        return pathes;
    }
};