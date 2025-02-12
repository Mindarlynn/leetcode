class Solution {
public:
    bool isValidSudoku(vector<vector<char>>& board) {
        const int n = 9;
        
        // row validity
        for(int i = 0; i < n; ++i){
            vector<int> tmp(10, 0);
            for(int j = 0; j < n; ++j){
                if(board[i][j] == '.') continue;
                if(tmp[board[i][j] - '0'] > 0) return false;
                ++tmp[board[i][j] - '0'];
            }
        }

        // col validity
        for(int j = 0; j < n; ++j){
            vector<int> tmp(10, 0);
            for(int i = 0; i < n; ++i){
                if(board[i][j] == '.') continue;
                if(tmp[board[i][j] - '0'] > 0) return false;
                ++tmp[board[i][j] - '0'];
            }
        }


        // square(3x3) validity
        for(int i = 0; i < 3; ++i){
            for(int j = 0; j < 3; ++j){
                vector<int> tmp(10, 0);
                for(int k = 0; k < 3; ++k){
                    for(int l = 0; l < 3; ++l){
                        if(board[i * 3 + k][j * 3 + l] == '.') continue;
                        if(tmp[board[i * 3 + k][j * 3 + l] - '0'] > 0) return false;
                        ++tmp[board[i * 3 + k][j * 3 + l] - '0'];
                    }
                }
            }
        }
    

        return true;
    }
};