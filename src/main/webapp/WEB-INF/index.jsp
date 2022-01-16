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
		<title>Latitude Marine</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Charm&family=Marck+Script&family=Play:wght@400;700&display=swap" rel="stylesheet"> 
		<link rel="stylesheet" type="text/css" href="/css/style.css" />
	</head>
	<body>
		<div id="page-container">
			<div id="content-wrap">
				<!--==================== -->
				<!-- TOP NAV -->
				<!--==================== -->
				<div class="container">
					<div class="topnav">
						<div class="navLeft">
							<img src="/imgs/LogoCompassRose.png" alt="compass rose" />
							<img src="/imgs/logoTitle.png" alt="Latitude Marine" />
						</div>
						<div class="navRight">
							<ul>
								<li id="contactUs"><a href="#">Contact Us</a></li>
								<li id="service"><a href="#">Service</a></li>
								<li id="shop"><a href="/market">Shop Inventory</a></li>
								<li id="about"><a href="#">About Us</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--==================== -->
				<!-- HERO -->
				<!--==================== -->
				<div id="hero" class="hero">
					<div class="container heroContent centerFlex">
						<div class="hero_text">
							<h1>Mobile rigging and repair you can count on.</h1>
							<h3>
								Boat and motor diagnostics, general services & repairs, and
								accessory installations where and when you need it.
							</h3>
							<h3>Same day service. 100% mobile.</h3>
							<div class="flex phone-number">
								<img
									src="/imgs/phone_white.svg"
									alt="phone icon"
									class="hero-icon-img"
								/>
								<h1>239.201.5440</h1>
							</div>
						</div>
						<div class="heroButtons">
							<button class="btn btn-lg btn-primary">View Services</button>
							<button class="btn btn-lg btn-primary">Contact Us</button>
							<a href="/market"
								><button class="btn btn-lg btn-primary">
									Shop our Yard
								</button></a
							>
						</div>
					</div>
				</div>
				<!--==================== -->
				<!-- WHO WE ARE -->
				<!--==================== -->
				<div id="whoWeAre" class="fw-block whiteBG">
					<div class="container flex-between">
						<img
							class="hw-block_image"
							src="/imgs/tools.jpeg"
							alt="picture here"
						/>
						<div class="hw-block_content">
							<h2>Who We Are</h2>
							<h3>Local. Professional. Experienced.</h3>
							<p>
								Latitude Marine offers an affordable rigging and repair service
								at your desired location. We have been servicing boats in Lee
								County for over 3 years now! While we prefer boats to be sitting
								on a trailer, we can service boats and motors that are on a boat
								lift and sometimes even in the water, if necessary. Our most
								popular service is a 100 hr. outboard engine service. With this
								service you can be rest assured that your motor will live a
								long, happy life on the back of your boat.
							</p>
						</div>
					</div>
				</div>
				<!--==================== -->
				<!-- OUR SERVICES -->
				<!--==================== -->
				<div id="ourServices" class="fw-block greyBG">
					<div class="container centerFlex">
						<h2>Our Services</h2>
						<h4>Where and when you need them</h4>
							<div class="flex-even">
								<div class="centerFlex serviceCol">
									<img
										class="serviceImg"
										src="/imgs/engine_repair.jpeg"
										alt="img"
									/>
									<h3>100 Hr Engine Service</h3>
									<p class="servDetails">
										Replace engine oil, oil filter, gear oil, spark plugs, and
										fuel filter. Replace boat-mounted fuel filter.
										Inspect/grease propeller. Inspect/replace anodes and
										thermostats. Grease points. Visual inspection.
									</p>
								</div>
								<div class="centerFlex serviceCol">
									<img
										class="serviceImg"
										src="/imgs/fish_finder.jpeg"
										alt="img"
									/>
									<h3>Accessory Instillation</h3>
									<p class="servDetails">
										GPS / Fish finder, Powerpole, stereo, jack plate, trim tabs,
										trolling motors, battery chargers, Isolators, 12-24-36 volt
										battery systems, lighting, gauges, pu ps, props, steering
										systems, switches, etc.
									</p>
								</div>
								<div class="centerFlex serviceCol">
									<img
										class="serviceImg"
										src="imgs/electrical.jpeg"
										alt="img"
									/>
									<h3>Electrical Diagnostics</h3>
									<p class="servDetails">
										Hourly charge to diagnoes and repair electrical
										malfunctions.
									</p>
								</div>
							</div>
					</div>
				</div>
				<!--==================== -->
				<!-- COST ESTIMATE -->
				<!--==================== -->
				<div class="fw-block whiteBG">
					<div class="container flex-between">
						<div class="hw-block_content">
							<h2>Service Estimates</h2>
							<h5 class="italics">
								**All listed prices are estimates and subject to change with
								market fluctuations and demand.
							</h5><br>
							<ul>
								<li>Flat Rate Service Call Fee - $40</li>
								<li>Hourly Rate - $80</li><br>
								<li><h3>Common Services</h3></li>
								<li>100 hr. Engine Service - $450+</li>
								<li>GPS / Fish Finder Install - $175+</li>
								<li>Electrical Diagnostics & Repair - Service Call + Hourly</li>
								<li>Other Accessory Installs - Service Call + Hourly</li>
							</ul>
						</div>
						<img src="/imgs/boat_fun.jpeg" alt="people riding in a speed boat" class="hw-block_image">
					</div>
				</div>
				<!--==================== -->
				<!-- CUSTOMER REVIEWS-->
				<!--==================== -->
				<div class="fw-block cape_coral_bg">
					<div class="container centerFlex">
						<div class="hw-block_content centerFlex">
							<h2 class="hero_text">Proudly Serving Lee County for 3+ Years</h2>
							<img src="/imgs/review.png" id="review">
							<a href="#">
								<button class="btn btn-lrg btn-warning">
									Leave A Review
								</button>
							</a>						
						</div>			
					</div>
				</div>
			</div>
			<!-- Content Wrapper  -->
			<!--==================== -->
			<!-- FOOTER -->
			<!--==================== -->
			<hr />
			<div class="footer">
				<div class="footerContainer">
					<div class="centerFlex">
						<h3>Links</h3>
						<ul>
							<li><a href="/contactus">Contact Us</a></li>
							<li><a href="/market">Shop Inventory</a></li>
							<li><a href="/service">Service</a></li>
							<li><a href="/about">About Us</a></li>
						</ul>
					</div>
					<div class="centerFlex">
						<h3>Hours</h3>
						<ul>
							<li>Mon - Fri: 8am - 6pm</li>
							<li>Sat: by appointment</li>
							<li>Sun: by appointment</li>
						</ul>
					</div>
					<div class="flex-column-start">
						<h3>Company Details</h3>
						<div class="flex details">
							<img src="/imgs/location.svg" alt="nav icon" class="icon" />
							<p>Cape Coral & SW Florida</p>
						</div>
						<div class="flex details">
							<img src="/imgs/phone.svg" alt="phone icon" class="icon" />
							<p>239.201.5440</p>
						</div>
						<div class="flex details">
							<img src="/imgs/email.svg" alt="email icon" class="icon" />
							<p>rendre.belac@gmail.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="/js/jquery-3.6.0.js"></script>
		<script src="/js/main.js"></script>
	</body>
</html>
