<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("/CouponFinal/ServletDemo/FirstPage");
%>