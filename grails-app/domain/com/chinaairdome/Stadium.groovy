package com.chinaairdome

class Stadium {

    static constraints = {
    }

    String name;
    String phone;
    String city;
    String address;
    String picUrl;
    double lng; // 经度
    double lat; // 纬度
    Date dateCreated;
    Date lastUpdated

    String toString() {
        return name
    }
}
