// The API isBadVersion is defined for you.
// bool isBadVersion(int version);

class Solution {
public:
    int firstBadVersion(int n) {
        int l = 0, r = n;

        while(r - l > 1){
            int m = l + (r - l) / 2;
            if(isBadVersion(m)) r = m;
            else l = m;
        }

        return r;
    }
};