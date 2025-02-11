class Solution {
public:
    int maxRepeating(string sequence, string word) {
        int ans{};
        string acc{word};

        while(sequence.find(acc) != string::npos){
            acc += word;
            ++ans;
        }

        return ans;
    }
};