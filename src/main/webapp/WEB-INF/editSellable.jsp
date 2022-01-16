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
        
        <h1>Edit <c:out value="${title}"/></h1>
        <a href="/market"><button class="btn btn-success">Market</button></a>
        <c:if test="${success !=null}">
        	<p class="text text-success"><c:out value="${success}"/></p>
        </c:if>
  
	    <form:form action="/updateItem" method="post" modelAttribute="sellable">
	    <form:hidden path="id"/>
	    <input type="hidden" name="_method" value="put"/>
	        
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
	            <form:input type="textarea" path="description" class="form-control" />
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
	            <label>Images</label>
	            <form:input path="image" class="form-control" />
	            <form:errors path="image" class="text-danger" />
	        </div>
	        <input type="submit" value="Update Item" class="btn mt-2 btn-primary" />
	    </form:form>
	     <a href="/admin/market"><button class="btn mt-2 btn-warning">Cancel</button></a>
  
    </div> <!-- End of Container -->
</body>
</html>