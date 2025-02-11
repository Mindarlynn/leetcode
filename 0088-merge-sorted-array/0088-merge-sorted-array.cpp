class Solution {
public:
    void _merge(const vector<int>& nums1, int m, const vector<int>& nums2, int n, vector<int>& output, int i = 0, int j = 0) {
        if(i >= m && j >= n) return;
        if(j >= n){
            output.push_back(nums1[i++]);
        }
        else if(i >= m){
            output.push_back(nums2[j++]);
        }
        else{
            int l = nums1[i], r = nums2[j];

            if(l <= r){
                output.push_back(l);
                ++i;
            }
            else{
                output.push_back(r);
                ++j;
            }
        }
        _merge(nums1, m, nums2, n, output, i, j);

    }

    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
        if(n == 0) return;
        if(m == 0){
            nums1 = nums2;
            return;
        }

        vector<int> output{};

        _merge(nums1, m, nums2, n, output);
        
        nums1 = output;
    }
};