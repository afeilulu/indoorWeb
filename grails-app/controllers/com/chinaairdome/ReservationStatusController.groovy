package com.chinaairdome

import grails.transaction.Transactional

import java.text.SimpleDateFormat

@Transactional(readOnly = true)
class ReservationStatusController {

    static allowedMethods = [save: "POST"]

    def query() {
        def dateString = params.get("date").toString()
        def paramDate = new SimpleDateFormat("yyyyMMdd").parse(dateString)
        def sport = Sport.findById(params.get("sportId").toString().toLong())
        def stadium = Stadium.findById(params.get("stadiumId").toString().toLong())

        def result = ReservationStatus.withCriteria(uniqueResult: true) {
            between('reserveDate', paramDate, paramDate + 1)
            eq('sport', sport)
            eq('stadium', stadium)
        }

        if (result != null)
            render(contentType: "text/json") {
                ['resultCode': 1, 'stadiumId': result.stadium.id, 'sportId': result.sport.id, 'status': result.status, 'reservedate': result.reserveDate]
            }
        else
            render(contentType: "text/json") {
                ['resultCode': 0]
            }

    }

    @Transactional
    def save() {
        def dateString = params.get("date").toString()
        def paramDate = new SimpleDateFormat("yyyyMMdd").parse(dateString)
        def sport = Sport.findById(params.get("sportId").toString().toLong())
        def stadium = Stadium.findById(params.get("stadiumId").toString().toLong())

        def result = ReservationStatus.withCriteria(uniqueResult: true) {
            between('reserveDate', paramDate, paramDate + 1)
            eq('sport', sport)
            eq('stadium', stadium)
        }

        if (result == null) {
            // save new record
            result = new ReservationStatus()
            result.stadium = stadium
            result.sport = sport
            result.status = ""
            result.reserveDate = paramDate
        } else {
            // update record
            result.status = params.get("status").toString()
        }

        result.save flush: true
    }

}
