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
    ListNode* mergeInBetween(ListNode* list1, int a, int b, ListNode* list2) {
        ListNode* cur = list1;
        
        while(a > 1){
            --a, --b;
            cur = cur->next;
        }
        ListNode* bskip = cur;
        while(b >= 0){
            --b;
            bskip = bskip->next;
        }

        cur->next = list2;
        while(cur->next){
            cur = cur->next;
        }
        cur->next = bskip;
        
        return list1;
    }
};