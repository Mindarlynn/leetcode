class NumberContainers {
public:
    unordered_map<int, set<int>> ntoi;
    unordered_map<int, int> iton;


    NumberContainers() {
        
    }
    
    void change(int index, int number) {
        ntoi[iton[index]].erase(index);
        iton[index] = number;
        ntoi[number].insert(index);
    }
    
    int find(int number) {
        if(ntoi[number].size()) return *ntoi[number].cbegin();

        return -1;
    }
};

/**
 * Your NumberContainers object will be instantiated and called as such:
 * NumberContainers* obj = new NumberContainers();
 * obj->change(index,number);
 * int param_2 = obj->find(number);
 */