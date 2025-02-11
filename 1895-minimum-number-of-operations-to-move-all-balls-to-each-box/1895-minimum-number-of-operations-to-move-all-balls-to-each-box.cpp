class Solution {
public:
    vector<int> minOperations(string boxes) {
        const int n = boxes.length();
        vector<int> ones{};
        
        for(int i = 0; i < n; ++i){
            if(boxes[i] == '0') continue;
            ones.emplace_back(i);
        }

        vector<int> res(n, 0);

        for(int i = 0; i < n; ++i){
            int tmp = 0;
            
            for(int j = 0; j < ones.size(); ++j){
                tmp += abs(ones[j] - i);
            }

            res[i] = tmp;
        }

        return res;
    }
};