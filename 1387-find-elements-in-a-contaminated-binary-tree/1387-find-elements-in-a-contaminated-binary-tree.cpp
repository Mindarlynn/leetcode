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
class FindElements {
public:
    TreeNode* head = nullptr;
    unordered_set<int> memo{};

    void build(TreeNode* node) {
        if(!node) return;
        memo.insert(node->val);

        if(node->left){
            node->left->val = 2 * node->val + 1;
        }
        if(node->right){
            node->right->val = 2 * node->val + 2;
        }
        
        build(node->left);
        build(node->right);
    }

    FindElements(TreeNode* root) {
        head = root;
        head->val = 0;

        build(head);
    }

    bool find(int target){
        return memo.contains(target);
    }
};

/**
 * Your FindElements object will be instantiated and called as such:
 * FindElements* obj = new FindElements(root);
 * bool param_1 = obj->find(target);
 */