class Solution {
public:
    // 1. transpose matrix
    // 2. swap ith and N - ith element (flip horizontally)

    void transpose(vector<vector<int>>& matrix){
        int N = matrix.size();
        vector<vector<int>> mat_ = matrix;

        for (int i = 0; i < N; ++i)
            for (int j = 0; j < N; ++j)
                matrix[i][j] = mat_[j][i];
    }

    void swap(int& a, int& b){
        int tmp = a;
        a = b;
        b = tmp;
    }

    void flip(vector<vector<int>>& matrix){
        int N = matrix.size();
        
        for(int i = 0; i < N; ++i)
            for(int j = 0; j < N / 2; ++j)
                swap(matrix[i][j], matrix[i][N - j - 1]);   
    }

    void rotate(vector<vector<int>>& matrix) {
        transpose(matrix);
        flip(matrix);
    }
};