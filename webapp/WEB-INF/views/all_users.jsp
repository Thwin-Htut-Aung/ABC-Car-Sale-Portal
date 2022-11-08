<%@ page contentType="text/html; charset=US-ASCII"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>


<!--  Access the Static Resources without using spring URL -->
<link href="/css/style.css" rel="stylesheet" />
<script src="/js/custom.js"></script>


</head>

<body>

	<%@ include file="header.jsp"%>


	<!-- First Container -->
	<div class="container-fluid bg-1">
		<div>
			<h2 class="text-center">User List</h2>

			<div class="row">

				<div class="col-md-12">
				
					<c:if test="${not empty userlists}">
					
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>No.</th>
								<th>User ID </th>
								<th>Full Name</th>
								<th>User Name </th>
								<th>Password</th>
								<th>Actions</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="user" items="${userlists}">
						
							<tr>
								<td><%=i %></td>
								<td>${user.id}</td>
								<td>${user.name}</td>
								<td>${user.userName}</td>
								<td>${user.password}</td>

								<td>
									<button class="btn btn-info">View </button>
								</td>
							</tr>
							<% i++; %>
						</c:forEach>

						</tbody>
					</table>
					
					</c:if>
					
				</div>
			</div>
			
			<!--  End User Lists  -->

		</div>
	</div>


	<%@ include file="footer.jsp"%>
	</body>
	</html>