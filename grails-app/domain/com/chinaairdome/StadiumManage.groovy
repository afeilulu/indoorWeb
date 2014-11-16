package com.chinaairdome

class StadiumManage {

    Stadium stadium;
    Sport sport;
    SportDayRule sportDayRule;
    Date dateStart;
    Date dateEnd;

    Date dateCreated;
    Date lastUpdated;

    static constraints = {
        // TODO 只显示某个场馆和运动项目的rule
    }

    String toString(){
        return stadium.toString() + " " + sportDayRule.toString();
    }
}
