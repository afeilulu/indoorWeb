package com.chinaairdome

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class SecureTestController {

    def index() {
        render 'Secure access only'
    }
}
