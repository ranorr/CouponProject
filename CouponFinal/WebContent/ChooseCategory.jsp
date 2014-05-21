<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.*"%>
<jsp:useBean id="user" class="il.ac.hit.Members" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Choose Category</title>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js">
	
</script>
</head>
<body>
	<form action="/CouponFinal/ServletDemo/AllCoupons" method="POST">
		<div class="ui-field-contain">
			<label for="select-custom-1"><b>Category:</b></label> <select
				name="category" id="category" data-native-menu="false">
				<%
					Object ob = request.getAttribute("timestamp");
					ICouponsDAO couponsHibernate = CuponHibernate.getCouponsHibernate();
					ICategoryDAO categoryHibernate = CategoryHibernate
							.getCategoryHibernate();
					Iterator<Coupon> couponList = couponsHibernate.getCoupons(1, 1000);
					Iterator<Category> categoryList = categoryHibernate
							.getAllCategorys();
					int i = 1;
					String tmpStr = "All";
					while (categoryList.hasNext()) {
						if (i == 1) {
				%>
				<option value="<%=tmpStr%>"><%=tmpStr%></option>
				<%
					i = 0;
						}
						tmpStr = categoryList.next().getCategoryName();
				%>
				<option value="<%=tmpStr%>"><%=tmpStr%></option>
				<%
					}
				%>
			</select>
		</div>
		<br> <input type="submit" value="Show Coupons">
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<%
			if (user.getAdmin()) {
		%>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go Back to Menu</button>
		<%
			} else {
		%>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/UserMenu'">Go Back to Menu</button>
		<%
			}
		%>
	</form>
</body>
</html>