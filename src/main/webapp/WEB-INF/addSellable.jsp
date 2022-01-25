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
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Charm&family=Marck+Script&family=Play:wght@400;700&display=swap" rel="stylesheet"> 		
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/admin.css" />
	
</head>
<body>
	<!--==================== -->
	<!-- TOP NAV -->
	<!--==================== -->
	<div class="fw-container nav_bottom-border">
		<div class="container">
			<div class="topnav">				
				<a href="/"><div class="navLeft">
					<img src="/imgs/LogoCompassRose.png" alt="compass rose" />
					<img src="/imgs/logoTitle.png" alt="Latitude Marine" />
				</div></a>
				<div class="navRight">
					<ul>
						<li id="contactUs"><a href="/">Contact Us</a></li>
						<li id="service"><a href="/">Service</a></li>
						<li id="shop" class="underlined"><a href="/market">Shop Inventory</a></li>
						<li id="about"><a href="/">About Us</a></li>
					</ul>
				</div>
			</div>
		</div>			
	</div>	
    <div class="container"> <!-- Beginning of Container -->
        
        <h1>Add Sellable Item</h1>
        <a href="/market"><button class="btn btn-primary">Market</button></a>
        <c:if test="${success !=null}">
        	<p class="text text-success"><c:out value="${success}"/></p>
        </c:if>
        <c:if test="${img !=null}">
        	<p class="text text-danger"><c:out value="${img}"/></p>
        </c:if>
  
	    <form:form action="/addItem" method="post" modelAttribute="sellable" enctype="multipart/form-data">	    
	        
	        <div class="form-group form-group1">
	            <label>Title <span class="asterisks">*</span></label>
	            <form:input path="title" class="form-control" />
	            <form:errors path="title" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Type <span class="asterisks">*</span></label>
	            <form:select path="type" class="form-control">
					<option value="" hidden="true">Select</option>
	            	<option value="boat">boat</option>
	            	<option value="motor">motor</option>
	            	<option value="trailer">trailer</option>
	            	<option value="part">part</option>	            	
            	</form:select>
	            <form:errors path="type" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Year</label>
	            <form:input path="year" class="form-control" />
	            <form:errors path="year" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Make</label>
	            <form:input path="make" class="form-control" />
	            <form:errors path="make" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Model</label>
	            <form:input path="model" class="form-control" />
	            <form:errors path="model" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Price <span class="asterisks">*</span></label>
	            <form:input type="number" path="price" step="0.01" class="form-control" min="0" value="0"/>
	            <form:errors path="price" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Description<span class="asterisks">*</span></label>
	            <form:textarea path="description" class="form-control" placeholder="..." />
	            <form:errors path="description" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Condition <span class="asterisks">*</span></label>
	            <form:input path="state" class="form-control" />
	            <form:errors path="state" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Quantity <span class="asterisks">*</span></label>
	            <form:input type="number" path="quantity" class="form-control" min="0" value="0" />
	            <form:errors path="quantity" class="text-danger" />
	        </div>
	        <div class="form-group form-group1">
	            <label>Upload Image</label>
	            <input type="file" id="file" name="imageFiles" multiple class="form-control" />
	            <ul id="#output">
	            </ul>	           
	        </div>	        	        
	        <input type="submit" value="Add Item" id="addBtn" class="btn btn-success" />
	    </form:form>
	   
        <input type="text" placeholder="search sellables" class="form-control search"/>
        
        <!-- Sell-able Table -->
        
        <table class="table table-light table-striped sellable-list">
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
						<td class="flex-even">
								<!-- EDIT -->
								<a href="/admin/edit/${sellable.id}">Edit</a>
								<!-- DELETE -->
								<form action="/admin/delete" method="post">
									<input type="hidden" name="_method" value="delete">
									<input type="hidden" name="id" value="${sellable.id}"/>
									<input type="submit" value="Delete" class="delete">
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