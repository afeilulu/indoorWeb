package com.chinaairdome


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StadiumManageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StadiumManage.list(params), model: [stadiumManageInstanceCount: StadiumManage.count()]
//        respond StadiumManage.withCriteria {
//            def now = new Date()
//            lt('dateStart',now)
//            gt('dateEnd',now)
//        }, model: [stadiumManageInstanceCount: StadiumManage.count()]
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
            respond stadiumManageInstance.errors, view: 'create'
            return
        }

        stadiumManageInstance.save flush: true

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
            respond stadiumManageInstance.errors, view: 'edit'
            return
        }

        stadiumManageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StadiumManage.label', default: 'StadiumManage'), stadiumManageInstance.id])
                redirect stadiumManageInstance
            }
            '*' { respond stadiumManageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StadiumManage stadiumManageInstance) {

        if (stadiumManageInstance == null) {
            notFound()
            return
        }

        stadiumManageInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StadiumManage.label', default: 'StadiumManage'), stadiumManageInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'stadiumManage.label', default: 'StadiumManage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
