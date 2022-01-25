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
		<meta charset="UTF-8" />
		<title><c:out value="${sellable.title}"/></title>
				<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Charm&family=Marck+Script&family=Play:wght@400;700&display=swap" rel="stylesheet"> 		
		<link rel="stylesheet" href="/css/style.css" />
		<link rel="stylesheet" href="/css/carousel.css" />
		<link rel="stylesheet" href="/css/viewSellable.css" />
	</head>
	<body>
	<div id="page-container">
		<div id="content-wrap">
			<!--==================== -->
			<!-- TOP NAV -->
			<!--==================== -->
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
	        <!--==================== -->
			<!-- MARKET GRID -->
			<!--==================== -->
			<div class="container">
				<div class="flex-start content-body">				
					<div class="carousel">
				        <button class="carousel__button carousel__button--left is-hidden">
				            <img src="/imgs/arrow--left.svg" alt="left arrow">
				        </button>
				        <div class="carousel__track-container">
				            <ul class="carousel__track">
				                <c:forEach var="img" items="${sellable.photos}">
					                <li class="carousel__slide current-slide">
					                    <img class="carousel__image" src="https://latitudemarineimgs.s3.us-east-2.amazonaws.com/${img.fileName}" alt="${img.fileName}">
				               		</li>
			               		</c:forEach>
				            </ul>
				        </div>
				        <button class="carousel__button carousel__button--right">
				            <img src="/imgs/arrow--right.svg" alt="right arrow">
				        </button>			
				        <div class="carousel__nav">
				            <c:forEach var="img" items="${sellable.photos}">				            
				            	<img src="https://latitudemarineimgs.s3.us-east-2.amazonaws.com/${img.fileName}" alt="${img.fileName}" class="carousel__indicator-image"></img>				            
				            </c:forEach>
				        </div>
				    </div>			    			
					<table class="table table-light">
						<thead>
							<tr>
								<th><h3><c:out value="${sellable.title}"/></h3></th>
							</tr>
						</thead>
						<tbody>		
								<tr>
									<td>Type:</td><td class="td_sellable_info"><c:out value="${sellable.type }"/></td>						
								</tr>		
								<tr>
									<td>Year:</td><td class="td_sellable_info"><c:out value="${sellable.year }"/></td>
								</tr>
								<tr>
									<td>Make:</td><td class="td_sellable_info"><c:out value="${sellable.make }"/></td>
								</tr>
								<tr>
									<td>Model:</td><td class="td_sellable_info"><c:out value="${sellable.model }"/></td>
								</tr>
								<tr>
									<td>Price:</td><td class="td_sellable_info"><fmt:formatNumber type="currency" value="${sellable.price}"/></td>
								</tr>
								<tr>
									<td>Description:</td><td class="td_sellable_info"><c:out value="${sellable.description }"/></td>
								</tr>
								<tr>
									<td>Condition:</td><td class="td_sellable_info"><c:out value="${sellable.state }"/></td>
								</tr>
								<tr>
									<td>Qty:</td><td class="td_sellable_info"><c:out value="${sellable.quantity }"/></td>	
								</tr>																		
						</tbody>
					</table>
				</div>
			</div>
			
			<!--==================== -->
			<!-- FOOTER -->
			<!--==================== -->
			<hr>
			<div class="footer">
	            <div class="footerContainer">
	                    <div class="centerFlex">
	                        <h4>Links</h4>
	                        <ul>
	                            <li><a href="/contactus">Contact Us</a></li>
	                            <li><a href="/market">Shop Inventory</a></li>
	                            <li><a href="/service">Service</a></li>
	                            <li><a href="/about">About Us</a></li>
	                        </ul>
	                    </div>
	                    <div class="centerFlex">
	                        <h4>Hours</h4>
	                        <ul>
	                            <li>Mon - Fri: 8am - 6pm</li>
	                            <li>Sat: by appointment</li>
	                            <li>Sun: by appointment</li>
	                        </ul>
	                    </div>
						<div class="flex-column-start">
						<h4>Company Details</h4>
							<div class="flex details">
								<img src="/imgs/location.svg" alt="nav icon" class="icon"/>
								<p>Cape Coral & South West Florida</p>
							</div>
							<div class="flex details">
								<img src="/imgs/phone.svg" alt="phone icon" class="icon" />
								<p>239.201.5440</p>
							</div>
							<div class="flex details">
								<img src="/imgs/email.svg" alt="email icon" class="icon"/>
								<p>rendre.belac@gmail.com</p>
							</div>                        
						</div>
	            </div>
			</div>
		</div>
	</div>
	<script src="/js/jquery-3.6.0.js"></script>	
	<script src="/js/main.js"></script>	
	<script src="/js/carousel.js"></script>
	</body>
</html>
