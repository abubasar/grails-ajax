package crm

import grails.converters.JSON

class CustomerController {

    def index() {
		def listCustomers=Customer.list()
		render(view:"index",model:[listCustomers:listCustomers])
	}
	def listCustomer(){
		def listCustomers=Customer.list()
		render(template:"listCustomer",model:[listCustomers:listCustomers])
	}
	def getCustomer(){
		Customer customer=Customer.get(params.id)
		render customer as JSON
	}
	
		
	def deleteCustomer(){
		
		def result=[:]
		Customer customer= Customer.get(params.id)
		try{
			customer.delete(flush:true)
			result["msg"]="OK"
		}catch(Exception e){
		result["msg"]="ERROR"
		}
		render result as JSON
	}
	
	def addCustomer(){
		def result=[:]
		Customer customer
		if(params.id){
			customer=Customer.get(params.id)
		}else{
		customer=new Customer()
		}
		customer.firstName=params.firstName
		customer.lastName=params.lastName
		customer.email=params.email
		customer.validate()
		if(!customer.hasErrors()){
		customer.save(flush:true)
		result["msg"]="OK"
		}else{
		result["msg"]="ERROR"
		}
		
		render result as JSON
	}
	
	def searchCustomer(){
		List<Customer> customers =Customer.findAllByFirstName(params.search)
		render customers as JSON
	}

}
