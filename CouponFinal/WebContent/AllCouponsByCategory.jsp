<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Insert title here</title>
</head>
<body>
	<form action="/CouponFinal/ServletDemo/AddToCart" method="POST">
		Category:<select name="category">
			<%
				Object ob = request.getAttribute("timestamp");
				ICouponsDAO couponsHibernate = CuponHibernate.getCouponsHibernate();
				ICategoryDAO categoryHibernate = CategoryHibernate
						.getCategoryHibernate();
				Iterator<Coupon> couponList = couponsHibernate.getCoupons(1, 1000);
				Iterator<Category> categoryList = categoryHibernate
						.getAllCategorys();
				int i = 1;
				String tmpStr = "";
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
		</select> <br>
		<%
			String categoryNameStr = request.getParameter("category");
			if (categoryNameStr != null) {
				Coupon tmp;
				int id = 1;
				while (couponList.hasNext()) {
					tmp = couponsHibernate.getCouponFromList(couponList);
					if (tmp.getCategory().getCategoryName()
							.equals(categoryNameStr)) {
		%>
		<input type="radio" name="radios" value=<%=id%>></input>
		<%
			out.println(tmp.toString());
						id++;
		%>
		<img src="/CuponServletProj/Images/<%=tmp.getImage()%>" alt='image'
			width="42" height="42"> <br>
		<%
			}
				}
			}
		%>
		 <br>
		<input type="submit" name="show" value="Show"></input>
		<input type="submit" value="Add To Cart" onclick="window.location.href='/CouponFinal/ServletDemo/AddToCart'">
		<button type="button" name="back"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>
	</form>
</body>
</html>