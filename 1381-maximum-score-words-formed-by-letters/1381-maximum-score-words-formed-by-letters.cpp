class Solution {
public:
    template<class T>
    vector<int> count(const T& param){
        vector<int> res(26, 0);
        for(const auto& e : param){
            ++res[e - 'a'];
        }
        return res;
    }

    vector<int> join_map(const vector<int>& l, const vector<int>& r){
        vector<int> res(26, 0);
        for(int i = 0; i < 26; ++i){
            res[i] = l[i] + r[i];
        }
        return res;
    }

    pair<bool, vector<int>> get_subable(const vector<int>& origin, const vector<int>& sub){
        vector<int> res = origin;
        for(int i = 0; i < 26; ++i){
            if(sub[i] > origin[i]){
                return {false, {}};
            }
            res[i] -= sub[i];
        }
        return {true, res};
    }
    
    int suuum(vector<int> lettercnt, vector<pair<int, vector<int>>>& v, int x = 0, int sum = 0){
        if(x >= v.size()) return sum;

        int r1 = suuum(lettercnt, v, x + 1, sum);
        
        auto [subable, subablecnt] = get_subable(lettercnt, v[x].second);
        
        int r2 = subable ? suuum(subablecnt, v, x + 1, sum + v[x].first) : 0;
        
        return ::max(r1, r2);
    }

    int maxScoreWords(vector<string>& words, vector<char>& letters, vector<int>& score) {
        const int n = words.size();
        vector<int> lettercnt = count(letters);

        vector<pair<int, vector<int>>> v{};

        for(int i = 0; i < n; ++i){
            vector<int> wordcnt = count(words[i]);

            int acc = 0;
            for(int i = 0; i < 26; ++i){
                if(wordcnt[i] > lettercnt[i]){
                    acc = 0;
                    break;
                }
                acc += wordcnt[i] * score[i];
            }

            if(acc == 0) continue;
            v.emplace_back(acc, wordcnt);
        }

        return suuum(lettercnt, v);
    }
};