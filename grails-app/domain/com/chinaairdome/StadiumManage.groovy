package com.chinaairdome

class StadiumManage {

    Stadium stadium;
    SportDayRule sportDayRule;
    Date dateStart;
    Date dateEnd;

    Date dateCreated;
    Date lastUpdated;

    static constraints = {
    }

    String toString(){
        return stadium.toString() + " " + sportDayRule.toString();
    }
}
