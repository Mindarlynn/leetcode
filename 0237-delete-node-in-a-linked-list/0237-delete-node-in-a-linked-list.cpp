/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    void deleteNode(ListNode* node) {
        auto swap = [](int& a, int& b){
            int tmp = a;
            a = b;
            b = tmp;
        };

        ListNode* prev = nullptr;
        while(node->next){
            swap(node->val, node->next->val);
            prev = node;
            node = node->next;
        }
        prev->next = nullptr;
    }
};