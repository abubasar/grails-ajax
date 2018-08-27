<html>
<head>
<meta name="layout" content="main">
<title>Welcome to CRM api</title>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>--%>
<g:javascript library="jquery"/>
	<style type="text/css">
<style type="text/css">
#divCustomers{}
#divFormCustomer{
padding:5px
}

</style>

<script type="text/javascript">
$(document).ready(function(){

	withoutReloadingShowCustomer()
	
})
function withoutReloadingShowCustomer(){
	$.ajax({
method:"POST",
url:"listCustomer",
data:{},
success:function(data){
$("#divListCustomer").html(data)
	
       }
		
    })

}

function searchCustomer(data){
	console.log(data)
	var result="<thead><tr><th>FirstName</th><th>LastName</th><th>Email</th></tr></thead>";
			result +="<tbody>";
			$.each(data,function(k,v){
				result +="<tr>";
				result +="<td>";
				result +=v.firstName
				result +="</td>";
				result +="<td>";
				result+=v.lastName
				result +="</td>";
				result +="<td>";
				result+=v.email
				result +="</td>";
				result +="</tr>";
				
			});
			
			result +="</tbody>";
			
			
			
			
$("#searchResult").html(result)
}

function addCustomer(data){
	console.log(data)
	if(data.msg=="OK"){
$("#divMsgCustomer").html("Customer Added/Updated successfully")
$("input[name=firstName]").val("")
$("input[name=lastName]").val("")
$("input[name=email]").val("")
withoutReloadingShowCustomer()
		}else{
			$("#divMsgCustomer").html("Adding custommer Failed")
	}
}

function deleteCustomer(id){
if (confirm ("Are you sure to delete the Customer?")){
	$.ajax({
		method:"POST",
		url:"deleteCustomer",
		data:{"id":id},
		success:function(data){
			if(data.msg=="OK"){
				withoutReloadingShowCustomer()
				}else{
					$("#divMsgCustomer").html("Customer deleting failed")
					}
	
		}
				
   })
 }	
}

function updateCustomer(id){
	$.ajax({
		method:"POST",
		url:"getCustomer",
		data:{"id":id},
		success:function(data){
			$("#formCustomer input[name=firstName]").val(data.firstName)
			$("#formCustomer input[name=lastName]").val(data.lastName)
			$("#formCustomer input[name=email]").val(data.email)
		$("#formCustomer input[name=id]").val(data.id)
			
		}
	})
}

</script>

</head>
<body>
<div id="divCustomers">
    <div id="divFormCustomer">
    <div id="divMsgCustomer"></div>
<g:formRemote id="formCustomer" name="formCustomer" url="[controller:'Customer',action:'addCustomer']" onSuccess="addCustomer(data)">
First Name:<input type="text" name="firstName">
Last Name:<input type="text" name="lastName">
Email:<input type="email" name="email">
<input type="hidden" name="id">
<input type="submit" name="submit" value="Add/Update a Customer">
</g:formRemote>
</div>
<!-- START SEARCHING DIV -->
<div id="divSearchFormCustomer">
<g:formRemote id="searchCustomer" name="searchCustomer" url="[controller:'Customer',action:'searchCustomer']" onSuccess="searchCustomer(data)">
<input type="text" name="search" id="search" placeholder="Search our Inventory" >
<input type="submit" name="submit" value="search">
</g:formRemote>
<div id="searchResult"></div>
</div>
<!-- END SEARCHING DIV -->
<div id="divListCustomer"></div>

</div>

</body>

</html>