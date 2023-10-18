
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
 
  <h1> Add Employee </h1>
  <form method="POST">
 <input type="number" name="eid" placeholder="Enter  ID" required />
 <br/><br/>
 <input type="text" name="na" placeholder="Enter  Name" required/>
 <br/><br/>
  <label> Select Gender </label>
   <br/>
   <input type="radio" name="c" value="Male" checked=true />Male
   <input type="radio" name="c" value="Female"  />Female
 <br/><br/>
 <input type="number" name="phnno" placeholder="Enter Phn no" required />
 <br/><br/>
 <input type="email" name="email" placeholder="Enter Email ID" required />
 <br/><br/>
 <input type="text" name="designation" placeholder="Enter Designation" required />
 <br/><br/>
 <input type="number" name="salary" placeholder="Enter Salary" required />
 <br/><br/>
  <input type="submit" value="Submit" name="btn"  />
 </form>
       <% 
         if(request.getParameter("btn") != null)
         { 
          int eid=Integer.parseInt(request.getParameter("eid")); 
          
          String na=request.getParameter("na"); 
          String choice=request.getParameter("c"); 
          String phnno=request.getParameter("phnno"); 
          String email=request.getParameter("email"); 
          String designation=request.getParameter("designation");    
          int salary=Integer.parseInt(request.getParameter("salary")); 
        if(eid < 0)
        {
         out.println("ID Should be positive ");
         return;
        }
       else  if(na.length() < 2)
        {
          out.println("name shoulde having 2 character");
          return;
        }    
        else if(! na.matches("^[a-zA-Z]*$"))
        {
         out.println(" Name is invalid ");
         return;
        }
        else if(phnno.length()<10 || phnno.length() >10)
        {
         out.println("Phone no shoulde be 10 digit");
         return ;
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

          try
           {
             DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
             String url="jdbc:mysql://localhost:3306/ spe5july22";
             Connection con=DriverManager.getConnection(url,"root","abc456");
             String sql="insert into employee values(?,?,?,?,?,?,?)";
             PreparedStatement pst=con.prepareStatement(sql);
             pst.setInt(1,eid);
             pst.setString(2,na);
             pst.setString(3,choice);

             pst.setString(4,email);
             pst.setString(5,designation);
             pst.setInt(6,salary);
             pst.setString(7,phnno);
             pst.executeUpdate();
             con.close();
    
   out.println("Record Added");
          }
         catch(SQLException e)
         {
           out.println("ID Already Exists" );
         }
     
         }
      %>

 
</center>
</body>
</html>