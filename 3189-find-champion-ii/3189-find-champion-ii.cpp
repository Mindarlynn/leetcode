class Solution {
public:
    int mat[100][100] = {0, };
    bool vis[100] = {false, };
    vector<int> no_child{};

    void dfs(int start, int n){
        int cnt = 0;
        for(int i = 0; i < n; ++i){
            if(mat[start][i] == 0){
                cnt++;
                continue;
            }
            if(vis[i]) continue;
            vis[i] = true;
            dfs(i, n);
        }
        if(cnt == n){
            // has no child -> the strongest node of graph
            no_child.push_back(start);
        }
    }

    void print_datas(int n = 100){
        return;
        cout << "\tmat\n";
        for(int i = 0; i < n; ++i){
            for(int j = 0; j < n; ++j){
                cout << mat[i][j] << ' ';
            }
            cout << '\n';
        }
        cout << '\n';

        cout << "\tvis\n";
        for(int i = 0; i < n; ++i){
            cout << vis[i] << ' ';
        }
        cout << '\n';

        cout << "\tno_child\n";
        for(int i = 0; i < no_child.size(); ++i){
            cout << no_child[i] << ' ';
        }
        cout << '\n';
    }

    int findChampion(int n, vector<vector<int>>& edges) {
        int m = edges.size();
        for(int i = 0; i < m; ++i){
            int u = edges[i][0], v = edges[i][1];
            // inverse DAG
            mat[v][u] = 1;
        }

        for(int i = 0; i < n; ++i){
            if(vis[i]) continue;
            vis[i] = true;
            dfs(i, n);
        }

        print_datas(n);

        return no_child.size() == 1 ? no_child.front() : -1;
    }
};