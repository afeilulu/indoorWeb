package com.chinaairdome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StadiumController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def myParams = this.getProperty("params");
        println(myParams.toString());
        String format = params.get("format");
        String city = params.get("city");
        if (format != null && format.equals("json")
            && city != null){

            def stadiumList = Stadium.createCriteria().list {
                rlike("city","^" + city )
            }
            respond stadiumList, model:[stadiumInstanceCount: Stadium.count()]
        } else
            respond Stadium.list(params), model:[stadiumInstanceCount: Stadium.count()]
    }

    def show(Stadium stadiumInstance) {
        respond stadiumInstance
    }

    def create() {
        respond new Stadium(params)
    }

    @Transactional
    def save(Stadium stadiumInstance) {
        if (stadiumInstance == null) {
            notFound()
            return
        }

        if (stadiumInstance.hasErrors()) {
            respond stadiumInstance.errors, view:'create'
            return
        }

        stadiumInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'stadium.label', default: 'Stadium'), stadiumInstance.id])
                redirect stadiumInstance
            }
            '*' { respond stadiumInstance, [status: CREATED] }
        }
    }

    def edit(Stadium stadiumInstance) {
        respond stadiumInstance
    }

    @Transactional
    def update(Stadium stadiumInstance) {
        if (stadiumInstance == null) {
            notFound()
            return
        }

        if (stadiumInstance.hasErrors()) {
            respond stadiumInstance.errors, view:'edit'
            return
        }

        stadiumInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Stadium.label', default: 'Stadium'), stadiumInstance.id])
                redirect stadiumInstance
            }
            '*'{ respond stadiumInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Stadium stadiumInstance) {

        if (stadiumInstance == null) {
            notFound()
            return
        }

        stadiumInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Stadium.label', default: 'Stadium'), stadiumInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'stadium.label', default: 'Stadium'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
