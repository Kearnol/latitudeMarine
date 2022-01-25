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
		<title>Market Place</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Charm&family=Marck+Script&family=Play:wght@400;700&display=swap" rel="stylesheet"> 		
		<link rel="stylesheet" href="/css/style.css" />
	</head>
	<body>
	<div id="page-container">
		<div id="content-wrap">
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
	        <!--==================== -->
			<!-- SEARCH FILTER 		 -->
			<!--==================== -->
			
			<div class="container">
			 	<div class="search-filter hw-block_content flex-between">
					<a href="/market/boats"><button>Boats</button></a>
					<a href="/market/trailers"><button>Trailers</button></a>
					<a href="/market/motors"><button>Motors</button></a>
					<a href="/market/parts"><button>Parts</button></a>
					<a href="/market"><button>All</button></a>			 	
			 	</div>
			</div>
	        <!--==================== -->
			<!-- MARKET GRID -->
			<!--==================== -->
			<div class="container marketGrid">
				<c:forEach var="sellable" items="${sellables}">
				<div class="marketCard">
	                <a href="/market/${sellable.id}">         
	                        <img class="marketImg" src="https://latitudemarineimgs.s3.us-east-2.amazonaws.com/${sellable.photos[0].fileName}" alt="image" />
	                    <h3><c:out value="${sellable.title}"/></h3>
	                    <p>Price: <fmt:formatNumber type="currency" value="${sellable.price}"/></p>
	                </a>
				</div>
				</c:forEach>
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
		</div> <!-- content-wrapper -->
	</div><!-- Page Container  -->
	
	</body>
</html>
