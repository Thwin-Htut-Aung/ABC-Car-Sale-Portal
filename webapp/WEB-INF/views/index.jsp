<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="/css/style.css" rel="stylesheet" />
</head>

<body>
<%@ include file="header.jsp"%>

<div class="bg-1">
<h1 class="home-head">Welcome to ABC Car Sale Portal!</h1>

<div class="row">
<div class="col-sm-12"></div>
</div>

<div class="row">
<div class="col-sm-2"></div>

<div class="col-sm-8">
<div id="demo" class="carousel slide bg-5" data-bs-ride="carousel">

  <!-- Indicators -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
    
  </div>

  <!-- The carousel content-->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/images/car.jpg" alt="Mazda CX-5" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="/images/car 1.jpg" alt="BMW X7" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="/images/car 2.jpg" alt="Mercedes-Benz GLC" class="d-block w-100">
    </div>
     <div class="carousel-item">
      <img src="/images/car 3.jpg" alt="Toyota Fortuner" class="d-block w-100">
    </div>
  </div>

  <!-- Left and right buttons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>
</div>

<div class="col-sm-2"></div>
</div>

</div>
















<%@ include file="footer.jsp"%>
</body>
</html>