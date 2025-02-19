class Solution {
public:
    int dirs[4][2] = {
        {-1, 0},
        {1, 0},
        {0, 1},
        {0, -1}
    };

    int bfs(const int n, const int m, vector<vector<int>>& grid, vector<vector<bool>>& vis, int i, int j){
        queue<pair<int, int>> q{};
        vis[i][j] = true;
        q.push({i, j});

        int area = 0;

        while(!q.empty()){
            auto [y, x] = q.front(); q.pop();
            ++area;

            for(int i = 0; i < 4; ++i){
                int dy = y + dirs[i][0], dx = x + dirs[i][1];
                if(dy >= n || dy < 0 || dx >= m || dx < 0) continue;
                if(grid[dy][dx] == 0 || vis[dy][dx]) continue;
                vis[dy][dx] = true;
                q.push({dy, dx});
            }
        }
        return area;
    }

    int maxAreaOfIsland(vector<vector<int>>& grid) {
        const int n = grid.size(), m = grid[0].size();
        int ans = 0;
        vector<vector<bool>> vis(n, vector<bool>(m, false));
        for(int i = 0; i < n; ++i){
            for(int j = 0; j < m; ++j){
                if(grid[i][j] == 0 || vis[i][j]) continue;
                ans = max(ans, bfs(n, m, grid, vis, i, j));
            }
        }
        return ans;
    }
};