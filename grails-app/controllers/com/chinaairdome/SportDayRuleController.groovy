package com.chinaairdome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SportDayRuleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SportDayRule.list(params), model:[sportDayRuleInstanceCount: SportDayRule.count()]
    }

    def show(SportDayRule sportDayRuleInstance) {
        respond sportDayRuleInstance
    }

    def create() {
        respond new SportDayRule(params)
    }

    @Transactional
    def save(SportDayRule sportDayRuleInstance) {
        if (sportDayRuleInstance == null) {
            notFound()
            return
        }

        if (sportDayRuleInstance.hasErrors()) {
            respond sportDayRuleInstance.errors, view:'create'
            return
        }

        sportDayRuleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sportDayRule.label', default: 'SportDayRule'), sportDayRuleInstance.id])
                redirect sportDayRuleInstance
            }
            '*' { respond sportDayRuleInstance, [status: CREATED] }
        }
    }

    def edit(SportDayRule sportDayRuleInstance) {
        respond sportDayRuleInstance
    }

    @Transactional
    def update(SportDayRule sportDayRuleInstance) {
        if (sportDayRuleInstance == null) {
            notFound()
            return
        }

        if (sportDayRuleInstance.hasErrors()) {
            respond sportDayRuleInstance.errors, view:'edit'
            return
        }

        sportDayRuleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SportDayRule.label', default: 'SportDayRule'), sportDayRuleInstance.id])
                redirect sportDayRuleInstance
            }
            '*'{ respond sportDayRuleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SportDayRule sportDayRuleInstance) {

        if (sportDayRuleInstance == null) {
            notFound()
            return
        }

        sportDayRuleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SportDayRule.label', default: 'SportDayRule'), sportDayRuleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sportDayRule.label', default: 'SportDayRule'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    /**
     * 通过场馆id 查询 场馆运动和规则
     */
    def queryRule = {

        String id = params.get("id");

        List<Sport> sportList = Sport.findAllByStadium(Stadium.findById(id.toLong()));
        List<SportDayRule> sportDayRuleList = SportDayRule.findAllBySportInList(sportList);

        def results =[]

        sportDayRuleList.each {

            def stadiumId = it.sport.stadium.id.toString();

            def maxCount = it.sport.maxFieldCount;

            def name = it.sport.name;

            def minOrderUnit = it.minOrderUnit.name();

            def ruleJson = it.ruleJson;

            def one = ['stadiumId':stadiumId,'name':name,'maxCount':maxCount,'minOrderUnit':minOrderUnit,'ruleJson':ruleJson]

            results.add(one)
        }

        render(contentType:"text/json"){

            results
        }
    }
}
