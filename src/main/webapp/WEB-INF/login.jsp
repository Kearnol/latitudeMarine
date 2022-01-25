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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Charm&family=Marck+Script&family=Play:wght@400;700&display=swap" rel="stylesheet"> 		
		<link rel="stylesheet" href="/css/style.css" />
		<link rel="stylesheet" href="/css/login.css" />
		<title>Latitude Marine - Login</title>
	</head>
	<body>
		<div class="page-container">
			<div class="content-wrap">
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
				<!-- Login -->
				<!--==================== -->
				<div class="login_container">
					<c:if test="${logoutMessage != null}">
						<p class="success-text">${logoutMessage}</p>
					</c:if>
					
				    <h1>Login</h1>
					<div class="flex-column-start">					    
						<c:if test="${errorMessage != null}">
							<p class="error-text">${errorMessage}</p>
						</c:if>
					    <form method="POST" action="/login">
					        <p>
					            <label for="username">Username</label>
					            <input type="text" id="username" name="username" class="form_input"/>
					        </p>
					        <p>
					            <label for="password">Password</label>
					            <input type="password" id="password" name="password" class="form_input"/>
					        </p>
					        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					        <div class="flex-even">
					        	<input type="submit" value="Login" class="btn sm-btn"/>
					        </div>
					    </form>				
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
			</div> <!-- end content-wrap -->
		</div> <!-- end page-container -->
	</body>
</html>