package com.chinaairdome


class SportDayRule {

//    Sport sport;
    String ruleJson; // [{"from":"8:00","to":"16:00","cost":"8"},{"from":"16:00","to":"22:00","cost":"12"}]
    MinOrderUnit minOrderUnit; //选择最小支付单位
    String memo; // 此规则描述
    Boolean isAdopted; // 是否使用本规则

    static belongsTo = [sport:Sport]

    static constraints = {
    }

    String toString(){
        if (sport != null)
            return sport.name + "-" + ruleJson;
        else
            return "";
    }
}
