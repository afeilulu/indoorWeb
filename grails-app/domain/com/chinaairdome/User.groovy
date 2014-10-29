package com.chinaairdome

class User {

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
