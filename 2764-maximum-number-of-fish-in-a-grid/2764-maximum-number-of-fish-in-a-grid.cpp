typedef vector<vector<int>> vvi;
typedef pair<int, int> pii;

class Solution {
public:
    int dir[4][2] = {
        {0, 1},
        {0, -1},
        {1, 0},
        {-1, 0}
    };

    int bfs(vvi& g, int n, int m, int sx, int sy){
        queue<pii> q{};
        q.push({sx, sy});
        
        int res = g[sy][sx];
        g[sy][sx] = 0;

        while(!q.empty()){
            auto [x, y] = q.front(); q.pop();

            for(int i = 0; i < 4; ++i){
                int dx = x + dir[i][0], dy = y + dir[i][1];
                
                if(dx < 0 || dy < 0 || dx >= m || dy >= n) continue;
                if(g[dy][dx] == 0) continue;

                res += g[dy][dx];
                g[dy][dx] = 0;

                q.push({dx, dy});
            }      
        }
        return res;
    }


    int findMaxFish(vector<vector<int>>& grid) {
        int n = grid.size(), m = grid[0].size();
        int ans = 0;

        for(int i = 0; i < n; ++i){
            for(int j = 0; j < m; ++j){
                if(grid[i][j] == 0) continue;
                ans = ::max(ans, bfs(grid, n, m, j, i));
            }
        }

        return ans;
    }
};