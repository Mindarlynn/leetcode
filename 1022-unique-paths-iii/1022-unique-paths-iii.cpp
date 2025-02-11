class Solution {
public:
    int dir[4][2] = {
        {-1, 0},
        {1, 0},
        {0, 1},
        {0, -1}
    };

    void go(vector<vector<int>>& grid, vector<vector<bool>>& vis, int n, int m, int zeros, int y, int x, int* res){
        for(int i = 0; i < 4; ++i){
            int dy = y + dir[i][0], dx = x + dir[i][1];

            if(dy < 0 || dx < 0 || dy >= n || dx >= m) continue;
            if(grid[dy][dx] == -1 || vis[dy][dx]) continue;
            
            if(grid[dy][dx] == 2){
                if(zeros == 0) ++(*res);
            }
            else{
                vis[dy][dx] = true;
                go(grid, vis, n, m, zeros - 1, dy, dx, res);
                vis[dy][dx] = false;
            }
        }
    }

    int uniquePathsIII(vector<vector<int>>& grid) {
        int n = grid.size(), m = grid[0].size();

        vector<vector<bool>> vis(n, vector<bool>(m, false));

        int zeros = 0;
        int by = 0, bx = 0;
        for(int i = 0; i < n; ++i){
            for(int j = 0; j < m; ++j)
                if(grid[i][j] == 0) ++zeros;
                else if (grid[i][j] == 1) by = i, bx = j;
        }

        int ans = 0;
        vis[by][bx] = true;
        go(grid, vis, n, m, zeros, by, bx, &ans);
        return ans;
    }
};