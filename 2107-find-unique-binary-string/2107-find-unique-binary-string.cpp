class Solution {
public:
    void bcktrk(const int n, unordered_set<string>& s, string& tmp, string* res){
        if(tmp.length() == n){
            if(!s.contains(tmp)){
                (*res) = tmp;
            }
            return;
        }

        for(char c = '0'; c <= '1'; ++c){
            tmp += c;
            bcktrk(n, s, tmp, res);
            tmp = tmp.substr(0, tmp.length() - 1);
            if((*res) != "") return;
        }
    }

    string findDifferentBinaryString(vector<string>& nums) {
        const int n = nums.size();
        unordered_set<string> s{};

        for(int i = 0; i < n; ++i)
            s.insert(nums[i]);

        string ans, tmp;
        bcktrk(n, s, tmp, &ans);
        return ans;        
    }
};