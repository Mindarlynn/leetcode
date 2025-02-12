class Solution {
public:
    int maxNumberOfBalloons(string text) {
        unordered_map<char, int> m{};

        for(const auto& c : text) ++m[c];

        const string balloon = "balon";

        int ans = INT_MAX;

        for(const auto& c : balloon){
            ans = ::min(ans, c == 'l' || c == 'o' ? m[c] / 2 : m[c]);
        }

        return ans;
    }
};