class Solution {
public:
    struct user{
        bool online = true;
        // will be online at this time
        int tto = -1;
        int mention_count = 0;
    };
    
    void set_user_online(vector<struct user>& users, int current_time){
        for(int i = 0; i < users.size(); ++i){
            // check tto and set user online which current time is after tto
            if(users[i].tto > current_time) continue;
            users[i].online = true;
            users[i].tto = -1;   
        }
    }
    
    void set_user_offline(vector<struct user>& users, int current_time, int id){
        users[id].online = false;
        users[id].tto = current_time + 60;
    }
    
    void process_message(vector<struct user>& users, const string& mention){
        switch(mention[0]){
            case 'A':
                for(int i = 0; i < users.size(); ++i) ++users[i].mention_count;
                break;
            case 'H':
                for(int i = 0; i < users.size(); ++i) if(users[i].online) ++users[i].mention_count;
                break;
            default:
                // 1. split and get user ids
                // 2. count online user in (1) list
                
                // split
                vector<int> ids{};
                stringstream ss{};
                
                for(int i = 0; i < mention.length(); ++i){
                    if(mention[i] == ' '){
                        ids.push_back(stoi(ss.str().substr(2)));
                        ss.str("");
                        continue;
                    }
                    
                    ss << mention[i];
                }
                
                ids.push_back(stoi(ss.str().substr(2)));
                ///////////
                
                for(int i = 0; i < ids.size(); ++i) ++users[ids[i]].mention_count;
                break;
        }
    }
    
    void parse_event(vector<struct user>& users, const vector<string>& e){
        // 0 : MESSAGE or OFFLINE
        // 1 : TIME STAMP
        // 2 : MENTION ( id<> or HERE or ALL)
        //  id<N>: mention specific user
        //  HERE: mention only online user
        //  ALL: mention users whether online or not
        
        // make current time
        int current_time = stoi(e[1]);
        
        set_user_online(users, current_time);
        
        switch(e[0][0]){
            case 'M':
                // process message
                process_message(users, e[2]);
                break;
            case 'O':
                // process offline
                int id = stoi(e[2]);
                set_user_offline(users, current_time, id);
                break;
        }
    }
    
    vector<int> countMentions(int n, vector<vector<string>>& e) {
        vector<struct user> users;
        users.resize(n);
        
        sort(e.begin(), e.end(), [](vector<string>& a, vector<string>& b)->bool{
            int a_time = stoi(a[1]), b_time = stoi(b[1]);
            
            if(a_time == b_time){
                if(a[0][0] == 'O') return true;
                if(b[0][0] == 'O') return false;
            }
            
            return a_time <= b_time;
        });
        
        for(int i = 0; i < e.size(); ++i){
            parse_event(users, e[i]);
        }
        
        vector<int> res{};
        for(int i = 0; i < n; ++i) 
            res.emplace_back(users[i].mention_count);
        
        return res;
    }
};