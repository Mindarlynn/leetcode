class MinStack {
public:
    struct node{
        int val, min;
        struct node* next;
        node(int val, int min, struct node* next) : val(val), min(min), next(next) {}
    }* head = nullptr;

    MinStack() {
        
    }
    
    void push(int val) {
        if(head)
            head = new node(val, min(val, head->min), head);
        else
            head = new node(val, val, nullptr);
    }
    
    void pop() {
        struct node* tmp = head;
        head = head->next;
        delete tmp;
    }
    
    int top() {
        return head->val;
    }
    
    int getMin() {
        return head->min;
    }
};

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack* obj = new MinStack();
 * obj->push(val);
 * obj->pop();
 * int param_3 = obj->top();
 * int param_4 = obj->getMin();
 */