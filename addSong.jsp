<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String result = String.valueOf( request.getSession().getAttribute("result")); %>
<%  String auth  = (String)request.getSession().getAttribute("auth"); %>


<%@ page import="java.util.ArrayList" %>


<%@ page import="models.songs" %>

<% songs obj =new songs();  
 request.getSession().setAttribute("artists",obj.getArtist()); %>
<% ArrayList<String> artist_list =  new ArrayList<String>(); %>
<% artist_list=  (ArrayList<String>)request.getSession().getAttribute("artists");   %>


<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="./css/addSong.css" />
		<link rel="stylesheet" href="./css/fonts.css" />
		<link rel="stylesheet" href="./css/animation.css">
		<link rel="stylesheet" href="./css/responsive.css">
		<title>Spotify-Dipanshu</title>
		<link rel="icon" href="https://www.scdn.co/i/_global/favicon.png" />
		<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap"rel="stylesheet"/>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>

		<!-- Artist Carousel -->
		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" />

	<!-- Add Song -->
<script src="https://kit.fontawesome.com/7d35781f0a.js" crossorigin="anonymous"></script> 
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
</head>
	<body>
		<!--Header-->
		<header class="">
			<div class="container">
				<div class="header">
					<span class="logo">
						<a href="./index.jsp">
							<svg
								viewBox="0 0 63 20"
								xmlns="http://www.w3.org/2000/svg"
								preserveAspectRatio="xMidYMin meet"
							>
								<g fill-rule="evenodd" class="svelte-1gcdbl9">
									<path
										d="M61.842 9.506a1.02 1.02 0 0 1-1.023-1.024c0-.562.453-1.03 1.029-1.03a1.02 1.02 0 0 1 1.023 1.024 1.03 1.03 0 0 1-1.029 1.03m.006-1.952a.915.915 0 0 0-.922.928c0 .51.394.921.916.921a.916.916 0 0 0 .922-.927.908.908 0 0 0-.916-.922m.226 1.027l.29.406h-.244l-.26-.372h-.225v.372h-.204V7.912h.48c.249 0 .413.128.413.343 0 .176-.102.284-.25.326m-.172-.485h-.267v.34h.267c.133 0 .212-.065.212-.17 0-.11-.08-.17-.212-.17m-12.804-3.52a1.043 1.043 0 1 0-.001 2.086 1.043 1.043 0 0 0 0-2.087m.72 2.89h-1.454a.107.107 0 0 0-.106.107v6.346c0 .06.047.107.106.107h1.455a.107.107 0 0 0 .107-.107V7.572a.107.107 0 0 0-.107-.107m3.233.006v-.2c0-.592.227-.856.736-.856.303 0 .546.06.82.152a.106.106 0 0 0 .14-.102V5.24a.107.107 0 0 0-.076-.102 3.993 3.993 0 0 0-1.21-.174c-1.343 0-2.053.757-2.053 2.188v.308h-.699a.107.107 0 0 0-.107.106v1.257c0 .059.048.107.107.107h.699v4.99c0 .058.047.106.106.106h1.455a.107.107 0 0 0 .106-.107v-4.99h1.358l2.081 4.99c-.236.523-.468.628-.785.628-.257 0-.527-.077-.803-.228a.109.109 0 0 0-.084-.008.106.106 0 0 0-.063.058l-.493 1.081a.106.106 0 0 0 .045.138c.515.279.98.398 1.554.398 1.074 0 1.668-.5 2.191-1.847L60.6 7.617a.106.106 0 0 0-.099-.146h-1.514a.107.107 0 0 0-.1.072l-1.552 4.431-1.7-4.434a.106.106 0 0 0-.099-.069h-2.485m-5.577-.006h-1.6V5.828a.106.106 0 0 0-.107-.106h-1.455a.107.107 0 0 0-.106.106v1.637h-.7a.106.106 0 0 0-.106.107v1.25c0 .059.048.107.106.107h.7v3.234c0 1.308.65 1.97 1.934 1.97.522 0 .954-.107 1.362-.338a.106.106 0 0 0 .054-.093v-1.19a.106.106 0 0 0-.154-.096c-.28.141-.551.206-.854.206-.467 0-.675-.211-.675-.686V8.929h1.6a.106.106 0 0 0 .107-.107v-1.25a.106.106 0 0 0-.106-.107m-7.671-.133c-1.96 0-3.497 1.51-3.497 3.437 0 1.907 1.526 3.4 3.473 3.4 1.967 0 3.508-1.504 3.508-3.424 0-1.914-1.53-3.413-3.484-3.413m0 5.362c-1.043 0-1.83-.838-1.83-1.95 0-1.115.76-1.924 1.806-1.924 1.05 0 1.84.838 1.84 1.95 0 1.115-.763 1.924-1.816 1.924m-7.014-5.362c-.82 0-1.492.323-2.046.984v-.744a.107.107 0 0 0-.106-.107h-1.455a.107.107 0 0 0-.106.107v8.27c0 .058.048.106.106.106h1.455a.107.107 0 0 0 .106-.106v-2.61c.555.621 1.227.925 2.046.925 1.522 0 3.063-1.172 3.063-3.412s-1.54-3.413-3.063-3.413m1.372 3.413c0 1.14-.703 1.937-1.709 1.937-.995 0-1.745-.833-1.745-1.937s.75-1.937 1.745-1.937c.99 0 1.71.814 1.71 1.937m-8.437-1.81c-1.624-.388-1.913-.66-1.913-1.231 0-.54.508-.903 1.264-.903.732 0 1.459.275 2.22.843a.107.107 0 0 0 .15-.023l.794-1.119a.107.107 0 0 0-.02-.144c-.906-.728-1.927-1.081-3.12-1.081-1.755 0-2.98 1.052-2.98 2.559 0 1.615 1.057 2.187 2.884 2.628 1.554.358 1.817.658 1.817 1.195 0 .594-.53.963-1.385.963-.948 0-1.721-.32-2.587-1.068a.11.11 0 0 0-.078-.026.105.105 0 0 0-.073.038l-.89 1.058a.105.105 0 0 0 .011.148 5.303 5.303 0 0 0 3.581 1.373c1.89 0 3.112-1.033 3.112-2.631 0-1.351-.807-2.098-2.787-2.58M9.507.305a9.41 9.41 0 1 0 0 18.82 9.41 9.41 0 0 0 0-18.82m4.316 13.572a.586.586 0 0 1-.807.195c-2.21-1.35-4.99-1.655-8.266-.907a.586.586 0 1 1-.261-1.143c3.584-.82 6.659-.467 9.139 1.049.276.169.363.53.195.806m1.15-2.562a.734.734 0 0 1-1.008.242c-2.529-1.555-6.385-2.005-9.377-1.097a.735.735 0 0 1-.426-1.404c3.418-1.037 7.666-.534 10.57 1.25a.734.734 0 0 1 .242 1.01m.1-2.669C12.04 6.846 7.036 6.68 4.141 7.56a.88.88 0 1 1-.511-1.684c3.323-1.01 8.849-.814 12.34 1.258a.88.88 0 0 1-.898 1.514"
									></path>
								</g>
							</svg>
						</a>
					</span>
					<nav class="navigation">
						<ul>
							<li>
								<a class="navigation-link" href="addSong.jsp" style="width:auto;">Add Song</a>
							</li>
							<li>
								<a class="navigation-link" href="#">Support</a>
							</li>
							<li>
								<a class="navigation-link" href="#">Download</a>
							</li>
							<li class="vertical_separator"></li>
							<li>
								<button class="profile_btn" type="button" onclick="profile()">
									<div class="usericon">
										<svg viewBox="0 0 1024 1024" aria-labelledby="mh-usericon-title">
											<title id="mh-usericon-title">Profile</title>
											<path d="M730.06 679.64q-45.377 53.444-101.84 83.443t-120 29.999q-64.032 0-120.75-30.503t-102.6-84.451q-40.335 13.109-77.645 29.747t-53.948 26.722l-17.142 10.084Q106.388 763.84 84.96 802.41t-21.428 73.107 25.461 59.242 60.754 24.705h716.95q35.293 0 60.754-24.705t25.461-59.242-21.428-72.603-51.679-57.225q-6.554-4.033-18.907-10.84t-51.427-24.453-79.409-30.755zm-221.84 25.72q-34.285 0-67.561-14.873t-60.754-40.335-51.175-60.502-40.083-75.124-25.461-84.451-9.075-87.728q0-64.032 19.915-116.22t54.452-85.964 80.67-51.931 99.072-18.151 99.072 18.151 80.67 51.931 54.452 85.964 19.915 116.22q0 65.04-20.167 130.58t-53.948 116.72-81.426 83.443-98.568 32.268z"></path>
										</svg>
									</div> 
									<div class="profile-title">
										<span>Profile</span> 
										<svg viewBox="0 0 1024 1024">
											<path d="M476.455 806.696L95.291 425.532Q80.67 410.911 80.67 390.239t14.621-34.789 35.293-14.117 34.789 14.117L508.219 698.8l349.4-349.4q14.621-14.117 35.293-14.117t34.789 14.117 14.117 34.789-14.117 34.789L546.537 800.142q-19.159 19.159-38.318 19.159t-31.764-12.605z"></path>
										</svg>
									</div>
								</button>
								<div id="profileMenu" class="profileMenu">
									<ul class="">
										<li class="">
											<% if (auth==null) {%> 
											<a class="" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">SignUp</a> 
											<% } else if(auth!=null) { %>
											<a class="" style="width:auto;">${auth}</a> 
											<% } %>	
										</li>
										<li class="svelte-11h1c9">
											<% if (auth==null) {%> 
											<a class="faded" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">LogIn</a>
											<% } else if(auth!=null) { %>
											<a class="faded" href="userLogout.do" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">LogOut</a> 
									        <% } %>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
					<div class="profile_icon-mobile">
						<div class="usericon">
							<a href="">
								<svg viewBox="0 0 1024 1024" aria-labelledby="mh-usericon-title">
									<title id="mh-usericon-title">Profile</title>
									<path d="M730.06 679.64q-45.377 53.444-101.84 83.443t-120 29.999q-64.032 0-120.75-30.503t-102.6-84.451q-40.335 13.109-77.645 29.747t-53.948 26.722l-17.142 10.084Q106.388 763.84 84.96 802.41t-21.428 73.107 25.461 59.242 60.754 24.705h716.95q35.293 0 60.754-24.705t25.461-59.242-21.428-72.603-51.679-57.225q-6.554-4.033-18.907-10.84t-51.427-24.453-79.409-30.755zm-221.84 25.72q-34.285 0-67.561-14.873t-60.754-40.335-51.175-60.502-40.083-75.124-25.461-84.451-9.075-87.728q0-64.032 19.915-116.22t54.452-85.964 80.67-51.931 99.072-18.151 99.072 18.151 80.67 51.931 54.452 85.964 19.915 116.22q0 65.04-20.167 130.58t-53.948 116.72-81.426 83.443-98.568 32.268z"></path>
								</svg>
							</a>
						</div> 
						<div class="container-togg" onclick="toggler(this)">
							<div class="bar1"></div>
							<div class="bar2"></div>
							<div class="bar3"></div>
						</div>
					</div>
				</div>
				<div id="mySidenav" class="sidenav">
					<ul>
						<li>
							<a class="navigation-link" href="addSong.jsp" onclick="document.getElementById('id03').style.display='block'" style="width:auto;">Add Song</a>
						</li>
						<li>
							<a class="sidenav-link" href="#">Support</a>
						</li>
						<li>
							<a class="sidenav-link" href="#">Download</a>
						</li>
						<li class="h_separator"></li>
						<li>
							<% if (auth==null) {%> 
								<a class="sidenav-link light" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">SignUp</a> 
								<% } else if(auth!=null) { %>
								<a class="sidenav-link light" style="width:auto;">${auth}</a> 
								<% } %>	
						</li>
						<li>
							<% if (auth==null) {%> 
								<a class="faded sidenav-link light son" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">LogIn</a>
								<% } else if(auth!=null) { %>
								<a class="faded sidenav-link light son" href="userLogout.do" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">LogOut</a> 
								<% } %>	
						</li>
					</ul>
					<span class="sidenav-logo">
						<a href="./index.html">
							<svg
								viewBox="0 0 63 20"
								xmlns="http://www.w3.org/2000/svg"
								preserveAspectRatio="xMidYMin meet"
							>
								<g fill-rule="evenodd" class="svelte-1gcdbl9">
									<path
										d="M61.842 9.506a1.02 1.02 0 0 1-1.023-1.024c0-.562.453-1.03 1.029-1.03a1.02 1.02 0 0 1 1.023 1.024 1.03 1.03 0 0 1-1.029 1.03m.006-1.952a.915.915 0 0 0-.922.928c0 .51.394.921.916.921a.916.916 0 0 0 .922-.927.908.908 0 0 0-.916-.922m.226 1.027l.29.406h-.244l-.26-.372h-.225v.372h-.204V7.912h.48c.249 0 .413.128.413.343 0 .176-.102.284-.25.326m-.172-.485h-.267v.34h.267c.133 0 .212-.065.212-.17 0-.11-.08-.17-.212-.17m-12.804-3.52a1.043 1.043 0 1 0-.001 2.086 1.043 1.043 0 0 0 0-2.087m.72 2.89h-1.454a.107.107 0 0 0-.106.107v6.346c0 .06.047.107.106.107h1.455a.107.107 0 0 0 .107-.107V7.572a.107.107 0 0 0-.107-.107m3.233.006v-.2c0-.592.227-.856.736-.856.303 0 .546.06.82.152a.106.106 0 0 0 .14-.102V5.24a.107.107 0 0 0-.076-.102 3.993 3.993 0 0 0-1.21-.174c-1.343 0-2.053.757-2.053 2.188v.308h-.699a.107.107 0 0 0-.107.106v1.257c0 .059.048.107.107.107h.699v4.99c0 .058.047.106.106.106h1.455a.107.107 0 0 0 .106-.107v-4.99h1.358l2.081 4.99c-.236.523-.468.628-.785.628-.257 0-.527-.077-.803-.228a.109.109 0 0 0-.084-.008.106.106 0 0 0-.063.058l-.493 1.081a.106.106 0 0 0 .045.138c.515.279.98.398 1.554.398 1.074 0 1.668-.5 2.191-1.847L60.6 7.617a.106.106 0 0 0-.099-.146h-1.514a.107.107 0 0 0-.1.072l-1.552 4.431-1.7-4.434a.106.106 0 0 0-.099-.069h-2.485m-5.577-.006h-1.6V5.828a.106.106 0 0 0-.107-.106h-1.455a.107.107 0 0 0-.106.106v1.637h-.7a.106.106 0 0 0-.106.107v1.25c0 .059.048.107.106.107h.7v3.234c0 1.308.65 1.97 1.934 1.97.522 0 .954-.107 1.362-.338a.106.106 0 0 0 .054-.093v-1.19a.106.106 0 0 0-.154-.096c-.28.141-.551.206-.854.206-.467 0-.675-.211-.675-.686V8.929h1.6a.106.106 0 0 0 .107-.107v-1.25a.106.106 0 0 0-.106-.107m-7.671-.133c-1.96 0-3.497 1.51-3.497 3.437 0 1.907 1.526 3.4 3.473 3.4 1.967 0 3.508-1.504 3.508-3.424 0-1.914-1.53-3.413-3.484-3.413m0 5.362c-1.043 0-1.83-.838-1.83-1.95 0-1.115.76-1.924 1.806-1.924 1.05 0 1.84.838 1.84 1.95 0 1.115-.763 1.924-1.816 1.924m-7.014-5.362c-.82 0-1.492.323-2.046.984v-.744a.107.107 0 0 0-.106-.107h-1.455a.107.107 0 0 0-.106.107v8.27c0 .058.048.106.106.106h1.455a.107.107 0 0 0 .106-.106v-2.61c.555.621 1.227.925 2.046.925 1.522 0 3.063-1.172 3.063-3.412s-1.54-3.413-3.063-3.413m1.372 3.413c0 1.14-.703 1.937-1.709 1.937-.995 0-1.745-.833-1.745-1.937s.75-1.937 1.745-1.937c.99 0 1.71.814 1.71 1.937m-8.437-1.81c-1.624-.388-1.913-.66-1.913-1.231 0-.54.508-.903 1.264-.903.732 0 1.459.275 2.22.843a.107.107 0 0 0 .15-.023l.794-1.119a.107.107 0 0 0-.02-.144c-.906-.728-1.927-1.081-3.12-1.081-1.755 0-2.98 1.052-2.98 2.559 0 1.615 1.057 2.187 2.884 2.628 1.554.358 1.817.658 1.817 1.195 0 .594-.53.963-1.385.963-.948 0-1.721-.32-2.587-1.068a.11.11 0 0 0-.078-.026.105.105 0 0 0-.073.038l-.89 1.058a.105.105 0 0 0 .011.148 5.303 5.303 0 0 0 3.581 1.373c1.89 0 3.112-1.033 3.112-2.631 0-1.351-.807-2.098-2.787-2.58M9.507.305a9.41 9.41 0 1 0 0 18.82 9.41 9.41 0 0 0 0-18.82m4.316 13.572a.586.586 0 0 1-.807.195c-2.21-1.35-4.99-1.655-8.266-.907a.586.586 0 1 1-.261-1.143c3.584-.82 6.659-.467 9.139 1.049.276.169.363.53.195.806m1.15-2.562a.734.734 0 0 1-1.008.242c-2.529-1.555-6.385-2.005-9.377-1.097a.735.735 0 0 1-.426-1.404c3.418-1.037 7.666-.534 10.57 1.25a.734.734 0 0 1 .242 1.01m.1-2.669C12.04 6.846 7.036 6.68 4.141 7.56a.88.88 0 1 1-.511-1.684c3.323-1.01 8.849-.814 12.34 1.258a.88.88 0 0 1-.898 1.514"
									></path>
								</g>
							</svg>
						</a>
					</span>
				</div>
			</div>
		</header>
		<!--Header-->

		<!-- SignUp Modal -->
		<div id="id01" class="modal-signup">
			<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
			<form class="modal-content-signup" action="signUp.do" method="POST">
			  <div class="container">
				<h1 >Sign Up</h1>
				
				<br>
				<label for="name"><b>name</b></label>
				<br>
				<input type="text" placeholder="Enter Your Full Name" name="name" required>
				<br>
		  
				<label for="email"><b>Email</b></label>
				<br>
				<input type="text" placeholder="Enter Email" name="email" required>
				<br>
		  
				<label for="psw"><b>Password</b></label><br>
				<input type="password" placeholder="Enter Password" name="pass" required>
				<br>
		  
				<label for="psw-repeat"><b>Repeat Password</b></label><br>
				<input type="password" placeholder="Repeat Password" name="pass-repeated" required>
				
				<div class="clearfix">
				  <button type="submit" class="signupbtn btn-danger">Sign Up</button>
				</div>
			  </div>
			</form>
		  </div>
		<!-- SignUp Modal -->

		<!-- Login Modal -->
		<div id="id02" class="modal-loginIn">
			<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
			<form class="modal-content-loginIn" action="userLogin.do" method="POST">
			  <div class="container">
				<h1 >Login</h1>
				<label for="email"><b>Email</b></label>
				<br>
				<input type="text" placeholder="Enter Email" name="email" required>
				<br>
		  
				<label for="psw"><b>Password</b></label><br>
				<input type="password" placeholder="Enter Password" name="pass" required>
				<br>
		  
				<div class="clearfix">
				  <button type="submit" class="loginbtn btn-danger">Login</button>
				</div>
			  </div>
			</form>
		  </div>
		<!-- Login Modal -->

		<!-- Add Song Form -->
		<div class="home_main">
			<div class="hm_gradient-1"></div>
			<div class="hm_gradient-2"></div>
			 <form action="uploadSong.do" method="POST" enctype="multipart/form-data"> 
				<div class="container hm_cont">
					<span class="home_text">
					
						<h1 >Add Song</h1>
						<h1 style="width: 100%;"> 
							<input class="songname" style=" width:100%;" type='text' value="Enter Song Name" name='songName'/>
						</h1>
						<select id="artistNames" class="songname select_artist" name="artistNames" style=" padding: 5px 10px" multiple>
							<c:forEach var="names" items="${artists}">
	    						<option value="${names}">${names}</option>
    						</c:forEach>
						</select>

                        <div style="justify-content:center; margin-bottom: 25px;" class="artist_btn" >
							<a onclick="document.getElementById('id04').style.display='block'" class="addartist_btn ">Add Artist</a>
						</div>
						<button type="submit" class="green_btn ">Add Song</button>
					</span>

					<span class="home_cards " style="justify-content: center; text-align:center; margin-left:20vh; margin-top:10vh">
							<div class="box">
								<input type="file" name="image" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
								<img id="blah" alt="your image" width="100" height="100"  src="./assets/songs/ed.webp"/>
							</div>
						
					</span>
				</div>
			</form>
        </div>
		<!-- Add Song Form -->

        
 <!-- ADD MUSIC MODAL -->
 <div id="id04" class="modal-song">
	<span onclick="document.getElementById('id04').style.display='none'" class="close" title="Close Modal">&times;</span>
	<form>
	  <div class="container">
		  
		<main class="player player-song">
			
			<div class="image_div" style="text-align: center;">
			    <img class="art" id="blah" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROuBNBcOFFjXIkz4EkF_AyxysJil8Vldwb-Q&usqp=CAU" alt="your image" style="border-radius: 20%;" />
			</div>

			<div class="info" style="text-align: center;">
				 <input style="width:100% ;font-size:17px;background: none; height: 3px;" type='text' value="Artist Name" id="artistName" name='artistName'/>
				<input style="width:100% ;font-size:17px;background: none; height: 3px;" type='text' value="Date Of Birth" id="dob" name='dob'/>
				 <input style="width:100% ;font-size:17px;background: none; height: 3px;" type='text' value="Add bio" id="bio" name='bio'/>
			</div>
			
			

			<ul class="buttons-song" style="text-align: center;">
				<a href="#" class="button-song button-sm" style="pointer-events: none">
					<i class="fas fa-random fa-sm" aria-hidden="true"></i>
					<span class="sr-only">Shuffle</span>
				</a>
				<a href="#" class="button-song button-md" style="pointer-events: none">
					<i class="fas fa-step-backward" aria-hidden="true"></i>
				</a>
				<a href="#" class="button-song button-lg" style="pointer-events: none">
					<i class="fas fa-pause fa-lg" aria-hidden="true" aria-hidden="true"></i>
					<span class="sr-only">Pause</span>
				</a>
				<a href="#" class="button-song button-md" style="pointer-events: none">
					<i class="fas fa-step-forward"></i>
					<span class="sr-only">Next Music</span>
				</a>
				<a href="#" class="button-song button-sm" style="pointer-events: none">
					<i class="fas fa-circle-notch fa-sm" aria-hidden="true"></i>
					<span class="sr-only">Repeat Song</span>
				</a>
			</ul>
			<div class="clearfix" style="text-align: center;">
				<button id="submit_btn" type="submit" class="songsubmitbtn btn-danger">ADD ARTIST</button>
			  </div>
		</main>
	  </div>
	</form>
  </div>
 <!-- ADD MUSIC MODAL -->

		<!--Footer-->
		<custom-footer></custom-footer>
		<!--Footer-->

		<div id="opacity" class="opacity"></div>
		<script src="./component/header.js"></script>
		<script src="./component/footer.js"></script>
		<script src="./js/main.js"></script>

		<!-- SignUp/LogIn/Song Modal -->
		<script>
			// Get the modal
			var modal = document.getElementById('id01');
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			  if (event.target == modal) {
				modal.style.display = "none";
			  }
			}
		</script>
		
		<script>
			// Get the modal
			var modal = document.getElementById('id02');
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			  if (event.target == modal) {
				modal.style.display = "none";
			  }
			}

			var modal1 = document.getElementById('id01');
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			  if (event.target == modal1) {
				modal1.style.display = "none";
			  }
			}

			var modal4 = document.getElementById('id04');
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			  if (event.target == modal4) {
				modal4.style.display = "none";
			  }
			}
		</script>
		<!--Body content-->

		<!-- ajax to save Artist -->
		<script>
		
		    const btn = document.querySelector('#submit_btn');

			const artistName = document.querySelector('#artistName');
			const dob = document.querySelector('#dob');
			const bio = document.querySelector('#bio');

			btn.onclick = saveUser;

			let req = null;
			function saveUser() {
				const jsObj = {name: artistName.value, dob: dob.value, bio: bio.value};

				const jsonStr = JSON.stringify(jsObj);

				req = new XMLHttpRequest();
				
				req.open('GET', 'addArtist.do?data='+encodeURIComponent(jsonStr), true);

				req.setRequestHeader('content-type', 'application/json');
				
				req.onreadystatechange = showResult;
				req.send();
			}

			function showResult() {
				if(req.readyState==4 && req.status==200) {
					console.log('hello');
				}
				else
				console.log('error');
			}
		</script>
		<!-- ajax to save Artist -->

	</body>
</html>

