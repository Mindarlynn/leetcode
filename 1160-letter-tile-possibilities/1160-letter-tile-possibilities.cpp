class Solution {
public:
    void bcktrack(vector<int>& v, const int k, int l, int* ans){
        if(k == l){
            ++(*ans);
            return;
        }
        for(int i = 0; i < 26; ++i){
            if(v[i] <= 0) continue;
            v[i] -= 1;
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

        for(int i = 1; i <= n; ++i)
            bcktrack(alphas, i, 0, &ans);

        return ans;
    }
};