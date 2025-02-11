class Solution {
public:
    int direction[4][2] = {
        {-1, 0}, {1, 0}, {0, -1}, {0, 1}
    };

    void bfs(vector<vector<char>>& grid, const int n, const int m, int _y, int _x){
        queue<pair<int, int>> q{};
        grid[_y][_x] = 0;
        q.push({_y, _x});

        while(!q.empty()){
            auto [y, x] = q.front(); q.pop();
            
            for(int i = 0; i < 4; ++i){
                int dx = x + direction[i][0], dy = y + direction[i][1];
                
                if(dy < 0 || dy >= n || dx < 0 || dx >= m) continue;
                if(grid[dy][dx] != '1') continue;
                grid[dy][dx] = 0;
                q.push({dy, dx});
            }
        }
    }

    int numIslands(vector<vector<char>>& grid) {
        int n = grid.size();
        int m = grid[0].size();

        int ans = 0;

        for(int i = 0; i < n; ++i){
            for(int j = 0; j < m; ++j){
                if(grid[i][j] != '1') continue;

                bfs(grid, n, m, i, j);
                ++ans;
            }
        }

        return ans;
    }
};