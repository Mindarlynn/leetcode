class Solution {
public:
    void bcktrack(vector<int>& v, const int k, int l, int* ans){
        if(k == l){    
            return;
        }
        for(int i = 0; i < 26; ++i){
            if(v[i] <= 0) continue;
            v[i] -= 1;
            ++(*ans);
            bcktrack(v, k, l + 1, ans);
            v[i] += 1;
        }
    }

    int numTilePossibilities(string tiles) {
        const int n = tiles.size();
        vector<int> alphas(26, 0);

        for(int i = 0; i < n; ++i){
            ++alphas[tiles[i] - 'A'];
        } 

        int ans = 0;
        bcktrack(alphas, n, 0, &ans);

        return ans;
    }
};