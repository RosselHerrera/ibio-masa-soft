<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true"%>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOAcceso" %>
<%

String sarch = request.getParameter("arch");


String Fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
String Hora  = new SimpleDateFormat("HH:mm:ss").format(new Date());	
String Comienzo ="00:00:00";

String clave="", sclave="", fclave="";

sclave = request.getParameter("clave");
if (sclave==null) sclave ="";
/* ------------------ */
String[] values = null;
/* ------------------------------------------ */
NumberFormat fmt = new DecimalFormat("#,###");
/* ------------------------------------------ */
int currentRow = 0, retornoP = 0, retornoD = 0;
int i, j, k, l, m = 0, precio = 0;
	/* ------------------------------------------- */
	Enumeration eNames = request.getParameterNames();
	/* ------------------------------------------- */
	while (eNames.hasMoreElements() ){
		String name = (String) eNames.nextElement();
		values = request.getParameterValues(name);
		for(i = 0; i < values.length; i++){
			String value = values[i];	
			/* ------------------------------------------------------------------ */
			//out.println(currentRow + " - Name : " + name + " Valor : " + value);
			/* ------------------------------------------------------------------ */
			if (name.equals("pg00")) {
				clave = "0";
			}
			if (name.equals("pg01")) {
				clave = "1";
			}
			if (name.equals("pg02")) {
				clave = "2";
			}
			if (name.equals("pg03")) {
				clave = "3";
			}
			if (name.equals("pg04")) {
				clave = "4";
			}
			if (name.equals("pg05")) {
				clave = "5";
			}
			if (name.equals("pg06")) {
				clave = "6";
			}
			if (name.equals("pg07")) {
				clave = "7";
			}
			if (name.equals("pg08")) {
				clave = "8";
			}
			if (name.equals("pg09")) {
				clave = "9";
			}
			if (name.equals("pg0A")) {
				clave = "A";
			}
			if (name.equals("pg0G")) {
				clave = "G";
			}
			
		}   /* ------- end for param values*/
		currentRow++;
	}	/* --------- end while Enumeration*/
	
	if (sclave != ""){	
		sclave = sclave + "" + clave;
		if (sclave.length()>3) {
			//out.println(" Valor Clave Acceso: " + sclave);
			fclave = sclave;
			/* --------------------------------------------------- */
			/* MantenedorConvenios acceso = new MantenedorConvenios(); */
			/* --------------------------------------------------- */
			int iclave = Integer.parseInt(fclave);
			/* int Ret = acceso.accesoilenia(iclave); */
			
			
			/* ------------------------------------ */
			HttpSession sesion = request.getSession();
			/* ------------------------------------*/
			/* sesion.setAttribute("numregistro", IdMov);
			sesion.setAttribute("labnum", nummov);
			sesion.setAttribute("numdocmp", labnumdoc);
			sesion.setAttribute("unidades", Units);
	        sesion.setAttribute("movfecha", labfecha); */
	        sesion.setAttribute("IdSesion", sesion.getId());
	        /* ------------------------------------*/
			sclave = "";		
			//Acceso ProductosMeson.jsp - ../../emprender/movil/index.html
			response.sendRedirect("../../convenios/registrolaboratorio.html");
		}
	} else {
		sclave = clave;	
	}

%>
<!DOCTYPE html>
<html lang="es" class="no-js">
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="../../emprender/img/favicon.png">
	<!-- Author Meta -->
	<meta name="author" content="RosselTech">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Identidad</title>
	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
		<!-- CSS ============================================= -->
		<link rel="stylesheet" href="../../emprender/css/linearicons.css">
		<link rel="stylesheet" href="../../emprender/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../emprender/css/bootstrap.css">
		<link rel="stylesheet" href="../../emprender/css/magnific-popup.css">
		<link rel="stylesheet" href="../../emprender/css/animate.min.css">
		<link rel="stylesheet" href="../../emprender/css/owl.carousel.css">
		<link rel="stylesheet" href="../../emprender/css/main.css">
	</head>
	<body>
	
		<!-- start Area -->				
				<div class="container" align="center">				
					<div class="button-group-area mt-40">
					 	<h3 class="mb-30">&nbsp;&nbsp;&nbsp;
					 	 <!-- <font color="#5F04B4">Transformaci&oacute;n Digital</font> -->
					 	 <font color="#5F04B4">Identidad Digital iLenia</font>
					 	</h3>
						<h5>&nbsp;&nbsp;
						<h4><font color="#5F04B4">&nbsp;&nbsp;MUESTRAS LABORATORIO</font></h4>
						<font color="#5F04B4"><%=Fecha%></font>&nbsp;&nbsp;&nbsp;
						<font color="#FF0000"><%=Hora%></font></h5>
						<form id=fteclado name=fteclado action=# method=post> 	
							<table border="0">
								<tr>
									<td align="center" colspan="3">	
										<div class="mt-10">
											<%-- primary-btn mt-20 <input type=password id=acceso name=acceso maxlength="4" readonly="readonly" value='<%=sclave%>' /> --%>
											<button class="genric-btn primary-border circle"><%=sclave%><span class="lnr lnr-arrow-right"></span></button> 	
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<input id="pg01" name="pg01" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="1">
									</td>
									<td>
										<input id="pg02" name="pg02" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="2">	
									</td>
									<td>											
										<input id="pg03" name="pg03" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="3">
									</td>
								</tr>
								<tr>
									<td>											
										<input id="pg04" name="pg04" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="4">
									</td>
									<td>										
										<input id="pg05" name="pg05" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="5">
									</td>
									<td>
										<input id="pg06" name="pg06" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="6">
									</td>
								</tr>
								<tr>
									<td>
										<input id="pg07" name="pg07" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="7">
									</td>
									<td>											
										<input id="pg08" name="pg08" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="8">
									</td>
									<td>											
										<input id="pg09" name="pg09" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="9">
									</td>
								</tr>
								<tr>
									<td>											
										<input id="pg0A" name="pg0A" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value=".">
									</td>
									<td>											
										<input id="pg00" name="pg00" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="0">
									</td>
									<td>											
										<input id="pg0G" name="pg0G" class="genric-btn primary circle arrow" maxlength="5" size="30" type="submit" OnMouseOver="this.style.cursor='pointer'" value="#">
									</td>
								</tr>	
								<input type=hidden id=clave name=clave value=<%=sclave%>>
							</table>
						</form>	
						<br>
						<h5>&nbsp;&nbsp;
							<font color="#5F04B4">Bienvenido&nbsp;&nbsp;&nbsp;<%=Hora%></font></h5>
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
	</body>
</html>	