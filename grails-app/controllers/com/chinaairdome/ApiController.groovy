package com.chinaairdome

class ApiController {

    def index() { }
    def stadium() {
       params.max = Math.min(params.max ? params.int('max') : 10, 100)
       def statium = Stadium.list(params)
       render(contentType:"application/json"){
          rows=statium.size
          list=array{statium.each {one ->
             id:one.id
             name:one.name
	  }}
       }
    }
    def sport() {
       params.max = Math.min(params.max ? params.int('max') : 10, 100)
       render(contentType:"application/json"){
          rows=Sport.count()
          list=array{Sport.list(params).each {one ->
             id:one.id
             name:one.name
	  }}
       }
    }
}
