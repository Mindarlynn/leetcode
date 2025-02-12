class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        const int n = intervals.size();

        sort(intervals.begin(), intervals.end(), [](const auto& a,const auto& b) -> bool{
            return a[0] < b[0];
        });

        vector<vector<int>> ans{};

        int l = intervals[0][0], r = intervals[0][1];
        
        for(int i = 1; i < n; ++i){
            int curl = intervals[i][0], curr = intervals[i][1];
            if(r < curl){
                ans.push_back({l, r});
                l = curl, r = curr;
            }
            else{
                r = ::max(r, curr);
            }
        }

        ans.push_back({l, r});

        return ans;
    }
};