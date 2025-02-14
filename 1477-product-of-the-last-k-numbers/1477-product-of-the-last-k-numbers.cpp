class ProductOfNumbers {
public:
    vector<int> prods;

    ProductOfNumbers() {
        prods.push_back(1);
    }
    
    void add(int num) {
        if(num == 0){
            prods.clear();
            prods.push_back(1);
        }
        else{
            prods.push_back(*prods.rbegin() * num);
        }
    }
    
    int getProduct(int k) {
        return k < prods.size() ? *prods.rbegin() / prods[prods.size() - k - 1] : 0;
    }
};

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * ProductOfNumbers* obj = new ProductOfNumbers();
 * obj->add(num);
 * int param_2 = obj->getProduct(k);
 */