<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOconvenios" %>

<%
/* convenios */
int iconvenios = 0;
String irut = "";
String irazonsocial = "";
String iemail = "";
String ifono = "";
String ifechavigencia = "";
String imensaje = "";
/* ----------------------------------------- */
String search = "ConvenioiLenia.pdf";
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
String hora  = new SimpleDateFormat("HH:mm:ss").format(new Date());	
String comienzo ="00:00:00";

%>
<%@ include file="../../convenios/inc/header.inc"%>
<!-- 
<!DOCTYPE html>
<html lang="es" class="no-js">
<head>
	Mobile Specific Meta
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	Favicon
	<link rel="shortcut icon" href="../../convenios/img/favicon.png">
	Author Meta
	<meta name="author" content="RosselTech">
	Meta Description
	<meta name="description" content="">
	Meta Keyword
	<meta name="keywords" content="">
	meta character set
	<meta charset="UTF-8">
	Site Title
	<title>download PDF</title>
	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
		CSS =============================================
		<link rel="stylesheet" href="../../emprender/css/linearicons.css">
		<link rel="stylesheet" href="../../emprender/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../emprender/css/bootstrap.css">
		<link rel="stylesheet" href="../../emprender/css/magnific-popup.css">
		<link rel="stylesheet" href="../../emprender/css/animate.min.css">
		<link rel="stylesheet" href="../../emprender/css/owl.carousel.css">
		<link rel="stylesheet" href="../../emprender/css/main.css">
	</head>
	<body>
 -->		
		
		
		<!-- <section>	 -->
		<div class="container">	
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-10 col-lg-12">
					<div class="title text-center">
						<h3 class="mb-1">Convenio iLenia Temporada 2019</h3> 
						<h5><font color="#B0B0B0"><%=" iLeniaSoft : " + fecha%></font></h5>
						<p>Te ayudamos con tu ecosistema tecnológico.</p>
						<font color="#5F04B4"><%=search%></font></h5>
						<br>
						<div class="button-group-area mt-40">
						 	
						 	<%-- <h3 class="mb-30">&nbsp;&nbsp;&nbsp;
						 	 <font color="#5F04B4">Convenio iLenia</font>
						 	</h3>
							<h5>&nbsp;&nbsp;
							<font color="#5F04B4"><%=fecha%></font>&nbsp;&nbsp;&nbsp;
							<font color="#B0B0B0"><%=hora%> 
							<br>
							<!-- <img src="../../upload/renderTraceable.jpg" alt=""> --> 
							--%>
							<%-- <br><%=search%></font></h5> --%>
							<iframe src="http://docs.google.com/gview?url=http://rosseltech.cl/upload/<%=search%>&embedded=true" style="width:700px; height:700px;" frameborder="0"></iframe>
						</div>
						
						 <form action = "../../convenios/convenio.html" method = "post"
					         enctype = "multipart/form-data">
					         <!-- <input class="primary-btn mt-20" type="file" name ="file" size="50" />
					         <br /> -->
					         <!-- <button class="primary-btn mt-20"><span class="lnr lnr-arrow-right"></span></button> -->
					         <input class="primary-btn mt-20" type = "submit" value = "Registra Convenio" />
					      </form>
								
					</div>
				</div>
			</div>
		</div>	
		<!-- </section>	 -->		
	
		<script src="../../emprender/js/vendor/jquery-2.2.4.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
		<script src="../../emprender/js/vendor/bootstrap.min.js"></script>
		<script src="../../emprender/js/jquery.ajaxchimp.min.js"></script>
		<script src="../../emprender/js/jquery.magnific-popup.min.js"></script>	
		<script src="../../emprender/js/owl.carousel.min.js"></script>			
		<script src="../../emprender/js/jquery.sticky.js"></script>
		<script src="../../emprender/js/slick.js"></script>
		<script src="../../emprender/js/jquery.counterup.min.js"></script>
		<script src="../../emprender/js/waypoints.min.js"></script>		
		<script src="../../emprender/js/main.js"></script>
	
	<script src="../../convenios/js/validarRUT.js"></script>
	
	<%@ include file="../../convenios/inc/foot.inc"%>	
<%
%>	
	
	
	
	
	