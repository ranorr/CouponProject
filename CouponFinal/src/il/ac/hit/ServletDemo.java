package il.ac.hit;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * Servlet implementation class ServletDemo
 */
@WebServlet("/ServletDemo/*")
public class ServletDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private static Logger logger = Logger.getRootLogger();
	 
	   private void myMethod() {
	      logger.error("Error encountered");
	   }

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletDemo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// String cupon_idStr = request.getParameter("cupon_id");
		// int cupon_id = Integer.parseInt(cupon_idStr);
		// Coupon tmpCupon = new Coupon();
		try {
			// ICouponsDAO couponsHibernate =
			// CuponHibernate.getCouponsHibernate();
			// IBusinessDao businessDao =
			// BusinessHibernate.getBusinessHibernate();
			String path = request.getPathInfo();
			/*
			 * int flag = 0;
			 * 
			 * if (flag == 0 && path.equals("/*")) { flag = 1;
			 * request.setAttribute("timestamp", new Date()); RequestDispatcher
			 * dispatcher = getServletContext()
			 * .getRequestDispatcher("/FirstPage.jsp");
			 * dispatcher.forward(request, response); }
			 */
			if (path.equals("/AddBusiness")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/AddBusiness.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/AddCoupon")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/AddCoupon.jsp");
				dispatcher.forward(request, response);
			}

			else if (path.equals("/AddToCart")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/AddToCart.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/AdminMenu")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/AdminMenu.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/AllBusiness")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/AllBusiness.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/AllCoupons")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/AllCoupons.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/AllCouponsAdmin")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/AllCouponsAdmin.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/ChooseCategory")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/ChooseCategory.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/DelBusiness")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/DelBusiness.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/DelCoupon")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/DelCoupon.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/FirstPage")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/FirstPage.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/GetCoupon")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/GetCoupon.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/GetBusiness")) {
					request.setAttribute("timestamp", new Date());
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/GetBusiness.jsp");
					dispatcher.forward(request, response);
			}
			else if (path.equals("/Login")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/Login.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/Logout")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/Logout.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/MyCouponsCart")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/MyCouponsCart.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/Registration")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/Registration.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/RegPage")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/RegPage.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/Success")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/Success.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/UpdateBusiness")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/UpdateBusiness.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/UpdateBusinessDetailes")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/UpdateBusinessDetailes.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/UpdateCoupon")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/UpdateCoupon.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/UpdateCouponDetailes")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/UpdateCouponDetailes.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/UserMenu")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/UserMenu.jsp");
				dispatcher.forward(request, response);
			}
			else if (path.equals("/Welcome")) {
				request.setAttribute("timestamp", new Date());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/Welcome.jsp");
				dispatcher.forward(request, response);
			}
			
		}

		
		catch (NumberFormatException e) {
			out.println("FATAL ERROR!!!");
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		out.println("<br>" + "servlet page");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
	   System.out.println("Initialising log4j");
	   String log4jLocation = config.getInitParameter("log4j-properties-location");
	 
	   ServletContext sc = config.getServletContext();
	 
	   if (log4jLocation == null) {
	      System.out.println("No log4j properites...");
	      BasicConfigurator.configure();
	   } else {
	      String webAppPath = sc.getRealPath("/");
	      String log4jProp = webAppPath + log4jLocation;
	      File output = new File(log4jProp);
	 
	      if (output.exists()) {
	         System.out.println("Initialising log4j with: " + log4jProp);
	         PropertyConfigurator.configure(log4jProp);
	      } else {
	         System.out.println("Find not found (" + log4jProp + ").");
	         BasicConfigurator.configure();
	      }
	   }
	 
	   super.init(config);
	}

}
