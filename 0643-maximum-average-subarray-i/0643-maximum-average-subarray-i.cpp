class Solution {
public:
    double findMaxAverage(vector<int>& nums, int k) {
        const int n = nums.size();
        double avg = 0;

        for(int i = 0; i < k; ++i)
            avg += nums[i];
        avg /= k;

        double ans = avg;
        for(int i = k; i < n; ++i){
            avg = (avg * k + nums[i] - nums[i - k]) / k;
            ans = max(ans, avg);
        }
        return ans;
    }
};