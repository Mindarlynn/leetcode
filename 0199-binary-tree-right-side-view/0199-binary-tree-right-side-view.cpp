/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    vector<queue<int>> trav_res;

    void traverse(TreeNode* node, int depth = 0){
        if(!node) return;
        if(trav_res.size() <= depth){
            trav_res.push_back({});
        }
        trav_res[depth].push(node->val);

        traverse(node->left, depth + 1);
        traverse(node->right, depth + 1);
    }

    vector<int> rightSideView(TreeNode* root) {
        trav_res.clear();
        traverse(root);

        vector<int> ans{};
        for(const queue<int>& q : trav_res){
            ans.emplace_back(q.back());
        }
        return ans;    
    }
};