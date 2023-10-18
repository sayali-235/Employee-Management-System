
<%@page import="java.sql.*" %>
<html>
<head>
  <title> Employee Management System </title>
  <style>
  * { font-size:22px;  font-family: Cambria Math; }
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
 
  <h1> Update Employee Details </h1>
  <form method="POST">
 <input type="number" name="eid" placeholder="Enter  ID" required />
 <br/><br/>
 <input type="text" name="name" placeholder="Enter  Name" required/>
 <br/><br/>
 <input type="text" name="designation" placeholder="Enter Designation" required />
 <br/><br/>
 <input type="number" name="salary" placeholder="Enter Salary" required />
 <br/><br/>
  <input type="submit" value="Submit" name="btn" />
 </form>
        <% 
     if(request.getParameter("btn") != null)   
       {

        try
        {
 
         DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
        String url="jdbc:mysql://localhost:3306/ spe5july22";
        Connection con=DriverManager.getConnection(url, "root","abc456");
        String sql= " update employee set name=?,designation=?,salary= ?  where id= ?";
        PreparedStatement pst=con.prepareStatement(sql);
        int id=Integer.parseInt(request.getParameter("eid")); 
        String name=request.getParameter("name");
        String designation=request.getParameter("designation");
        int salary=Integer.parseInt(request.getParameter("salary"));
      
        if(! name.matches("^[a-zA-Z]*$"))
        {
          out.println(" Name is invalid ");
          return;
        }
        else if(name.length() < 2)
        {
          out.println("name shoulde having 2 character");
          return;
        }     
        else if(id < 0)
         {
           out.println("ID Should be positive ");
           return;
         }
         else if(designation.length() < 4)
        {
          out.println("Designation should having at least 4 character");
          return;
        }  
        else if(salary < 0)
        {
         out.println("Salary Should be positive ");
         return;
        }
        if(salary < 1000)
        {
         out.println("Salary Should be greater than 1000 ");
         return;
        }
        pst.setInt(4,id);
        pst.setString(1,name);
        pst.setString(2,designation);
        pst.setInt(3,salary);

        long r=pst.executeUpdate();
        out.println(" record updated");
       }
      catch(SQLException e)
      {
       out.println("issue ");
      }
    }
 %>
 
</center>
</body>
</html>