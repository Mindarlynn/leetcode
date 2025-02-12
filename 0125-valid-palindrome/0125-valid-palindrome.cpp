class Solution {
public:
    int is_alpha(char c){
        if(c >= 'A' && c <= 'Z' || c >= '0' && c <= '9') return 1;
        if(c >= 'a' && c <= 'z') return 2;

        return 0;
    }

    bool isPalindrome(string s) {
        stringstream ss{};

        for(int i = 0; i < s.length(); ++i){
            switch(is_alpha(s[i])){
                case 2: ss << s[i]; break;
                case 1: ss << (char)(s[i] + 32); break;
                default: break;
            }
        }

        s = ss.str();
        const int n = s.length();
        for(int i = 0; i < n / 2; ++i){
            if(s[i] != s[n - i - 1]) return false;
        }

        return true;
    }
};