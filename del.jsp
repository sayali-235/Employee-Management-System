<%@page  import="java.sql.*" %> 
 <%
       if(request.getParameter("i") != null)
       {
         int id = Integer.parseInt(request.getParameter("i")); 
 
       try
       {
         DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver() );
         String url="jdbc:mysql://localhost:3306/spe5july22";
         Connection con = DriverManager.getConnection(url,"root","abc456");
            String sql= "delete from employee where id=?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1,id);
        pst.executeUpdate();
        con.close();
 
       }
       catch(SQLException e)
       {
         out.println("issue " +e);
       }
}
 %>

<html>
<head>
  <title> Employee Management System </title>
  <style>
  * { font-size:25px; font-family:Arial; }
  body { background-image: url("ems2.jpg");
   -moz-background-size: cover;
  -webkit-background-size:cover;
  background-size: cover;
  background-position: top center ! important;
  background-repeat: no-repeat ! important;
  background-attachment: fixed;
 }
  .nav { background-color:black; }
  .nav a { color:white; text-decoration:none; margin:5%;}
 </style>
</head>
<body>
<center>
  
           
    </tr>
   <div class="nav">

    <a href="home.jsp" > Home</a>
    <a href="add.jsp" > Add</a>
    <a href="update.jsp" > Update</a>
    <a href="del.jsp" > Delete</a>
    <a href="index.jsp" > Logout</a>

  </div>
   <h1> Delete Employee Details </h1> 
 
   <table border="3" style="width:50%;" >
    <tr>
        <th> Emp_ID </th>
        <th> Emp_Name </th>
        <th> Delete_Details </th>
     

  <%
 
       try
       {
         DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver() );
         String url="jdbc:mysql://localhost:3306/spe5july22";
         Connection con=DriverManager.getConnection(url,"root","abc456");
            String sql= "select * from employee";
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next())
            {
             int id=rs.getInt(1);
             String name=rs.getString(2);
%>
             <tr style="text-align:center;">
          <td><%= id %></td>
          <td><%= name %></td>
          <td> <a href="?i=<%=id%>" onclick="return confirm('Are You Sure??')"> Delete</a> </td>         
         </tr>
 <%
             }
 
        }
  catch(SQLException e)
  {
    out.println("issue" +e);
  }
%>
         
</center>
</body>
</html>