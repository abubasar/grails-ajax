<table>
<thead>
<th>FirstName</th>
<th>LastName</th>
<th>Email</th>

</thead>
<g:each in="${listCustomers }" var="customer">
<tr>
<td>${customer.firstName }</td>
<td>${customer.lastName }</td>
<td>${customer.email}</td>
<td><a href="javascript:updateCustomer(${customer.id })">Update</a></td>
<td><a href="javascript:deleteCustomer(${customer.id })">Delete</a></td>
</tr>
</g:each>
</table>