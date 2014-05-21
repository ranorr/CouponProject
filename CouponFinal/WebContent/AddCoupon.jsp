<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Adding Coupon</title>
</head>
<body>
	<form method=POST>
		Business ID:<select name="business_id">
			<%
				Object ob = request.getAttribute("timestamp");
				ICouponsDAO couponsHibernate = CuponHibernate.getCouponsHibernate();
				IBusinessDao businessHibernate = BusinessHibernate.getBusinessHibernate();
				ICategoryDAO categoryHibernate = CategoryHibernate.getCategoryHibernate();
				Iterator<Business> businessList = businessHibernate.getBusiness(1,
						1000);

				int i = 1;
				while (businessList.hasNext()) {
			%>
			<option value="<%=i%>"><%=businessList.next().getName()%></option>
			<%
				i++;
				}
			%>
		</select> <br>Image: <input type=text name=image> <br>Detail:
		<input type=text name=detail> <br>Category:
		<input type=text name=category> <br> <input type="submit"
			value="Add Coupon" />
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go
			Back to Menu</button>
		<button type="button" name="back"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>
		<%
			String businessIDStr = request.getParameter("business_id");
			String couponImageStr = request.getParameter("image");
			String couponDetailStr = request.getParameter("detail");
			String categoryStr = request.getParameter("category");

			if (businessIDStr != null && couponImageStr != null
					&& couponDetailStr != null && categoryStr != null) {

				int couponID = couponsHibernate.nextIDNumber();
				int couponBusinessID = Integer.parseInt(businessIDStr);
				Business tmpBusinesss = new Business(0, null, null);
				tmpBusinesss = businessHibernate.getBusiness(couponBusinessID);
				//check if catagory exist - if not create new one
				//Category newCategory = new Category(categoryStr);
				Category newCategory = new Category(categoryStr);
				if(categoryHibernate.CheckIfExist(categoryStr))
				{
					newCategory = categoryHibernate.getCategory(categoryStr);
				}
				else {
					categoryHibernate.addCategory(newCategory);
				}
				Coupon tmpCoupon = new Coupon(couponID, tmpBusinesss,
						couponImageStr, couponDetailStr, newCategory);
				couponsHibernate.addCoupon(tmpCoupon);
				out.println("<br>Coupon added successfuly! <br>");
			}
		%>
	</form>
</body>
</html>