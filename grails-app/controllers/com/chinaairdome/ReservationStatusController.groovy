package com.chinaairdome

import grails.transaction.Transactional

import java.text.SimpleDateFormat

@Transactional(readOnly = true)
class ReservationStatusController {

    static allowedMethods = [save: "POST",saveInJson: "POST"]

    def query() {
        def dateString = params.get("date").toString()
//        def paramDate = new SimpleDateFormat("yyyyMMdd").parse(dateString)
        def sport = Sport.findById(params.get("sportId").toString().toLong())
        def stadium = Stadium.findById(params.get("stadiumId").toString().toLong())

//        def result = ReservationStatus.withCriteria(uniqueResult: true) {
//            between('reserveDate', paramDate, paramDate + 1)
//            eq('sport', sport)
//            eq('stadium', stadium)
//        }

        def result = ReservationStatus.findByDateAndSportAndStadium(dateString,sport,stadium);

        if (result != null)
            render(contentType: "text/json") {
                ['resultCode': 1, 'stadiumId': result.stadium.id, 'sportId': result.sport.id, 'status': result.status, 'date': result.date]
            }
        else
            render(contentType: "text/json") {
                ['resultCode': 0]
            }

    }

    @Transactional
    def save() {
        def dateString = params.get("date").toString()
//        def paramDate = new SimpleDateFormat("yyyyMMdd").parse(dateString)
        def sport = Sport.findById(params.get("sportId").toString().toLong())
        def stadium = Stadium.findById(params.get("stadiumId").toString().toLong())

//        def result = ReservationStatus.withCriteria(uniqueResult: true) {
//            between('reserveDate', paramDate, paramDate + 1)
//            eq('sport', sport)
//            eq('stadium', stadium)
//        }
        def result = ReservationStatus.findByDateAndSportAndStadium(dateString,sport,stadium);

        if (result == null) {
            // save new record
            result = new ReservationStatus()
            result.stadium = stadium
            result.sport = sport
            result.date = dateString
        }

        // update record
        result.status = params.get("status").toString()

        result.save flush: true

        render(contentType: "text/json") {
            ['resultCode': 1,'resultMessage':'保存成功']
        }
    }

    /**
     * data post in json format
     * @return
     */
    @Transactional
    def saveInJson() {
        def results = request.JSON

        results.each { item ->

            def dateString = item.getAt("date").toString();
            def sport = Sport.findById(item.getAt("sportId").toString().toLong())
            def stadium = Stadium.findById(item.getAt("stadiumId").toString().toLong())
            def result = ReservationStatus.findByDateAndSportAndStadium(dateString, sport, stadium);
            def status = item.getAt("status").toString();

            if (result == null) {
                // save new record
                result = new ReservationStatus()
                result.stadium = stadium
                result.sport = sport
                result.date = dateString
                result.status = status
            } else {
                def oldStatus = result.status.split(',');
                def newStatus = status.split(',');

                for (int i = 0; i < newStatus.length; i++) {
                    if (newStatus[i].toInteger() == 1) {
                        def newValue = oldStatus[i].toInteger();
                        if (newValue < sport.maxFieldCount) {
                            newValue++;
                            oldStatus[i] = newValue.toString();
                        }
                    }
                }
                // update record
                result.status = oldStatus.join(',')
            }

            result.save flush: true

        }

        render(contentType: "text/json") {
            ['resultCode': 1,'resultMessage':'保存成功']
        }

    }

}
