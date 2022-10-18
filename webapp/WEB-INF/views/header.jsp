<!-- Navbar -->
<nav class="navbar navbar-expand-sm bg-light">
	<div class="container">
		<div class="navbar-header">
			
			<a class="navbar-brand"> <img
				src="/images/car-logo.jpg" width="50px" />
			</a>
		</div>
		<div class="navbar" id="myNavbar">
			<ul class="navbar-nav" style="font-weight:bold">

				<sec:authorize access="!isAuthenticated()">
				<li class="nav-item"><a href="/" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="login" class="nav-link">Login</a></li>
					<li class="nav-item"><a href="new" class="nav-link">Register</a></li>
					<li class="nav-item"><a href="about" class="nav-link">About Us</a></li>
					<li class="nav-item"><a href="contact" class="nav-link">Contact Us</a></li>
				</sec:authorize>


				<sec:authorize access="isAuthenticated()">

				<sec:authorize access="hasRole('Users')">
					 <li class="nav-item"><a href="cars" class="nav-link">Used Cars</a></li>
					 <li class="nav-item"><a href="new_car" class="nav-link">Sell Your Car</a></li>
				</sec:authorize>
				
				<sec:authorize access="hasRole('Administrator')">
					 <li class="nav-item"><a href="cars" class="nav-link">Car Management </a></li>
					 <li class="nav-item"><a href="users" class="nav-link">User Management</a></li>
					 
				</sec:authorize>
				
					
			    <!-- /logout must be a POST request, as csrf is enabled.
			        This ensures that log out requires a CSRF token and that a malicious user cannot forcibly log out your users.-->
					
					<li class="nav-item">
					<form action="logout" method="post" style="padding:7px;">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
							<input type="submit"
							name="Logout" value="Logout" class="btn btn-primary"></input>
					</form>
					</li>
				</sec:authorize>
				



			</ul>
		</div>
	</div>
</nav>
