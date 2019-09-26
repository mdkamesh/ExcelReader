<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Manager Login Form</title>
</head>

<img
	src="header.jpg"
	width="2600" height="300" align="top"/>
<body scroll="no" style="overflow: hidden">

	<FORM ACTION="Resource_Allocation_Report.jsp" METHOD="POST">
		Manger Mail_ID : <INPUT TYPE="TEXT"
			style="font-size: 10pt; height: 30px" NAME="id"> <INPUT
			TYPE="SUBMIT" value="Export to Excel" name="answer"
			onclick="showDiv()">   <div id="welcomeDiv" style="display: none;" class="answer_list">
		<i class="fa fa-spinner fa-spin" style="font-size: 24px"></i>
		Loading,Please Wait ...............!
	</div>
	</FORM>
	<br />

	
</body>





<script>
function showDiv() {
   document.getElementById('welcomeDiv').style.display = "block";
}


</script>

<!-- <img
	src="footer.jpg"
	width="2500" height="200" align="bottom"/> -->
	
	
<style type="text/css">
   
    .fixed-footer{
       /*  width: 100%;
        height : 80;
        position: absolute;        
        background: BLACK;
        padding: 30px 0;
        color: #fff;
        overflow:hidden; */
        height: 90px;
    background: black;
    width: 100%;
    display: inline-block;
    color: white;
    position: absolute;
    bottom:0;
    left: 0;
    right: 10;
        
}
    .fixed-footer{
        bottom: 0;
        
        margin-right: 70px;
        
    }    
</style>
</head>
<body>
    <div class="fixed-footer">
        <div style="text-align:right" ;> &copy; DXC Technology</div>   
        <div class="container" align="left"><table>
  
  <tr>
    <td align="left">Contact Us</td>
    
  </tr>
  <tr>
    <td align="left">Privacy Policy</td>
    
  </tr>
</table></div>     
    </div>
</body>

</html>