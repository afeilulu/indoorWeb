package com.chinaairdome

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class StadiumManageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StadiumManage.list(params), model:[stadiumManageInstanceCount: StadiumManage.count()]
    }

    def show(StadiumManage stadiumManageInstance) {
        respond stadiumManageInstance
    }

    def create() {
        respond new StadiumManage(params)
    }

    @Transactional
    def save(StadiumManage stadiumManageInstance) {
        if (stadiumManageInstance == null) {
            notFound()
            return
        }

        if (stadiumManageInstance.hasErrors()) {
            respond stadiumManageInstance.errors, view:'create'
            return
        }

        stadiumManageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'stadiumManage.label', default: 'StadiumManage'), stadiumManageInstance.id])
                redirect stadiumManageInstance
            }
            '*' { respond stadiumManageInstance, [status: CREATED] }
        }
    }

    def edit(StadiumManage stadiumManageInstance) {
        respond stadiumManageInstance
    }

    @Transactional
    def update(StadiumManage stadiumManageInstance) {
        if (stadiumManageInstance == null) {
            notFound()
            return
        }

        if (stadiumManageInstance.hasErrors()) {
            respond stadiumManageInstance.errors, view:'edit'
            return
        }

        stadiumManageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StadiumManage.label', default: 'StadiumManage'), stadiumManageInstance.id])
                redirect stadiumManageInstance
            }
            '*'{ respond stadiumManageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StadiumManage stadiumManageInstance) {

        if (stadiumManageInstance == null) {
            notFound()
            return
        }

        stadiumManageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StadiumManage.label', default: 'StadiumManage'), stadiumManageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'stadiumManage.label', default: 'StadiumManage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def sportById(){
        if (!params.id || params.id == "null") {
            render(g.select(optionKey:"id",from:null,name="sport",noSelection:['':'Select ...']))
        } else {
            def lll = Sport.findAllByStadium(Stadium.get(params.id))
            render g.select(optionKey: "id", from: lll, name: "sport", noSelection:['':'Select ...']
                    , remoteFunction(action: 'ruleById',update: [success: 'sportDayRule', failure: 'ohno'],params: '\'id=\' + this.value'))
        }

    }

    def ruleById(){
        if (!params.id || params.id == "null") {
            render g.select(optionKey:"id",from:null,name="sportDayRule")
        } else {
            def lll = SportDayRule.findAllBySport(Sport.get(params.id))
            render g.select(optionKey: "id", from: lll, name: "sportDayRule",noSelection:['':'Select ...'])
        }
    }
}
