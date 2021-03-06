<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="icon" type="image/x-icon"
	href="http://cdn.onlinewebfonts.com/svg/img_174666.png">
<style>
a {
	text-decoration: none;
	color: white;
	cursor: pointer;
}

.hero {
	position: absolute;
	width: 100%;
	height: 100vh;
	opacity: 90%;
	top: 0;
	left: 0;
	z-index: -100;
}

.hero-wrap {
	display: flex;
	justify-content: left;
	margin-top: 1rem;
	min-height: 85vh;
}

.hero-text {
	font-size: 4rem;
	font-weight: 900;
	color: white;
	text-transform: capitalize;
	text-align: center;
	font-family: 'Josefin Sans', sans-serif;
}

.overlay {
	opacity: 65%;
	background-color: black;
}

body {
	background-color: hsl(0, 20%, 0%);
}

.nav-wrap {
	height: 10vh;
	background-color: black;
	position: sticky;
	top: 0;
	left: 0;
	z-index: 100;
}

nav {
	height: 100%;
	/* background-color: blue; */
}

.nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.navlinks {
	display: flex;
	align-items: center;
	padding: 0 1rem 0 0.7rem;
}

.login {
	background-color: tomato;
	border-radius: 4px;
}

.nav-right {
	display: flex;
}

form {
	padding-right: 1rem;
	margin-bottom: 1rem;
	margin: auto;
}

.btn {
	all: unset;
	background-color: turquoise;
	color: black;
	padding: 0.23rem 1rem;
	border-radius: 4px;
	box-sizing: border-box;
}

.search-box {
	padding: 0.2rem 0.5rem;
	border-radius: 4px;
	border: none;
	outline: none;
	box-sizing: border-box;
}

.product {
	color: black;
}

.card {
	margin-right: 0.5rem;
	position: relative;
	min-height: 85vh;
}

.card-img-top {
	height: 60vh;
	width: 100%;
	object-fit: cover;
}

.cart-empty-text {
	color: white;
}

.del {
	background-color: tomato;
	padding: 0.5rem;
	text-align: center;
	border-radius: 4px;
	width: 40%;
	justify-content: center;
	align-items: flex-end;
	margin-left: 1rem;
}

.price {
	display: flex;
	align-items: flex-end;
	font-weight: 900;
	font-size: 1.2rem;
}

.rate-btn {
	all: unset;
	background-color: turquoise;
	padding: 0.3rem 0.7rem;
	border-radius: 4px;
}

.tab {
	padding: 0.2rem 1rem;
}

.checkout-bar {
	background-color: aliceblue;
	padding: 0.7rem 1rem;
	margin: 1rem 0rem;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	border-radius: 4px;
}

.checkout-btn {
	color: black;
	background-color: tomato;
	padding: 0.3rem 1rem;
	border-radius: 4px;
	margin-left: 1rem;
	color: white;
}

.info {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-top: 0.6rem;
}

p {
	margin-bottom: 0.4rem;
}

footer {
	position: absolute;
	bottom: 0;
	left: 0;
}

.footer-text {
	color: white;
	text-align: center;
}

.container {
	position: relative;
	bottom: 0;
	left: 0;
}
</style>
</head>
<body>
	<div class="nav-wrap">
		<nav class="container nav">
			<a href="/" class="navlinks"> <span class="material-icons pe-2"
				style="color: white;">home</span> <span>Home</span>
			</a>
			<div class="nav-right">
				<div class="form">
					<form action="/search">
						<input type="text" name="book_title" class="search-box"
							placeholder="Search"> <input type="submit" value="Search"
							class="btn">
					</form>
				</div>
				<c:if test="${user == null }">
					<a href="/login" class="navlinks login"> <span
						class="material-icons pe-1" style="color: white;">person</span> <span>Login</span>
				</c:if>
				<c:if test="${user != null }">
					<!-- <a href="/view-order" class="navlinks"><span
						class="material-icons pe-2" style="color: white">shopping_cart</span><span>Cart</span>
					</a> -->
					<a href="/logout" class="navlinks login"> <span>Logout</span>
					</a>
				</c:if>

			</div>
		</nav>
	</div>
	<div class="container">

		<div class=" hero overlay"></div>
		<div class="hero-wrap">
			<c:if test="${orders.isEmpty()}">
				<h2 class="cart-empty-text">Your Cart is Empty</h2>
			</c:if>
			<c:set var="total" scope="session" value="${0}" />
			<c:forEach var="cartItem" items="${orders}">
				<div class="card" style="width: 18rem;">
					<%-- <img src="${cartItem.book.book_image}" class="card-img-top"
						alt="phone image">
					<div class="card-body"> --%>
						<h5 class="card-title">${cartItem.book.book_title}</h5>

						<div class="price">
							<span class="material-icons"> currency_rupee </span>${cartItem.book.price}</div>${cartItem.book.author}
							</br>
							${cartItem.book.category}
							</br>
							${cartItem.book.summary}
				
							</br>Quantity
						${cartItem.quantity }
		
						<div class="hide" style="display: none;">${total = total + ( cartItem.quantity * cartItem.book.price)}</div>
						
						

						<div class="info">
							<div class="price">
								Total:<span class="material-icons"> currency_rupee </span>${cartItem.quantity * cartItem.book.price}</div>
							<a href="/orderdelete?id=${cartItem.book.book_id}"
								class="navlinks del"><span class="material-icons"
								style="color: white;">delete</span>Delete</a>
						</div>
					</div>

				</div>
			</c:forEach>

		</div>
		<c:if test="${!cartList.isEmpty()}">
			<div class="checkout-bar">
				<div class="price">
					<span
						style="font-size: 1rem; font-weight: 400; padding-right: 0.4rem;"></span> Total <span class="material-icons">
						currency_rupee </span> ${total}
				</div>
				<a href="/checkout" class="navlinks checkout-btn">Checkout</a>
			</div>
		</c:if>
	</div>


</body>
</html>