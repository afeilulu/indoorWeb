package com.chinaairdome

/**
 * 定义属于某一个场馆的运动，以及在该场馆这项运动的最大场地数
 */
class Sport {

    String name;
    int maxFieldCount;
    Stadium stadium;

    static constraints = {
    }

    String toString() {
        if (stadium != null)
            return stadium.name + "-" +name
        else
            return name;
    }
}
