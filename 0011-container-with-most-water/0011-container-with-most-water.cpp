class Solution {
public:
    int maxArea(vector<int>& height) {
        int n = height.size();

        int l = 0, r = n - 1, ans = 0;

        while(l < r){
            int h = min(height[l], height[r]), d = r - l;

            ans = ::max(ans, h * d);
            
            if(height[l] <= height[r]) ++l;
            else --r;
        }

        return ans;
    }
};