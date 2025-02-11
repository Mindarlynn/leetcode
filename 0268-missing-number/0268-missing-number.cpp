class Solution {
public:

    inline int sum(const vector<int>& vec){
        int sum = 0;
        for(const int& e : vec) sum += e;
        return sum;
    }
    
    inline int seqsum(const int& n){
        return n * (n+1) / 2;
    }

    int missingNumber(vector<int>& nums) {
        return seqsum(nums.size()) - sum(nums);
    }
};