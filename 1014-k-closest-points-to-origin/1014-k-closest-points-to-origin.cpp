class Solution {
public:
    inline double dist_from_origin(double x, double y) const{
        return sqrt(x * x + y * y);
    }


    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {
        priority_queue<pair<double, vector<int>>, vector<pair<double, vector<int>>>, greater<pair<double, vector<int>>>> pq{};
        for(const auto& cord : points) pq.push({dist_from_origin(cord[0], cord[1]), cord});
        vector<vector<int>> ans{};
        while(k-- > 0) ans.push_back(pq.top().second), pq.pop();
        return ans;
    }
};