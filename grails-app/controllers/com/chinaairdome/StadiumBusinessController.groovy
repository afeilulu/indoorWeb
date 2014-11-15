package com.chinaairdome

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class StadiumBusinessController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StadiumBusiness.list(params), model:[stadiumBusinessInstanceCount: StadiumBusiness.count()]
    }

    def show(StadiumBusiness stadiumBusinessInstance) {
        respond stadiumBusinessInstance
    }

    def create() {
        respond new StadiumBusiness(params)
    }

    @Transactional
    def save(StadiumBusiness stadiumBusinessInstance) {
        if (stadiumBusinessInstance == null) {
            notFound()
            return
        }

        if (stadiumBusinessInstance.hasErrors()) {
            respond stadiumBusinessInstance.errors, view:'create'
            return
        }

        stadiumBusinessInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'stadiumBusiness.label', default: 'StadiumBusiness'), stadiumBusinessInstance.id])
                redirect stadiumBusinessInstance
            }
            '*' { respond stadiumBusinessInstance, [status: CREATED] }
        }
    }

    def edit(StadiumBusiness stadiumBusinessInstance) {
        respond stadiumBusinessInstance
    }

    @Transactional
    def update(StadiumBusiness stadiumBusinessInstance) {
        if (stadiumBusinessInstance == null) {
            notFound()
            return
        }

        if (stadiumBusinessInstance.hasErrors()) {
            respond stadiumBusinessInstance.errors, view:'edit'
            return
        }

        stadiumBusinessInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StadiumBusiness.label', default: 'StadiumBusiness'), stadiumBusinessInstance.id])
                redirect stadiumBusinessInstance
            }
            '*'{ respond stadiumBusinessInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StadiumBusiness stadiumBusinessInstance) {

        if (stadiumBusinessInstance == null) {
            notFound()
            return
        }

        stadiumBusinessInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StadiumBusiness.label', default: 'StadiumBusiness'), stadiumBusinessInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'stadiumBusiness.label', default: 'StadiumBusiness'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
