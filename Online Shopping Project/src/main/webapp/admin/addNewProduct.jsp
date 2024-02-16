<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%}%>
<% 
int id=1;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}catch(Exception e){
	
}
%>
<form action="addNewProductAction.jsp" method ="post">
<h3 style="color: yellow;">Product ID:<%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%out.println(id); %>">
<div class="formPage">
	<div class="left-side">
	<label for="name">Enter Name</label>
	<input class="input-style" id="name" type="text" name="name" placeholder="Enter Name" required>
	</div>
	
	<div class="right-side">
	<label for="name">Enter Category</label>
	<input class="input-style" type="text" name="category" placeholder="Enter category" required>
	</div>
	
	<div class="left-side">
	<label for="name">Enter Price</label>
 <input class="input-style" type="number" name="price" placeholder="Enter price" required>
	</div>
	
	<div class="right-side">
	<label for="name">Active</label>
	 <select class="input-style" name="active">
   <option value="Yes">Yes</option>
   <option value="NO">No</option>
   </select>
	</div>
</div>
<div class="saveButton">
<button class="button">save <i class='far fa-arrow-alt-circle-right'></i></button>
</div>

</form>


</body>
</html>