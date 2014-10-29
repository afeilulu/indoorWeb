package com.chinaairdome

class SportDayRule {

    Sport sport;
    int timeFrom; //1-24
    int timeTo; // 1-24
    int cost;

    static constraints = {
    }

    String toString(){
        if (sport != null)
            return sport.name + ":" + timeFrom + " - " + timeTo + ":" + cost;
        else
            return "";
    }
}
