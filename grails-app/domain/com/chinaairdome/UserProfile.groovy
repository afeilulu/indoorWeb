package com.chinaairdome

/**
 * 互联网用户，不能查看web，只能通过手机客户端查看预约情况
 *
 */
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
