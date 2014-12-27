<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Time Sheet</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>"
	rel="stylesheet" type="text/css">
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"
	type="text/javascript"></script>


<link rel="stylesheet"
	href="<c:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>


<script src="<c:url value="../js/jsapi"/>"></script>
<script src="<c:url value="js/jquery, 1.3.2.js"/>"></script>
<script src="<c:url value="js/ui.datepicker.js"/>"></script>
<script src="<c:url value="js/calendar-config.js"/>"></script>
<link href="<c:url value="css/jquery-ui-sunny.css"/>" rel="stylesheet" type="text/css">
 <script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />" rel="stylesheet" type="text/css"/>	

<!-- <script type="text/javascript">

$(function() {
    var currentDate = new Date();
    $('#datepicker').datepicker({
        inline: true,
        showOtherMonths: true,
        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        dateFormat: 'dd/mm/yy'
    });
    $("#datepicker").datepicker("setDate", currentDate);
});

</script> -->
<!-- <script type="text/javascript">
            // When the document is ready
           //  var currentDate = new Date();
            $(document).ready(function () {
               $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });
                
               // $("#dp1").datepicker("setDate", currentDate);
              // $('#dp1').datepicker('setValue',currentDate);
               
            });
           
             $( document ).ready(function() {
            	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
             
             $(function(){

            	  $('#dp1').datepicker().on('changeDate', function(ev) {
            		 
            		  var dt0=new Date(ev.date);
            		  
            		  var dt1=new Date(ev.date);
            		 
            		 var dt2=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt3=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt4=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt5=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt6=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt7=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt8=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt9=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt10=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt11=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt12=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt13=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt14=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt15=new Date(dt1.setDate(dt1.getDate()-1));
            			 
            		 var weekday = [];
            		 weekday[0]=  "Sun";
            		 weekday[1] = "Mon";
            		 weekday[2] = "Tue";
            		 weekday[3] = "Wed";
            		 weekday[4] = "Th";
            		 weekday[5] = "Fri";
            		 weekday[6] = "Sat";
            		 
            		 var day1 = weekday[dt1.getDay()];
            		 var day2 = weekday[dt2.getDay()];
            		 var day3 = weekday[dt3.getDay()];
            		 var day4 = weekday[dt4.getDay()];
            		 var day5 = weekday[dt5.getDay()];
            		 var day6 = weekday[dt6.getDay()];
            		 var day7 = weekday[dt7.getDay()];
            		 var day8 = weekday[dt8.getDay()];
            		 var day9 = weekday[dt9.getDay()];
            		 var day10 = weekday[dt10.getDay()];
            		 var day11 = weekday[dt11.getDay()];
            		 var day12 = weekday[dt12.getDay()];
            		 var day13 = weekday[dt13.getDay()];
            		 var day14 = weekday[dt14.getDay()];
            		 var day15 = weekday[dt15.getDay()];
            		
            		 document.getElementById("dt1").innerHTML =day15+" "+dt15.getDate();
            		 document.getElementById("dt2").innerHTML =day14+" "+dt14.getDate();
            		 document.getElementById("dt3").innerHTML =day13+" "+dt13.getDate();
            		 document.getElementById("dt4").innerHTML =day12+" "+dt12.getDate();
            		 document.getElementById("dt5").innerHTML =day11+" "+dt11.getDate();
            		 document.getElementById("dt6").innerHTML =day10+" "+dt10.getDate();
            		 document.getElementById("dt7").innerHTML =day9+" "+dt9.getDate();
            		 document.getElementById("dt8").innerHTML =day8+" "+dt8.getDate();
            		 document.getElementById("dt9").innerHTML =day7+" "+dt7.getDate();
            		 document.getElementById("dt10").innerHTML =day6+" "+dt6.getDate();
            		 document.getElementById("dt11").innerHTML =day5+" "+dt5.getDate();
            		 document.getElementById("dt12").innerHTML =day4+ " "+dt4.getDate();
            		 document.getElementById("dt13").innerHTML =day3+ " "+dt3.getDate();
            		 document.getElementById("dt14").innerHTML =day2+" "+dt2.getDate();
            		 document.getElementById("dt15").innerHTML =day1+" "+dt0.getDate();
            		//alert(new Date(ev.date));
            		$(this).datepicker('hide');
            	  });
            	  
            	});
             
       </script>
       
    
       
       
       

<script type="text/javascript">
$(document).ready(function()
			{
					 $('#dp1').datepicker().on('changeDate', function(ev)
					 {
	  		   			$('#nextbtn').click(function()
	 	 						  {
	 		  				 			//alert("NExt btn pressed");
	 		  				 			/* var nextdt=new Date(ev.date);
	 		  				 			alert("value for next"+nextdt); */
	 		  				 			
	 		  				 	 			 var dt0=new Date(ev.date);
	 		             		  
	 		             		  //var dt1=new Date(ev.date);
	 		             		   //alert(dt1); 
	 		             		   var dt1=new Date(dt0.setDate(dt0.getDate()+1));
	 		             		 var dt2=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt3=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt4=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt5=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt6=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt7=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt8=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt9=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt10=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt11=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt12=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt13=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt14=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt15=new Date(dt1.setDate(dt1.getDate()+1));
	 		             			 
	 		             		 var weekday = [];
	 		             		 weekday[0]=  "Sun";
	 		             		 weekday[1] = "Mon";
	 		             		 weekday[2] = "Tue";
	 		             		 weekday[3] = "Wed";
	 		             		 weekday[4] = "Th";
	 		             		 weekday[5] = "Fri";
	 		             		 weekday[6] = "Sat";
	 		             		 
	 		             		 var day1 = weekday[dt15.getDay()];
	 		             	     var day2 = weekday[dt14.getDay()];
	 		             		 var day3 = weekday[dt13.getDay()];
	 		             		 var day4 = weekday[dt12.getDay()];
	 		             		 var day5 = weekday[dt11.getDay()];
	 		             		 var day6 = weekday[dt10.getDay()];
	 		             		 var day7 = weekday[dt9.getDay()];
	 		             		 var day8 = weekday[dt8.getDay()];
	 		             		 var day9 = weekday[dt7.getDay()];
	 		             		 var day10 = weekday[dt6.getDay()];
	 		             		 var day11 = weekday[dt5.getDay()];
	 		             		 var day12 = weekday[dt4.getDay()];
	 		             		 var day13 = weekday[dt3.getDay()];
	 		             		 var day14 = weekday[dt2.getDay()];
	 		             		 var day15 = weekday[dt1.getDay()];
	 		             		 
	 		             		
	 		             		 document.getElementById("dt15").innerHTML =day1+" "+dt15.getDate();
	 		             		 document.getElementById("dt14").innerHTML =day2+" "+dt14.getDate();
	 		             		 document.getElementById("dt13").innerHTML =day3+" "+dt13.getDate();
	 		             		 document.getElementById("dt12").innerHTML =day4+" "+dt12.getDate();
	 		             		 document.getElementById("dt11").innerHTML =day5+" "+dt11.getDate();
	 		             		 document.getElementById("dt10").innerHTML =day6+" "+dt10.getDate();
	 		             		 document.getElementById("dt9").innerHTML =day7+" "+dt9.getDate();
	 		             		 document.getElementById("dt8").innerHTML =day8+" "+dt8.getDate();
	 		             		 document.getElementById("dt7").innerHTML =day9+" "+dt7.getDate();
	 		             		 document.getElementById("dt6").innerHTML =day10+" "+dt6.getDate();
	 		             		 document.getElementById("dt5").innerHTML =day11+" "+dt5.getDate();
	 		             		 document.getElementById("dt4").innerHTML =day12+" "+dt4.getDate();
	 		             		 document.getElementById("dt3").innerHTML =day13+" "+dt3.getDate();
	 		             		 document.getElementById("dt2").innerHTML =day14+" "+dt2.getDate();
	 		             		 document.getElementById("dt1").innerHTML =day15+" "+dt0.getDate();
	 		             		$('#dp1').datepicker('setValue',dt15).datepicker('update'); 	
	 		             		 $(this).datepicker('hide');
	            		 				
	            	  				});
	  		   		
				});
			});
  
 </script>
 
 
<script type="text/javascript">
$(document).ready(function()
			{
					 $('#dp1').datepicker().on('changeDate', function(ev)
					 {
	  		   			$('#pre').click(function()
	 	 						  {
	 		  				 			//alert("Previous buttonn pressed");
	 		  				 			/* var nextdt=new Date(ev.date);
	 		  				 			alert("value for next"+nextdt); */
	 		  				 			
	 		  				 	  var dt0=new Date(ev.date);
	 		             		  
	 		             		  //var dt1=new Date(ev.date);
	 		             		   //alert(dt1); 
	 		             		   	var dt1=new Date(dt0.setDate(dt0.getDate()-1));
	 		             			 var dt2=new Date(dt1.setDate(dt1.getDate()-1));
	 		             			 var dt3=new Date(dt1.setDate(dt1.getDate()-1));
	 		             			 var dt4=new Date(dt1.setDate(dt1.getDate()-1));
	 		             			 var dt5=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt6=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt7=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt8=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt9=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt10=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt11=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt12=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt13=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt14=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt15=new Date(dt1.setDate(dt1.getDate()-1));
	 		             			 
	 		             		 var weekday = [];
	 		             		 weekday[0]=  "Sun";
	 		             		 weekday[1] = "Mon";
	 		             		 weekday[2] = "Tue";
	 		             		 weekday[3] = "Wed";
	 		             		 weekday[4] = "Th";
	 		             		 weekday[5] = "Fri";
	 		             		 weekday[6] = "Sat";
	 		             		 
	 		             		 var day1 = weekday[dt15.getDay()];
	 		             		 var day2 = weekday[dt14.getDay()];
	 		             		 var day3 = weekday[dt13.getDay()];
	 		             		 var day4 = weekday[dt12.getDay()];
	 		             		 var day5 = weekday[dt11.getDay()];
	 		             		 var day6 = weekday[dt10.getDay()];
	 		             		 var day7 = weekday[dt9.getDay()];
	 		             		 var day8 = weekday[dt8.getDay()];
	 		             		 var day9 = weekday[dt7.getDay()];
	 		             		 var day10 = weekday[dt6.getDay()];
	 		             		 var day11 = weekday[dt5.getDay()];
	 		             		 var day12 = weekday[dt4.getDay()];
	 		             		 var day13 = weekday[dt3.getDay()];
	 		             		 var day14 = weekday[dt2.getDay()];
	 		             		 var day15 = weekday[dt1.getDay()];
	 		      
	 		             		 document.getElementById("dt15").innerHTML =day15+" "+dt0.getDate();
	 		             		 document.getElementById("dt14").innerHTML = day14+" "+dt2.getDate();
	 		             		 document.getElementById("dt13").innerHTML =day13+" "+dt3.getDate();
	 		             		 document.getElementById("dt12").innerHTML =day12+" "+dt4.getDate();
	 		             		 document.getElementById("dt11").innerHTML =day11+" "+dt5.getDate();
	 		             		 document.getElementById("dt10").innerHTML =day10+" "+dt6.getDate();
	 		             		 document.getElementById("dt9").innerHTML =day9+" "+dt7.getDate();
	 		             		 document.getElementById("dt8").innerHTML =day8+" "+dt8.getDate();
	 		             		 document.getElementById("dt7").innerHTML =day7+" "+dt9.getDate();
	 		             		 document.getElementById("dt6").innerHTML =day6+" "+dt10.getDate();
	 		             		 document.getElementById("dt5").innerHTML =day5+" "+dt11.getDate();
	 		             		 document.getElementById("dt4").innerHTML =day4+" "+dt12.getDate();
	 		             		 document.getElementById("dt3").innerHTML =day3+" "+dt13.getDate();
	 		             		 document.getElementById("dt2").innerHTML =day2+" "+dt14.getDate();
	 		             		 document.getElementById("dt1").innerHTML =day1+" "+dt15.getDate();
	 		             		$('#dp1').datepicker('setValue',dt15).datepicker('update');
	 		             	    $(this).datepicker('hide');
	            		 				
	            	  				});
	  		   		
				});
			});
  
 </script>
 --> 
  <script type="text/javascript">
            // When the document is ready
            var currentDate = new Date();
            $(document).ready(function () {
               $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });
               // $("#dp1").datepicker("setDate", currentDate);
              $('#dp1').datepicker('setValue',currentDate);
               
            });
           
             $( document ).ready(function() {
            	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
             
             $(function(){

            	  $('#dp1').datepicker().on('changeDate', function(ev) {
            		 
            		  var dt0=new Date(ev.date);
            		  
            		  var dt1=new Date(ev.date);
            		 
            		 var dt2=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt3=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt4=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt5=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt6=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt7=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt8=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt9=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt10=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt11=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt12=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt13=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt14=new Date(dt1.setDate(dt1.getDate()-1));
            		 var dt15=new Date(dt1.setDate(dt1.getDate()-1));
            			 
            		 var weekday = [];
            		 weekday[0]=  "Sun";
            		 weekday[1] = "Mon";
            		 weekday[2] = "Tue";
            		 weekday[3] = "Wed";
            		 weekday[4] = "Th";
            		 weekday[5] = "Fri";
            		 weekday[6] = "Sat";
            		 
            		 var day1 = weekday[dt1.getDay()];
            		 var day2 = weekday[dt2.getDay()];
            		 var day3 = weekday[dt3.getDay()];
            		 var day4 = weekday[dt4.getDay()];
            		 var day5 = weekday[dt5.getDay()];
            		 var day6 = weekday[dt6.getDay()];
            		 var day7 = weekday[dt7.getDay()];
            		 var day8 = weekday[dt8.getDay()];
            		 var day9 = weekday[dt9.getDay()];
            		 var day10 = weekday[dt10.getDay()];
            		 var day11 = weekday[dt11.getDay()];
            		 var day12 = weekday[dt12.getDay()];
            		 var day13 = weekday[dt13.getDay()];
            		 var day14 = weekday[dt14.getDay()];
            		 var day15 = weekday[dt15.getDay()];
            		
            		 document.getElementById("dt1").innerHTML =day15+" "+dt15.getDate();
            		 document.getElementById("dt2").innerHTML =day14+" "+dt14.getDate();
            		 document.getElementById("dt3").innerHTML =day13+" "+dt13.getDate();
            		 document.getElementById("dt4").innerHTML =day12+" "+dt12.getDate();
            		 document.getElementById("dt5").innerHTML =day11+" "+dt11.getDate();
            		 document.getElementById("dt6").innerHTML =day10+" "+dt10.getDate();
            		 document.getElementById("dt7").innerHTML =day9+" "+dt9.getDate();
            		 document.getElementById("dt8").innerHTML =day8+" "+dt8.getDate();
            		 document.getElementById("dt9").innerHTML =day7+" "+dt7.getDate();
            		 document.getElementById("dt10").innerHTML =day6+" "+dt6.getDate();
            		 document.getElementById("dt11").innerHTML =day5+" "+dt5.getDate();
            		 document.getElementById("dt12").innerHTML =day4+ " "+dt4.getDate();
            		 document.getElementById("dt13").innerHTML =day3+ " "+dt3.getDate();
            		 document.getElementById("dt14").innerHTML =day2+" "+dt2.getDate();
            		 document.getElementById("dt15").innerHTML =day1+" "+dt0.getDate();
            		//alert(new Date(ev.date));
            		$(this).datepicker('hide');
            	  });
            	  
            	});
             
       </script>
       
       <script type="text/javascript">
$(document).ready(function()
			{
					 $('#dp1').datepicker().on('changeDate', function(ev)
					 {
	  		   			$('#nextbtn').click(function()
	 	 						  {
	 		  				 			//alert("NExt btn pressed");
	 		  				 			/* var nextdt=new Date(ev.date);
	 		  				 			alert("value for next"+nextdt); */
	 		  				 			
	 		  				 	 			 var dt0=new Date(ev.date);
	 		             		  
	 		             		  //var dt1=new Date(ev.date);
	 		             		   //alert(dt1); 
	 		             		   var dt1=new Date(dt0.setDate(dt0.getDate()+1));
	 		             		 var dt2=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt3=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt4=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt5=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt6=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt7=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt8=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt9=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt10=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt11=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt12=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt13=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt14=new Date(dt1.setDate(dt1.getDate()+1));
	 		             		 var dt15=new Date(dt1.setDate(dt1.getDate()+1));
	 		             			 
	 		             		 var weekday = [];
	 		             		 weekday[0]=  "Sun";
	 		             		 weekday[1] = "Mon";
	 		             		 weekday[2] = "Tue";
	 		             		 weekday[3] = "Wed";
	 		             		 weekday[4] = "Th";
	 		             		 weekday[5] = "Fri";
	 		             		 weekday[6] = "Sat";
	 		             		 
	 		             		 var day1 = weekday[dt15.getDay()];
	 		             	     var day2 = weekday[dt14.getDay()];
	 		             		 var day3 = weekday[dt13.getDay()];
	 		             		 var day4 = weekday[dt12.getDay()];
	 		             		 var day5 = weekday[dt11.getDay()];
	 		             		 var day6 = weekday[dt10.getDay()];
	 		             		 var day7 = weekday[dt9.getDay()];
	 		             		 var day8 = weekday[dt8.getDay()];
	 		             		 var day9 = weekday[dt7.getDay()];
	 		             		 var day10 = weekday[dt6.getDay()];
	 		             		 var day11 = weekday[dt5.getDay()];
	 		             		 var day12 = weekday[dt4.getDay()];
	 		             		 var day13 = weekday[dt3.getDay()];
	 		             		 var day14 = weekday[dt2.getDay()];
	 		             		 var day15 = weekday[dt1.getDay()];
	 		             		 
	 		             		 document.getElementById("dt15").innerHTML =day1+" "+dt15.getDate();
	 		             		 document.getElementById("dt14").innerHTML =day2+" "+dt14.getDate();
	 		             		 document.getElementById("dt13").innerHTML =day3+" "+dt13.getDate();
	 		             		 document.getElementById("dt12").innerHTML =day4+" "+dt12.getDate();
	 		             		 document.getElementById("dt11").innerHTML =day5+" "+dt11.getDate();
	 		             		 document.getElementById("dt10").innerHTML =day6+" "+dt10.getDate();
	 		             		 document.getElementById("dt9").innerHTML =day7+" "+dt9.getDate();
	 		             		 document.getElementById("dt8").innerHTML =day8+" "+dt8.getDate();
	 		             		 document.getElementById("dt7").innerHTML =day9+" "+dt7.getDate();
	 		             		 document.getElementById("dt6").innerHTML =day10+" "+dt6.getDate();
	 		             		 document.getElementById("dt5").innerHTML =day11+" "+dt5.getDate();
	 		             		 document.getElementById("dt4").innerHTML =day12+" "+dt4.getDate();
	 		             		 document.getElementById("dt3").innerHTML =day13+" "+dt3.getDate();
	 		             		 document.getElementById("dt2").innerHTML =day14+" "+dt2.getDate();
	 		             		 document.getElementById("dt1").innerHTML =day15+" "+dt0.getDate();
	 		             		$('#dp1').datepicker('setValue',dt15).datepicker('update'); 	
	 		             		 $(this).datepicker('hide');
	            		 				
	            	  				});
	  		   		
				});
			});
  
 </script>
 
 
<script type="text/javascript">
$(document).ready(function()
			{
					 $('#dp1').datepicker().on('changeDate', function(ev)
					 {
	  		   			$('#pre').click(function()
	 	 						  {
	 		  				 			//alert("Previous buttonn pressed");
	 		  				 			/* var nextdt=new Date(ev.date);
	 		  				 			alert("value for next"+nextdt); */
	 		  				 			
	 		  				 	  var dt0=new Date(ev.date);
	 		             		  
	 		             		  //var dt1=new Date(ev.date);
	 		             		   //alert(dt1); 
	 		             		   	var dt1=new Date(dt0.setDate(dt0.getDate()-1));
	 		             			 var dt2=new Date(dt1.setDate(dt1.getDate()-1));
	 		             			 var dt3=new Date(dt1.setDate(dt1.getDate()-1));
	 		             			 var dt4=new Date(dt1.setDate(dt1.getDate()-1));
	 		             			 var dt5=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt6=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt7=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt8=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt9=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt10=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt11=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt12=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt13=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt14=new Date(dt1.setDate(dt1.getDate()-1));
	 		             		 var dt15=new Date(dt1.setDate(dt1.getDate()-1));
	 		             			 
	 		             		 var weekday = [];
	 		             		 weekday[0]=  "Sun";
	 		             		 weekday[1] = "Mon";
	 		             		 weekday[2] = "Tue";
	 		             		 weekday[3] = "Wed";
	 		             		 weekday[4] = "Th";
	 		             		 weekday[5] = "Fri";
	 		             		 weekday[6] = "Sat";
	 		             		 
	 		             		 var day1 = weekday[dt15.getDay()];
	 		             		 var day2 = weekday[dt14.getDay()];
	 		             		 var day3 = weekday[dt13.getDay()];
	 		             		 var day4 = weekday[dt12.getDay()];
	 		             		 var day5 = weekday[dt11.getDay()];
	 		             		 var day6 = weekday[dt10.getDay()];
	 		             		 var day7 = weekday[dt9.getDay()];
	 		             		 var day8 = weekday[dt8.getDay()];
	 		             		 var day9 = weekday[dt7.getDay()];
	 		             		 var day10 = weekday[dt6.getDay()];
	 		             		 var day11 = weekday[dt5.getDay()];
	 		             		 var day12 = weekday[dt4.getDay()];
	 		             		 var day13 = weekday[dt3.getDay()];
	 		             		 var day14 = weekday[dt2.getDay()];
	 		             		 var day15 = weekday[dt1.getDay()];
	 		      
	 		             		 document.getElementById("dt15").innerHTML =day15+" "+dt0.getDate();
	 		             		 document.getElementById("dt14").innerHTML = day14+" "+dt2.getDate();
	 		             		 document.getElementById("dt13").innerHTML =day13+" "+dt3.getDate();
	 		             		 document.getElementById("dt12").innerHTML =day12+" "+dt4.getDate();
	 		             		 document.getElementById("dt11").innerHTML =day11+" "+dt5.getDate();
	 		             		 document.getElementById("dt10").innerHTML =day10+" "+dt6.getDate();
	 		             		 document.getElementById("dt9").innerHTML =day9+" "+dt7.getDate();
	 		             		 document.getElementById("dt8").innerHTML =day8+" "+dt8.getDate();
	 		             		 document.getElementById("dt7").innerHTML =day7+" "+dt9.getDate();
	 		             		 document.getElementById("dt6").innerHTML =day6+" "+dt10.getDate();
	 		             		 document.getElementById("dt5").innerHTML =day5+" "+dt11.getDate();
	 		             		 document.getElementById("dt4").innerHTML =day4+" "+dt12.getDate();
	 		             		 document.getElementById("dt3").innerHTML =day3+" "+dt13.getDate();
	 		             		 document.getElementById("dt2").innerHTML =day2+" "+dt14.getDate();
	 		             		 document.getElementById("dt1").innerHTML =day1+" "+dt15.getDate();
	 		             		$('#dp1').datepicker('setValue',dt15).datepicker('update');
	 		             	    $(this).datepicker('hide');
	            		 				
	            	  				});
	  		   		
				});
			});
  
 </script>
 
<script type="text/javascript">
	var i=2;
	var j=1;
	
	function addRow() {
			
	
		var tbl = document.getElementById('tableID');
		var lastRow = tbl.rows.length; //changed last row to static
		//alert("add lastRow:"+lastRow);
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		//alert("Length="+length);
		j=length+1;
		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "journalDetails["+length+"].txtSrNo";
         inputSrNo.id = "journalDetails["+length+"].txtSrNo";/* "txtSrNo" + i; */    
         //inputSrNo.value=j;	
         inputSrNo.style.width='150px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="left";
        	 //  inputSrNo.onblur=function(){getId(this.id);};
         firstCell.appendChild(inputSrNo);
	
         var secondCell = row.insertCell(1);
         var inputAccountName= document.createElement("input");
         inputAccountName.type = "text";
         inputAccountName.style.width='25px';
         inputAccountName.name = "journalDetails["+length+"].txtAccountName";
         inputAccountName.id = "journalDetails["+length+"].txtAccountName";  
        // inputAccountName.className="form-control";
         inputAccountName.style.textAlign="right";
         inputAccountName.onblur=function(){sum(this.id);};
               // inputAccountName.onblur=function(){getId(this.id);}
         secondCell.appendChild(inputAccountName);
         
        //alert("After Name Length="+length);
        var thirdCell = row.insertCell(2);
 		var inputType = document.createElement("input");
 		inputType.type = "text";
 		inputType.style.width='25px';
 		inputType.id ="journalDetails["+length+"].txtType";
 		inputType.name = "journalDetails["+length+"].txtType";
 		//var newLength=length-1;
 		inputType.onblur=function(){sum(this.id);};
 		/* inputType.onblur=function(){sumvirtical();};  */
 		//var ln = document.getElementById("journalDetails["+newLength+"].txtType").length;
 		//inputType.className = "form-control";
 		thirdCell.appendChild(inputType);
         
		var fourthCell = row.insertCell(3);
		var inputAmount = document.createElement("input");
		inputAmount.type = 'text';
		inputAmount.style.width='25px';
		inputAmount.id = "journalDetails["+length+"].txtAmount";
		inputAmount.name ="journalDetails["+length+"].txtAmount";
		//inputAmount.className="form-control";
		inputAmount.style.textAlign="right";
		inputAmount.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		fourthCell.appendChild(inputAmount);
		
		
		// my work
		
		var fifthCell = row.insertCell(4);
		var inputtxtfour = document.createElement("input");
		inputtxtfour.type = 'text';
		inputtxtfour.style.width='25px';
		inputtxtfour.id = "journalDetails["+length+"].txtfour";
		inputtxtfour.name ="journalDetails["+length+"].txtfour";
		//inputtxtfour.className="form-control";
		inputtxtfour.style.textAlign="right";
		inputtxtfour.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		fifthCell.appendChild(inputtxtfour);

		
		var sixCell = row.insertCell(5);
		var inputtxtfive = document.createElement("input");
		inputtxtfive.type = 'text';
		inputtxtfive.style.width='25px';
		inputtxtfive.id = "journalDetails["+length+"].txtfive";
		inputtxtfive.name ="journalDetails["+length+"].txtfive";
		//inputtxtfive.className="form-control";
		inputtxtfive.style.textAlign="right";
		inputtxtfive.onblur=function(){sum(this.id);};
			//inputtxtfour.onblur=function(){sumvirtical4();};
		//inputAmount.onblur=function(){getId(this.id);}
		sixCell.appendChild(inputtxtfive);

		
		var sevenCell = row.insertCell(6);
		var inputtxtsix = document.createElement("input");
		inputtxtsix.type = 'text';
		inputtxtsix.style.width='25px';
		inputtxtsix.id = "journalDetails["+length+"].txtsix";
		inputtxtsix.name ="journalDetails["+length+"].txtsix";
		//inputtxtsix.className="form-control";
		inputtxtsix.style.textAlign="right";
		inputtxtsix.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		sevenCell.appendChild(inputtxtsix);
		
		
		var eightCell = row.insertCell(7);
		var inputtxtseven = document.createElement("input");
		inputtxtseven.type = 'text';
		inputtxtseven.style.width='25px';
		inputtxtseven.id = "journalDetails["+length+"].txtseven";
		inputtxtseven.name ="journalDetails["+length+"].txtseven";
		//inputtxtseven.className="form-control";
		inputtxtseven.style.textAlign="right";
		inputtxtseven.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		eightCell.appendChild(inputtxtseven);
		

		
		var nineCell = row.insertCell(8);
		var inputtxteight = document.createElement("input");
		inputtxteight.type = 'text';
		inputtxteight.style.width='25px';
		inputtxteight.id = "journalDetails["+length+"].txteight";
		inputtxteight.name ="journalDetails["+length+"].txteight";
		//inputtxteight.className="form-control";
		inputtxteight.style.textAlign="right";
		inputtxteight.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		nineCell.appendChild(inputtxteight);
		
		var tenCell = row.insertCell(9);
		var inputtxtnine = document.createElement("input");
		inputtxtnine.type = 'text';
		inputtxtnine.style.width='25px';
		inputtxtnine.id = "journalDetails["+length+"].txtnine";
		inputtxtnine.name ="journalDetails["+length+"].txtnine";
		//inputtxtnine.className="form-control";
		inputtxtnine.style.textAlign="right";
		inputtxtnine.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		tenCell.appendChild(inputtxtnine);
	
		
		
		var elevenCell = row.insertCell(10);
		var inputtxtten = document.createElement("input");
		inputtxtten.type = 'text';
		inputtxtten.style.width='25px';
		inputtxtten.id = "journalDetails["+length+"].txtten";
		inputtxtten.name ="journalDetails["+length+"].txtten";
		//inputtxtten.className="form-control";
		inputtxtten.style.textAlign="right";
		inputtxtten.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		elevenCell.appendChild(inputtxtten);
	
	
		var twelveCell = row.insertCell(11);
		var inputtxteleven = document.createElement("input");
		inputtxteleven.type = 'text';
		inputtxteleven.style.width='25px';
		inputtxteleven.id = "journalDetails["+length+"].txteleven";
		inputtxteleven.name ="journalDetails["+length+"].txteleven";
		//inputtxteleven.className="form-control";
		inputtxteleven.style.textAlign="right";
		inputtxteleven.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		twelveCell.appendChild(inputtxteleven);
	
		var thirteenCell = row.insertCell(12);
		var inputtxttwelve = document.createElement("input");
		inputtxttwelve.type = 'text';
		inputtxttwelve.style.width='25px';
		inputtxttwelve.id = "journalDetails["+length+"].txttwelve";
		inputtxttwelve.name ="journalDetails["+length+"].txttwelve";
		//inputtxttwelve.className="form-control";
		inputtxttwelve.style.textAlign="right";
		inputtxttwelve.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		thirteenCell.appendChild(inputtxttwelve);
		
		
		var fouteenCell = row.insertCell(13);
		var inputtxtthirteen = document.createElement("input");
		inputtxtthirteen.type = 'text';
		inputtxtthirteen.style.width='25px';
		inputtxtthirteen.id = "journalDetails["+length+"].txtthirteen";
		inputtxtthirteen.name ="journalDetails["+length+"].txtthirteen";
		//inputtxtthirteen.className="form-control";
		inputtxtthirteen.style.textAlign="right";
		inputtxtthirteen.onblur=function(){sum(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		fouteenCell.appendChild(inputtxtthirteen);
	
		
		var fifteenCell = row.insertCell(14);
		var inputtxtfourteen = document.createElement("input");
		inputtxtfourteen.type = 'text';
		inputtxtfourteen.style.width='25px';
		inputtxtfourteen.id = "journalDetails["+length+"].txtfourteen";
		inputtxtfourteen.name ="journalDetails["+length+"].txtfourteen";
		//inputtxtfourteen.className="form-control";
		inputtxtfourteen.style.textAlign="right";
		inputtxtfourteen.onblur=function(){sum(this.id);};
			//inputAmount.onblur=function(){getId(this.id);}
		fifteenCell.appendChild(inputtxtfourteen);
	
		
		
		var sixteenCell = row.insertCell(15);
		var inputtxtfifteen = document.createElement("input");
		inputtxtfifteen.type = 'text';
		inputtxtfifteen.style.width='25px';
		inputtxtfifteen.id = "journalDetails["+length+"].txtfifteen";
		inputtxtfifteen.name ="journalDetails["+length+"].txtfifteen";
		//inputtxtfifteen.className="form-control";
		inputtxtfifteen.style.textAlign="right";
		inputtxtfifteen.onblur=function(){sum(this.id);};
			//inputAmount.onblur=function(){getId(this.id);}
		sixteenCell.appendChild(inputtxtfifteen);
		
		var seventeenCell = row.insertCell(16);
		var inputtxtsixteen = document.createElement("input");
		inputtxtsixteen.type = 'text';
		inputtxtsixteen.style.width='50px';
		inputtxtsixteen.style.backgroundColor =" ";
		//inputtxtsixteen.style.color = "#FFFFFF";
		inputtxtsixteen.id = "journalDetails["+length+"].txtsixteen";
		inputtxtsixteen.name ="journalDetails["+length+"].txtsixteen";
		//inputtxtsixteen.className="form-control";
		inputtxtsixteen.style.textAlign="left";
		inputtxtsixteen.onblur=function(){sum(this.id);};
		inputtxtsixteen.style.readonly="true";
		//inputAmount.onblur=function(){getId(this.id);}
		seventeenCell.appendChild(inputtxtsixteen);
		
	
		var eighteenCell = row.insertCell(17);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" + length;
		inputDelete.name = "btndel" + length;
		inputDelete.value="-";	
		inputDelete.className="btn btn-primary";	
		inputDelete.onclick=function(){delrow(this);};
		eighteenCell.appendChild(inputDelete);
		
		
		
	}
	
	
	function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
		  var last =(tbl.rows.length)-1;		/*  var last=(tbl.rows.length); */
		 //alert("Last="+last);
		 var txtSrNo,AccountName,Type,Amount,btndel,next;		
		 if(last ==1)
			 {
			 AccountName = document.getElementById("journalDetails["+length+"].txtAccountName");
			 Type = document.getElementById("journalDetails["+length+"].txtType");
			 Amount = document.getElementById("journalDetails["+length+"].txtAmount");	
			 txtfour = document.getElementById("journalDetails["+length+"].txtfour");
			 txtfive = document.getElementById("journalDetails["+length+"].txtfive");
			 txtsix = document.getElementById("journalDetails["+length+"].txtsix");
			 txtseven = document.getElementById("journalDetails["+length+"].txtseven");
			 txteight = document.getElementById("journalDetails["+length+"].txteight");
			 txtnine = document.getElementById("journalDetails["+length+"].txtnine");
			 txtten = document.getElementById("journalDetails["+length+"].txtten");
			 txteleven = document.getElementById("journalDetails["+length+"].txteleven");
			 txttwelve = document.getElementById("journalDetails["+length+"].txttwelve");
			 txtthirteen = document.getElementById("journalDetails["+length+"].txtthirteen");
			 txtfourteen = document.getElementById("journalDetails["+length+"].txtfourteen");
			 txtfifteen = document.getElementById("journalDetails["+length+"].txtfifteen");
			 
			 AccountName.value = '';
			 Type.value = ""; 
			 Amount.value = "";
			 txtfour.value="";
			 txtfive.value="";
			 txtsix.value="";
			 txtseven.value="";	
			 txteight.value="";
			 txtnine.value="";
			 txtten.value="";
			 txteleven.value="";
			 txttwelve.value="";
			 txtthirteen.value="";
			 txtfourteen.value="";
			 txtfifteen.value="";
			 
			 }		 
		 else
		 {
			 var current = window.event.srcElement;				 
		
			 while ( (current = current.parentElement)  && current.tagName !="TR");
      		 current.parentElement.removeChild(current);
        
     		  j--;      		
			 var counter = obj.id.slice(6);
			//alert("Counter"+counter);
			 while(counter<last)
				 {
				 	next = counter;
				 	next++;
			 	
				 	txtSrNo = document.getElementById( "journalDetails["+next+"].txtSrNo");
				 	txtSrNo.id =  "journalDetails["+counter+"].txtSrNo";
				 	txtSrNo.name = "journalDetails["+counter+"].txtSrNo";	 			 				 	 				 
				 	//txtSrNo.value =(txtSrNo.value)-1 ;
			
				 	
				 	txtAccountName = document.getElementById("journalDetails["+next+"].txtAccountName");
				 	txtAccountName.id =  "journalDetails["+counter+"].txtAccountName";
				 	txtAccountName.name = "journalDetails["+counter+"].txtAccountName"; 			 	
				 	
				 	//alert("Afte Account name=");
				 	
				 	var type = document.getElementById("journalDetails["+next+"].txtType");
				 	type.id =  "journalDetails["+counter+"].txtType";
				 	type.name = "journalDetails["+counter+"].txtType"; 		 	
				 	
				 	//alert("Afte Account type=");
				 	
				 	txtAmount = document.getElementById("journalDetails["+next+"].txtAmount");
				 	txtAmount.id = "journalDetails["+counter+"].txtAmount";
				 	txtAmount.name = "journalDetails["+counter+"].txtAmount";
				  	
				 	
				 	txtfour = document.getElementById("journalDetails["+next+"].txtfour");
				 	txtfour.id = "journalDetails["+counter+"].txtfour";
				 	txtfour.name = "journalDetails["+counter+"].txtfour";
				 	
				 	
				 	txtfive = document.getElementById("journalDetails["+next+"].txtfive");
				 	txtfive.id = "journalDetails["+counter+"].txtfive";
				 	txtfive.name = "journalDetails["+counter+"].txtfive";
				 
				 	
				 	txtsix = document.getElementById("journalDetails["+next+"].txtsix");
				 	txtsix.id = "journalDetails["+counter+"].txtsix";
				 	txtsix.name = "journalDetails["+counter+"].txtsix";
				 
				 	
				 	txtseven = document.getElementById("journalDetails["+next+"].txtseven");
				 	txtseven.id = "journalDetails["+counter+"].txtseven";
				 	txtseven.name = "journalDetails["+counter+"].txtseven";
				 
				 	txteight = document.getElementById("journalDetails["+next+"].txteight");
				 	txteight.id = "journalDetails["+counter+"].txteight";
				 	txteight.name = "journalDetails["+counter+"].txteight";
				 	
				 	
				 	txtnine = document.getElementById("journalDetails["+next+"].txtnine");
				 	txtnine.id = "journalDetails["+counter+"].txtnine";
				 	txtnine.name = "journalDetails["+counter+"].txtnine";
				 
				 	txtten = document.getElementById("journalDetails["+next+"].txtten");
				 	txtten.id = "journalDetails["+counter+"].txtten";
				 	txtten.name = "journalDetails["+counter+"].txtten";
				 
				 	
				 	txteleven = document.getElementById("journalDetails["+next+"].txteleven");
				 	txteleven.id = "journalDetails["+counter+"].txteleven";
				 	txteleven.name = "journalDetails["+counter+"].txteleven";
					
				 	
				 	txttwelve = document.getElementById("journalDetails["+next+"].txttwelve");
				 	txttwelve.id = "journalDetails["+counter+"].txttwelve";
				 	txttwelve.name = "journalDetails["+counter+"].txttwelve";
						
				 	
				 	txtthirteen = document.getElementById("journalDetails["+next+"].txtthirteen");
				 	txtthirteen.id = "journalDetails["+counter+"].txtthirteen";
				 	txtthirteen.name = "journalDetails["+counter+"].txtthirteen";
				 
				 	
				 	txtfourteen = document.getElementById("journalDetails["+next+"].txtfourteen");
				 	txtfourteen.id = "journalDetails["+counter+"].txtfourteen";
				 	txtfourteen.name = "journalDetails["+counter+"].txtfourteen";
				 
				 	
				 	txtfifteen = document.getElementById("journalDetails["+next+"].txtfifteen");
				 	txtfifteen.id = "journalDetails["+counter+"].txtfifteen";
				 	txtfifteen.name = "journalDetails["+counter+"].txtfifteen";
				 	
				 	txtsixteen = document.getElementById("journalDetails["+next+"].txtsixteen");
				 	txtsixteen.id = "journalDetails["+counter+"].txtsixteen";
				 	txtsixteen.name = "journalDetails["+counter+"].txtsixteen";
				 
				 	//alert("Afte Account amount=");
				 	
				 	btndel = document.getElementById("btndel"+next);
				 	//alert("Afte Account button="+btndel.id);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
	 			 	
	 			 	//alert("Afte Account button id="+btndel.id);
	 			 	
					counter++;
						//	alert("Counter="+counter); 	
			 
			 }
		 }
		 
        
	 } 
	function getId(id)
	{
		alert("Id="+id);
	}
	 
	 function sum(obj) 
	 {
		 var id = document.getElementById(obj).id;	
		 var index1 = id.indexOf("[")+1;	
		 var index2 = id.indexOf("]");	
		 var sr = id.slice(index1,index2);

		// var tbl = document.getElementById('tableID');
		// var length=(tbl.rows.length)-2;
		
		 var length=sr;
		// alert("hi"+length);
		 var txtFirstNumberValue= document.getElementById("journalDetails["+length+"].txtAccountName").value;
		  	 var txtSecondNumberValue = document.getElementById("journalDetails["+length+"].txtType").value;
		  	 var txtthird= document.getElementById("journalDetails["+length+"].txtAmount").value;
		  	 var txtfourth = document.getElementById("journalDetails["+length+"].txtfour").value;
		 	 var txtFifth = document.getElementById("journalDetails["+length+"].txtfive").value;
		 	 var txtSix = document.getElementById("journalDetails["+length+"].txtsix").value;		  
		 	var txtseven = document.getElementById("journalDetails["+length+"].txtseven").value;
		     var txteight = document.getElementById("journalDetails["+length+"].txteight").value;		  
		 	var txtnine = document.getElementById("journalDetails["+length+"].txtnine").value;
		  	 var txtten = document.getElementById("journalDetails["+length+"].txtten").value;		  
		  	 var txteleven = document.getElementById("journalDetails["+length+"].txteleven").value;
		  	 var txttwelve = document.getElementById("journalDetails["+length+"].txttwelve").value;		  
		  	var txtthirteen = document.getElementById("journalDetails["+length+"].txtthirteen").value;
		    var txtfourteen = document.getElementById("journalDetails["+length+"].txtfourteen").value;
			var txtfifteen = document.getElementById("journalDetails["+length+"].txtfifteen").value;		  
		  	
		    	 if (txtFirstNumberValue == "") txtFirstNumberValue = 0;
		    	if (txtSecondNumberValue == "") txtSecondNumberValue = 0;
		    	if (txtthird == "") txtthird = 0;
		    	if (txtfourth == "") txtfourth = 0;			   
		    	if (txtFifth == "") txtFifth = 0;
		    	 if ( txtSix== "")  txtSix = 0;
		    	  if (txtseven == "") txtseven = 0;
		    	  if (txteight == "") txteight = 0;			   
		    	  if (txtnine == "") txtnine = 0;
		    	if (txtten == "") txtten = 0;
		    	  if (txteleven == "") txteleven = 0;
		    	  if (txttwelve == "") txttwelve = 0;		    	
		    	  if (txtthirteen == "") txtthirteen = 0;
		    	 if (txtfourteen == "") txtfourteen  = 0;
		    	if (txtfifteen == "") txtfifteen = 0;  
		    
			    var result = parseInt(txtFirstNumberValue) + parseInt(txtSecondNumberValue)+parseInt(txtthird)+ parseInt(txtfourth)+parseInt(txtFifth)+ parseInt(txtSix)+parseInt(txtseven) + parseInt(txteight)+parseInt(txtnine)+ parseInt(txtten)+parseInt(txteleven)+ parseInt(txttwelve)+parseInt(txtthirteen)+ parseInt(txtfourteen)+parseInt(txtfifteen);
				//alert("result="+result);
	 		document.getElementById("journalDetails["+length+"].txtsixteen").value = result;
		    	
				//}
	
	 }
	 
	 function backs()
	 {
		window.history.back();
	 }
		 
	 
	
</script>

<script>
	$(document).ready(function() {
		$('#dataTables-example1').dataTable();
		$('#dataTables-example2').dataTable();
		$('#dataTables-example3').dataTable();
		$('#dataTables-example4').dataTable();
		$('#dataTables-example5').dataTable();

	});
</script>

<SCRIPT language=Javascript>
 function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode;
          if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
             return false;
        return true;
       }

 function AllowCharacters(e)
 {
     var keycode;
     if (window.event) keycode = window.event.keyCode;
     else if (event) keycode = event.keyCode;
     else if (e) keycode = e.which;
     else return true;

     
     if((keycode >= 65 && kecode <= 90) || (keycode >= 97 && keycode <= 122))
     {
         return true;
     }
    else
    {
        return false;
      }

  return false;   
}

 function validateEmail(sEmail) {
	  var reEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

	  if(!sEmail.match(reEmail)) {
	    alert("Invalid email address");
	    return false;
	  }

	  return true;

	}
 function ValidateForm(form){
	 ErrorText= "";
	 if ( ( form.userrole[0].checked == false ) && ( form.userrole[1].checked == false )&& form.userrole[2].checked==false 
		 && ( form.userrole[3].checked == false )&& form.userrole[4].checked==false )
	 {
	 alert ( "Please choose any one user role" ); 
	 return false;
	 }
	 if (ErrorText= "") { form.submit()}
	 }

 </SCRIPT>





<script src="<c:url value="../js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="../js/bootstrap.js"/>"></script>
</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
			<input type="hidden" id="text1">
			<%@include file="innerHeader.jsp"%>
			

				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i
											class="fa fa-2x fa-table"></i></small>&nbsp;Time Sheet</li>
								</ul>
							</div>
							<div class="col-md-2">
							<button name="back" class="btn btn-primary btn-large" onclick="backs();"><i class="fa fa-reply"></i> Back</button>	
        					 </div>
						</div>
					</div>
				</div>
				<br>
				<form:form action="managetime.do" cssClass="form-inline"
				modelAttribute="timemanage" name="frmJournalEntry"
				onsubmit="return validateForm()">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-5">
									<!-- <label> Employee Name:</label> -->
								</div>
								<div class="col-md-5">
									<label> Date</label> <input type="button" id="pre" value="<<"><input name=" "type="text" id="dp1"/><input type="button" value=">>" id="nextbtn">
								 	
								</div>						
								<br> <br> <br> <br>
								<div class="table-responsive"> 
									<table class="table  table-bordered " id="tableID">
										<thead>
											<tr>
												<th style="width: 20px;" bgcolor="cream">Employee Name</th>
												<th style="width: 20px;" bgcolor="cream"><label id="dt1" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt2" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt3" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt4" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt5" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt6" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt7" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt8" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt9" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt10" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt11" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt12" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt13" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt14" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;"  bgcolor="cream"><label id="dt15" style="font: bold 12px courier !important;"></label></th>
												<th style="width: 20px;" bgcolor="cream">Total</th>

											</tr>
										
										</thead>
										<tbody>
											<%
												int cnt = 0;
											%>
											<c:forEach items="${empList}" var="empList">
												<tr>
													<td><script>
													/* alert(document.getElementById("journalDetails[0].txtSrNo").value);
													var ch=document.getElementById("journalDetails[0].txtSrNo").value;
													var charat=ch.charAt(0);
													alert("Character="+charat);
													var ind=ch.indexOf("charat");
													//ind=ind+1;
													alert("Index="+ind); */
													//var cnt=0;
												</script> <input class="form-control"
														name="journalDetails[<%=cnt%>].txtSrNo"
														id="journalDetails[<%=cnt%>].txtSrNo"
														value="${empList.txtfname} ${empList.txtmname} ${empList.txtlname}"
														style="width: 150px; text-align: right;"></input></td>

													<td>
														<!-- <input class="form-control" name="journalDetails[0].txtAccountName" id="journalDetails[0].txtAccountName"style="text-align: right;"></input> -->


														<input name="journalDetails[<%=cnt%>].txtAccountName"id="journalDetails[<%=cnt%>].txtAccountName"style="width: 25px;" onblur="sum(this.id)">

													</td>
													<td><input name="txtType"
														id="journalDetails[<%=cnt%>].txtType" style="width: 25px;"
														onblur="sum(this.id)">
													<td><input name="journalDetails[<%=cnt%>].txtAmount"
														id="journalDetails[<%=cnt%>].txtAmount"
														style="width: 25px;" onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtfour"
														id="journalDetails[<%=cnt%>].txtfour" style="width: 25px;"
														onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtfive"
														id="journalDetails[<%=cnt%>].txtfive" style="width: 25px;"
														onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtsix"
														id="journalDetails[<%=cnt%>].txtsix" style="width: 25px;"
														onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtseven"
														id="journalDetails[<%=cnt%>].txtseven"
														style="width: 25px;" onblur="sum(this.id)"
														></input></td>
													<td><input name="journalDetails[<%=cnt%>].txteight"
														id="journalDetails[<%=cnt%>].txteight"
														style="width: 25px;" onblur="sum(this.id)"
														></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtnine"
														id="journalDetails[<%=cnt%>].txtnine" style="width: 25px;"
														onblur="sum(this.id)" ></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtten"
														id="journalDetails[<%=cnt%>].txtten" style="width: 25px;"
														onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txteleven"
														id="journalDetails[<%=cnt%>].txteleven"
														style="width: 25px;" onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txttwelve"
														id="journalDetails[<%=cnt%>].txttwelve"
														style="width: 25px;" onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtthirteen"
														id="journalDetails[<%=cnt%>].txtthirteen"
														style="width: 25px;" onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtfourteen"
														id="journalDetails[<%=cnt%>].txtfourteen"
														style="width: 25px;" onblur="sum(this.id)"></input></td>
													<td><input name="journalDetails[<%=cnt%>].txtfifteen"
														id="journalDetails[<%=cnt%>].txtfifteen"
														style="width: 25px;" onblur="sum(this.id)"></input></td>
													<td bgcolor="cream"><input name="journalDetails[<%=cnt%>].txtsixteen" id="journalDetails[<%=cnt%>].txtsixteen"style="width: 50px;"></input></td>
													<td><input type="button" value="-" name="btndel0"
														id="btndel0" class="btn btn-primary"
														onclick="delrow(this)"></td>
												</tr>
												<%
													cnt++;
												%>
											</c:forEach>
										</tbody>
									</table>
									<div class="btn-group">
										<table class="table table-striped table-bordered table-hover"
											style="width: 70%;">
											<tr>
												<td><input type="button" name="btnadd1" id="btnadd1"
													value="+ Add Row" onclick="addRow()" class="btn btn-primary">
													&nbsp;&nbsp;&nbsp;</td>
											</tr>
										</table>
									</div>
									<div class="page-header"></div>

									<br>

									<div class="row">
										<div class="col-lg-3"></div>
										<div align="center">
											<button id="submit" name="btn" value="Save"
												class="btn btn-primary">Save</button>
											<button id="reset" name="btn" value="Cancel"
												class="btn btn-primary">Cancel</button>
										</div>
									</div>
								
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>

		</div>
	</div>
	 <script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>