class Solution {
public:
    vector<int> partitionLabels(string s) {
        const int n = s.length();
        int pos[26] = {0,};

        for(int i = 0; i < n; ++i){
            pos[s[i] - 'a'] = i;
        }

        vector<int> ans{};
        int prev = -1, max = 0;
        for(int i = 0; i < n; ++i){
            max = ::max(max, pos[s[i] - 'a']);
            if(max == i){
                ans.push_back(max - prev);
                prev = max;
            }
        }

        return ans;
    }
};