/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    int length(ListNode* node){
        if(!node) return 0;
        return 1 + length(node->next);
    }

    int pairSum(ListNode* head) {
        int n = length(head);
        vector<int> v(n / 2, 0);    
        int i = 0;
        ListNode* cur = head;
        while(i < n / 2){
            v[i++] = cur->val;
            cur = cur->next;
        }
        int max = 0;
        while(i < n){
            max = ::max(v[n - i - 1] + cur->val, max);
            cur = cur->next;
            ++i;
        }
        return max;
    }
};