package com.chinaairdome

class UserProfile {

    static constraints = {
    }

    String name;
    String phone;

    Date dateCreated;
    Date lastUpdated;

    String toString(){
        return name;
    }
}
