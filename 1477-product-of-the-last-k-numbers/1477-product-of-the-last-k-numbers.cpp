class ProductOfNumbers {
public:
    vector<int> prods{};

    ProductOfNumbers() {
        
    }
    
    void add(int num) {
        for(int i = 0; i < prods.size(); ++i){
            prods[i] *= num;
        }
        prods.push_back(num);
    }
    
    int getProduct(int k) {
        return prods[prods.size() - k];
    }
};

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * ProductOfNumbers* obj = new ProductOfNumbers();
 * obj->add(num);
 * int param_2 = obj->getProduct(k);
 */