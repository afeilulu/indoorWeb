package com.chinaairdome

class ReservationStatus {

    String status // "0,1,2,0,0,0....."
    Date reserveDate
    Sport sport
    Stadium stadium

    static belongsTo = [Sport, Stadium]

    static constraints = {
    }
}
