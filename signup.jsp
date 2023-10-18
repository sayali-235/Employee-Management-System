
<%@page import="java.sql.*" %>
<html>
<head>
  <title> Employee Management System </title>
  <style>
  * { font-size:25px;  font-family: Cambria Math; }
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
  <h1> SignUp Page </h1>
  <form method="POST">
 <input type="text" name="na" placeholder="Enter Name" />
 <br/><br/>
 <input type="text" name="un" placeholder="Enter Username" />
 <br/><br/>
 <input type="password" name="pw1" placeholder="Enter Password" />
 <br/><br/>
 <input type="password" name="pw2" placeholder="Repeat Password" />
 <br/><br/>
  <input type="submit" value="Register" name="btn" />
 </form>
  <a href="./index.jsp"> Already Registerted </a>

      <%
         if(request.getParameter("btn") != null)
         {
          String na=request.getParameter("na"); 
          String un=request.getParameter("un"); 
          String pw1=request.getParameter("pw1"); 
          String pw2=request.getParameter("pw2"); 
          if(! pw1.equals(pw2))
            {

             out.println("Password Did Not Match ");    
             return;
            }
         if(pw1.length()<7)
             {
              out.println("Passwords Should be Contain Minimum 7 Characters ");
              return; 
             }
         if(! na.matches("^[a-zA-Z]*$"))
         {
         out.println(" Name is invalid ");
         return;
         }
           if(na.length() < 0)
        {
          out.println("name shoulde having 2 character");
          return;
        }     
       try
           {
             DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
             String url="jdbc:mysql://localhost:3306/ spe5july22";
             Connection con=DriverManager.getConnection(url,"root","abc456");
             String sql="insert into admin values(?,?,?)";
             PreparedStatement pst=con.prepareStatement(sql);
             pst.setString(1,na);
             pst.setString(2,un);
             pst.setString(3,pw1);
             pst.executeUpdate();
             con.close();
             response.sendRedirect("index.jsp");
          }
         catch(SQLException e)
         {
           out.println("User Already Register");
         }
         }
      %>
</center>
</body>
</html>