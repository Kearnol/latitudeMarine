<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Sellable</title>
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">
</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
        
        <h1>Add Sellable Item</h1>
        <a href="/market"><button class="btn btn-success">Market</button></a>
        <c:if test="${success !=null}">
        	<p class="text text-success"><c:out value="${success}"/></p>
        </c:if>
        <c:if test="${img !=null}">
        	<p class="text text-danger"><c:out value="${img}"/></p>
        </c:if>
  
	    <form:form action="/addItem" method="post" modelAttribute="sellable" enctype="multipart/form-data">	    
	        
	        <div class="form-group">
	            <label>Title</label>
	            <form:input path="title" class="form-control" />
	            <form:errors path="title" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Type</label>
	            <form:select path="type" class="form-control">
	            	<option value="boat">boat</option>
	            	<option value="motor">motor</option>
	            	<option value="part">part</option>	            	
            	</form:select>
	            <form:errors path="type" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Year</label>
	            <form:input path="year" class="form-control" />
	            <form:errors path="year" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Make</label>
	            <form:input path="make" class="form-control" />
	            <form:errors path="make" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Model</label>
	            <form:input path="model" class="form-control" />
	            <form:errors path="model" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Price</label>
	            <form:input type="number" path="price" step="0.01" class="form-control" min="0" />
	            <form:errors path="price" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Description</label>
	            <form:textarea path="description" class="form-control" />
	            <form:errors path="description" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Condition</label>
	            <form:input path="state" class="form-control" />
	            <form:errors path="state" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Quantity</label>
	            <form:input type="number" path="quantity" class="form-control" min="0" />
	            <form:errors path="quantity" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Upload Image</label>
	            <input type="file" id="file" name="imageFiles" multiple class="form-control" />
	            <ul id="#output">
	            </ul>	           
	        </div>	        	        
	        <input type="submit" value="Add Item" id="#addBtn" class="btn btn-primary" />
	    </form:form>
	   
	  <%--  <form action="/addImage" enctype="multipart/form-data" method="post">
	   <div class="form-group">
	            <label>Image</label>
	            <input type="file" name="imageFile" class="form-control" />
	            <input type="submit" value="Upload"/>
	        </div>
        </form> --%>
        
        <table class="table table-light">
			<thead>
				<tr>
					<th>Title</th>
					<th>Year</th>
					<th>Make</th>
					<th>Model</th>
					<th>Price</th>
					<th>Condition</th>
					<th>Qty</th>
					<th>Type</th>
					<th>Actions</th>
				</tr>		
			</thead>
			<tbody>
				<c:forEach var="sellable" items="${sellables}">				
		   		
					<tr>
						<td><a href="/market/${sellable.id}"><c:out value="${sellable.title}"/></a></td>
						<td><c:out value="${sellable.year}"/></td>
						<td><c:out value="${sellable.make}"/></td>
						<td><c:out value="${sellable.model}"/></td>
						<td><fmt:formatNumber type="currency" value="${sellable.price}"/></td>
						<td><c:out value="${sellable.state}"/></td>
						<td><c:out value="${sellable.quantity}"/></td>
						<td><c:out value="${sellable.type}"/></td>						
						<td>
								<!-- EDIT -->
								<a href="/admin/edit/${sellable.id}"><button class="btn btn-primary">Edit</button></a>
								<!-- DELETE -->
								<form action="/admin/delete" method="post">
									<input type="hidden" name="_method" value="delete">
									<input type="hidden" name="id" value="${sellable.id}"/>
									<input type="submit" value="Delete" class="btn btn-danger">
								</form>																						
						</td>				
					</tr>
				</c:forEach>
				</tbody>
			</table>
    </div> <!-- End of Container -->
    <script src="/js/jquery-3.6.0.js"></script>
	<script src="/js/admin.js"></script>
</body>
</html>