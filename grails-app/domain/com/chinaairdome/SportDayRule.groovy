package com.chinaairdome


class SportDayRule {

    Sport sport;
    String ruleJson; // [{begin:9,end:9.5,:cost:20},{},{}]
    MinOrderUnit minOrderUnit; //选择最小支付单位

    static constraints = {
    }

    String toString(){
        if (sport != null)
            return sport.toString() + "-" + ruleJson;
        else
            return "";
    }
}
