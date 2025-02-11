class Solution {
public:
    inline bool is_numeric(char c){
        return c >= '0' && c <= '9';
    }

    string clearDigits(string s) {
        const int n = s.length();

        bool exclude[100] = {false,};

        for(int i = 0; i < n; ++i){
            if(!is_numeric(s[i])) continue;

            exclude[i] = true;
            
            int j = i - 1;
            
            while((is_numeric(s[j]) || exclude[j] )&& j >= 0) --j;

            exclude[j] = true;
        }

        stringstream ss;
        for(int i = 0; i < n; ++i) 
            if(!exclude[i]) ss << s[i];


        return ss.str();
    }
};