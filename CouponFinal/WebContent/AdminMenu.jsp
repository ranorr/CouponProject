<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Admin Menu</title>
</head>
<body>
	<form method=POST>
		<h1>Admin Menu:</h1>
		<br> <input type="button" value="Add Coupon"
			onclick="window.location.href='/CouponFinal/ServletDemo/AddCoupon'" /> <input
			type="button" value="Get Coupon"
			onclick="window.location.href='/CouponFinal/ServletDemo/GetCoupon'" /> <input
			type="button" value="Del Coupon"
			onclick="window.location.href='/CouponFinal/ServletDemo/AllCouponsAdmin'" /> <input
			type="button" value="Update Coupon"
			onclick="window.location.href='/CouponFinal/ServletDemo/UpdateCoupon'" /> <input
			type="button" value="ShowAllCoupons"
			onclick="window.location.href='/CouponFinal/ServletDemo/ChooseCategory'" /> <br>
		<input type="button" value="Add Business"
			onclick="window.location.href='/CouponFinal/ServletDemo/AddBusiness'" /> <input
			type="button" value="Get Business"
			onclick="window.location.href='/CouponFinal/ServletDemo/GetBusiness'" /> <input
			type="button" value="Update Business"
			onclick="window.location.href='/CouponFinal/ServletDemo/UpdateBusiness'" /> <input
			type="button" value="AllBusiness"
			onclick="window.location.href='/CouponFinal/ServletDemo/AllBusiness'" /><br>
		<button type="button" name="lopout"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>
		<%
			Object ob = request.getAttribute("timestamp");
		%>
	</form>
</body>
</html>