<%@page import="java.sql.*" %>
<html>
<head>
  <title> Employee Management System </title>
  <style>
  * { font-size: 25px;  font-family: Cambria Math; }
  body { background-image: url("ems2.jpg");
   -moz-background-size: cover;
  -webkit-background-size:cover;
  background-size: cover;
  background-position: top center ! important;
  background-repeat: no-repeat ! important;
  background-attachment: fixed;
 }
   </style>
</head>
<body>
<center>
  <h1> Login Page </h1>
  <form method="POST">
 <input type="text" name="un" placeholder="Enter Username" />
 <br/><br/>
 <input type="password" name="pw" placeholder="Enter Password" />
 <br/><br/>
  <input type="submit" value="Login" name="btn" />
 </form>
  <a href="./signup.jsp"> New User </a>

      <%
         if(request.getParameter("btn") != null)
         {
          String un=request.getParameter("un"); 
          String pw=request.getParameter("pw"); 
          try
           {
             DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
             String url="jdbc:mysql://localhost:3306/spe5july22";
             Connection con=DriverManager.getConnection(url,"root","abc456");
             String sql="select * from admin where username = ? and password = ?";
             PreparedStatement pst=con.prepareStatement(sql);
             pst.setString(1,un);
             pst.setString(2,pw);
             ResultSet rs=pst.executeQuery();
             if(rs.next())
             {
               request.getSession().setAttribute("admin",un);
               response.sendRedirect("home.jsp");
             }
             else
             {
               out.println("Invalid Login");
             }
           }
         catch(SQLException e)
         {
           out.println("issue " +e);
         }
         }
      %>
</center>
</body>
</html>