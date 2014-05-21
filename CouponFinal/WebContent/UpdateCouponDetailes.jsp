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
	<form>
		<%
			Object ob = request.getAttribute("timestamp");
			ICouponsDAO couponsHibernate = CuponHibernate.getCouponsHibernate();
			IBusinessDao businessHibernate = BusinessHibernate
					.getBusinessHibernate();
			ICategoryDAO categoryHibernate = CategoryHibernate.getCategoryHibernate();
			String couponIDStr = request.getParameter("coupon_id");
			String businessIDStr = request.getParameter("business_id");
			String imageStr = request.getParameter("image");
			String detailsStr = request.getParameter("details");
			String categoryStr = request.getParameter("category");
			int businessID;
			int couponID;

			if (couponIDStr != null && businessIDStr != null) {
				couponID = Integer.parseInt(couponIDStr);
				businessID = Integer.parseInt(businessIDStr);
				couponID = Integer.parseInt(couponIDStr);
				Business b = businessHibernate.getBusiness(businessID);
				Category category = new Category(categoryStr);
				if(categoryHibernate.CheckIfExist(categoryStr))
				{
					category = categoryHibernate.getCategory(categoryStr);
				}
				else {
					categoryHibernate.addCategory(category);
				}
				couponsHibernate.updateCoupon(new Coupon(couponID, b, imageStr,
						detailsStr, category));
		%>
		Updated Successfully.
		<%
			out.println("<br>Coupon detailes: "
						+ couponsHibernate.getCoupon(couponID));
		%>
		<br>
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go
			Back to Menu</button>
		<button type="button" name="back"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>
		<%
			}
		%>



	</form>

</body>
</html>