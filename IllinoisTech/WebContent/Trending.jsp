<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="bean.*, database.MySqlJDBC, database.*,com.mongodb.*,java.util.*" %>
	<%  
	MySqlJDBC mysql = new MySqlJDBC(); 
	User user = (User)request.getSession().getAttribute("userData");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>IllinoisTech Sporting Goods</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><style type="text/css" media="screen">.tabbed { height:420px; }</style><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery.slide.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<style>
#login_container form input, #login_container form select, #login_container form textarea {
	padding: 5px;
	color: #333333;
	border: 1px solid #ddd;
	border-right:1px solid #ccc;
	border-bottom:1px solid #ccc;
	background-color:#fff;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
}
</style>
</head>
<body>
	<div id="body">
		<!-- Top -->
		<div id="top">
			<div class="shell">
				<!-- Header -->
				<div id="header">
					<h1 id="logo">
						<a href="#">IllinoisTech Sporting Goods</a>
					</h1>
					<div id="navigation">
						<ul>
          <%if(user!=null) {%>	
          <li><a href="UserHome.jsp">Home</a></li>
          <li><a href="#">Support</a></li>
          <li><a href="MyOrders.html">My Orders</a></li>
          <li><a href="#">Contact</a></li>
          <li><a href="index.jsp?value=logout">Logout</a></li>
          <%}else{ %>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="#">Support</a></li>
          <li><a href="Login.jsp">Login</a></li>
          <li><a href="Signup.html">Sign Up</a></li>
          <li><a href="#">Contact</a></li>
          <%} %>
        </ul>
					</div>
				</div>
				<!-- End Header -->
				<!-- Slider -->
				<div id="slider">
					<div id="slider-holder">
						<ul>
							<li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
							<li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
							<!--<li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>-->
						</ul>
					</div>
					<div id="slider-nav">
						<a href="#" class="prev">Previous</a> <a href="#" class="next">Next</a>
					</div>
				</div>
				<!-- End Slider -->
			</div>
		</div>
		<!-- Top -->
		<!-- Main -->
		<div id="main">
			<div class="shell">
				<!-- Search, etc -->
				<div class="options">
      <div style="float: left; margin-top: 10px; padding-right: 7px;">
    	 <p>Search IllinoisTech</p>
      </div>
      <div class="search">
        <form action="#" method="post">
          <span class="field">
          <input type="text" class="blink" value=" search here.." title="SEARCH" />
          </span>
          <input type="text" class="search-submit" value="GO" />
        </form>
      </div>
      <div style="float: left; margin-top: 10px; margin-left:220px; padding-right: 10px;">
      	<%if(user!=null){ %>
      	<p>Hello, <%=user.getUsername() %></p>
      	<%} %>
      </div>
      <div class="right" style="float: left; margin-left:30px"> 
      	<span class="cart"><a href="ViewCart.jsp" class="cart-ico">&nbsp;</a><strong>$0.00</strong></span> 
      	<span class="left more-links"> <a href="UserHome.jsp">Products</a></span>
      </div>
    </div>
    </div>	
			
				<!-- End Search, etc -->
				<!-- Content -->
				<div id="content">
					<!--Login Container -->
					<div id="container">
						<div id="login_container">
							 <h2>Top Rated Products:</h2><br>

        <%

         AggregationOutput aggregate = MongoDbUtil.query1();
        
        String tableData="";

        aggregate = MongoDbUtil.query1();
        for (DBObject result: aggregate.results()) {
            BasicDBObject bobj= (BasicDBObject) result;

            tableData=bobj.getString("_id") + " " + bobj.getString("rating");
            %>
            <tr>
                        
                        
                        <td><%=tableData%></td><br>
                        </tr>
        <%
        }
        %>		
        
        
        <br><h2>Top Sold Products: </h2><br>
          <%
          
            HashMap < String, Integer > orderedProducts = new HashMap < String, Integer > ();
          orderedProducts = MySqlJDBC.query2(orderedProducts);
            for (Map.Entry< String, Integer > entry: orderedProducts.entrySet()) {
                String key = entry.getKey();
                Integer value = entry.getValue();
                String tableData1="";
                tableData1=key +" "+ value;
                %>
                <p><%= tableData1 %></p>
                <%
            }
            %>		
						</div>
						<!-- Brands -->
						<div class="brands">
							<h3>Brands</h3>
							<div class="logos">
								<a href="#"><img src="css/images/logo1.gif" alt="" /></a> <a
									href="#"><img src="css/images/logo2.gif" alt="" /></a> <a
									href="#"><img src="css/images/logo3.gif" alt="" /></a> <a
									href="#"><img src="css/images/logo4.gif" alt="" /></a> <a
									href="#"><img src="css/images/logo5.gif" alt="" /></a>
							</div>
						</div>
						<!-- End Brands -->
						<!-- Footer -->
						<div id="footer">
							<div class="left">
								<a href="#">Home</a> <span>|</span> <a href="#">Support</a> <span>|</span>
								<a href="#">My Account</a> <span>|</span> <a href="#">The
									Store</a> <span>|</span> <a href="#">Contact</a>
							</div>
							<div class="right">
								&copy; Design by Grad Students at <a href="https://web.iit.edu">Illinois
									Tech</a>
							</div>
						</div>
						<!-- End Footer -->
					</div>
					<!-- End Container -->
				</div>
				<!-- End Content -->
			</div>
		</div>
	</div>
	<!-- End Main -->
</body>
</html>
