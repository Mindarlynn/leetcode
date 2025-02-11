class Solution {
public:
    template<typename T1, class T2>
    unordered_map<T1, int> count(const T2& param){
        unordered_map<T1, int> res{};
        for(const auto& e : param){
            ++res[e];
        }
        return res;
    }

    unordered_map<char, int> join_map(const unordered_map<char, int>& l, const unordered_map<char, int>& r){
        unordered_map<char, int> res{};
        for(const auto& [key, val] : l){
            res[key] += val;
        }
        for(const auto& [key, val] : r){
            res[key] += val;
        }

        return res;
    }

    void print(const unordered_map<char, int>& map){
        for(const auto& [key, val] : map){
            cout  << "{ " << key << ", " << val << " }, ";
        }
        cout << '\n';
    }

    
    int suuum(unordered_map<char, int> lettermap, vector<pair<int, unordered_map<char, int>>>& v, int x = 0, int sum = 0){
        if(x >= v.size()) return sum;
        int r1 = suuum(lettermap, v, x + 1, sum);
        
        int r2 = 0;
        bool subable = true;
        for(const auto& [key, val] : v[x].second){
            if(val > lettermap[key]){
                subable = false;
                break;
            }
        }
        if(subable){
            for(const auto& [key, val] : v[x].second){
                lettermap[key] -= val;
            }
            r2 = suuum(lettermap, v, x + 1, sum + v[x].first);
        }
        return ::max(r1, r2);
    }

    int maxScoreWords(vector<string>& words, vector<char>& letters, vector<int>& score) {
        const int n = words.size();
        unordered_map<char, int> lettermap = count<char>(letters);

        bool include[26] = {false, };

        vector<pair<int, unordered_map<char, int>>> v{};

        for(int i = 0; i < n; ++i){
            unordered_map<char, int> wmap = count<char>(words[i]);

            int acc = 0;
            for(int j = 0; j < words[i].length(); ++j){
                char c = words[i][j];
                if(wmap[c] > lettermap[c]) {
                    acc = 0;
                    break;
                }
                acc += score[c - 'a'];
            }

            if(acc == 0) continue;
            v.emplace_back(acc, wmap);
        }

        return suuum(lettermap, v);
    }
};