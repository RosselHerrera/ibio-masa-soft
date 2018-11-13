<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOInstituciones" %>
<%@ page import = "cl.energiainteligente.dto.DTOProdStock" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
int ididoopp; 
String	nombreoopp = ""; 
int  codopp = 0;  
String sector = "";
String vigencia = "";
String filler = "";

int precioLista = 0;
int stkQ = 0;

try{ 

	/* --------------------------------------------------- */
	MantenedorConvenios producto = new MantenedorConvenios();
	/* --------------------------------------------------- */
	/* ----- obtiene correlativo  VENTAS ---- */
	String param = " eistktipodoc='VENTA'";
   	int id = producto.identidad("eistkmovfechacv", param);
   	/* ----------------------------------------- */
   	if (id==0) { 
   		id = 5000;
   	}else{
   		id = id + 5001;
   	} 
   	/* ----------------------------------------- */
   	%>
    	<!-- /*   contact Area   */ -->
    	<%@ include file="../../convenios/inc/header.inc"%>
		<div class="container">
			<div class="row d-flex justify-content-center">
					<div class="menu-content pb-20 col-lg-8">
						<div class="title text-center">
							<h3 class="text">BOLETA N° <font color="#ff0000"><%=" "+id%></font></h3>
							<h5 class="mb-10">R.U.T. 78.000.102-K </h5>
							<p>GIRO Secado y Venta de Leña	DIRECCION Planta Las Lumas Lote 1. Km 13, Ruta Internacional Puyehue, km 1,5 a Mulpulmo COMUNA Osorno, "LAS LUMAS",  Aportamos valor al ecosistema.</p> 
							<!-- <div class="col-lg-8 form-group"> -->
								<div class="form-select" id="default-select"> 
									<select id="institucion" name="institucion" onchange="fcambia()" required="">
										<option value="Asociado">SELECCIONE CONVENIO INSTITUCION</option>
									<% 
									/* --------------------------------------------------- */
									MantenedorConvenios productocodigo = new MantenedorConvenios();
									/* --------------------------------------------------- */
									ArrayList ListaInstituciones = productocodigo.ListaInstituciones();
									Iterator it = ListaInstituciones.iterator();   
									/* IF */
									if (it.hasNext()) { 
										while (it.hasNext()){
											/* ----------------------------------------------- */
											DTOInstituciones obj = (DTOInstituciones) it.next();
											/* ----------------------------------------------- */
											ididoopp = obj.getIdidoopp();
											nombreoopp = obj.getNombreoopp();	
											codopp = obj.getCodopp();
											sector = obj.getSector();
											vigencia = obj.getVigencia();
											filler = obj.getFiller();										
										%>				 
										<option value='<%= codopp + " " + sector %>'><%= nombreoopp%></option>
										<%	
										} 
									}
									%>		
									</select>
								</div>	
							<!-- </div> -->	
							<br>
							<h1><font color="#5F04B4"><p id="muestra">TOTAL CLP</p></font></h1>
							<!-- Start container ----------------------- -->
							<div class="container"> 
							<!-- Start container ----------------------- -->
						<!-- Linea Base  -->
							
								<!-- tabla numerico -->
								<div class="progress-table-wrap" id="tabla">
									<div class="progress-table">	
										<!-- 
										<div class="table-head">
													
											<div class="visit">&nbsp;</div>
											<div class="country">&nbsp;</div>
											<div class="serial">&nbsp;</div>
											<div class="visit">&nbsp;</div>
											<div class="country">&nbsp;</div>
											
										</div>
									 	 -->
										<div class="table-row">
											<div class="col-lg-2 form-group">  
												<input type="button" onclick="fdiv(10);" class="genric-btn primary circle form-control"  id="codprod" name="codprod" value="LGXM3">
											</div>
											<div class="col-lg-5 form-group">
												<input type="text" class="common-input mb-1 form-control" id="descripcion" name="descripcion" placeholder="Descripcion Producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Descripcion Producto'" disabled >
											</div>
											<div class="col-lg-1 form-group">
												<input type="text" class="common-input mb-1 form-control" id="qty" name="qty" placeholder="Q de producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Q de producto' " disabled value=0>
											</div>
											<div class="col-lg-2 form-group">
												<input type="text" class="common-input mb-1 form-control" id="vta" name="vta" disabled value=0>
											</div>
										</div>
										
										<div class="table-row">
											<div class="col-lg-2 form-group">  
												<input type="button" onclick="fdiv(20);" class="genric-btn primary circle form-control" id="codprods15" name="codprods15" value="S15KiL">
											</div>
											<div class="col-lg-5 form-group">
												<input type="text" class="common-input mb-1 form-control" id="descripcion15" name="descripcion15" placeholder="Descripcion Producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Descripcion Producto'" disabled >
											</div>
											<div class="col-lg-1 form-group">
												<input type="text" class="common-input mb-1 form-control" id="qty15" name="qty15" placeholder="Q de producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Q de producto'" disabled value=0>
											</div>
											<div class="col-lg-2 form-group">
												<input type="text" class="common-input mb-1 form-control" id="vta15" name="vta15" disabled value=0>
											</div>
										</div>
										
										<div class="table-row">
											<div class="col-lg-2 form-group">  
												<input type="button" onclick="fdiv(30);" class="genric-btn primary circle form-control" id="codprods20" name="codprods20" value="S20KiL">
											</div>
											<div class="col-lg-5 form-group">
												<input type="text" class="common-input mb-1 form-control" id="descripcion20" name="descripcion20" placeholder="Descripcion Producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Descripcion Producto'" disabled >
											</div>
											<div class="col-lg-1 form-group">
												<input type="text" class="common-input mb-1 form-control" id="qty20" name="qty20" placeholder="Q de producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Q de producto'" disabled value=0>
											</div>
											<div class="col-lg-2 form-group">
												<input type="text" class="common-input mb-1 form-control" id="vta20" name="vta20" disabled value=0>
											</div>	
										</div>
										
										<div class="table-row">
											<div class="col-lg-2 form-group"> 
												<input type=button onclick="fdiv(40);" class="genric-btn primary circle form-control" id="codprods25" name="codprods25" value="S25KiL">
											</div>
											<div class="col-lg-5 form-group"> 
												<input type="text" class="common-input mb-1 form-control" id="descripcion25" name="descripcion25" placeholder="Descripcion Producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Descripcion Producto'" disabled >
											</div>
											<div class="col-lg-1 form-group">
												<input type="text" class="common-input mb-1 form-control" id="qty25" name="qty25" placeholder="Q de producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Q de producto'" disabled value=0>
											</div>
											<div class="col-lg-2 form-group">
												<input type="text" class="common-input mb-1 form-control" id="vta25" name="vta25" disabled value=0>
											</div>
											
										</div>
										<!-- Medios de Pago y Convenios -->
										<div class="table-row">
											<!-- <div class="col-lg-1 form-group" onclick="fdiv(100);">
												<img src="../../cafe/img/mpefectivo.jpg" alt="flag">
											</div> -->
											<!-- <div class="col-lg-1 form-group" onclick="fdiv(200);">
												<img src="../../cafe/img/mpredcompra.jpg" alt="flag">
											</div> -->
											<div class="col-lg-1 form-group" onclick="fdiv(300);">
												<img src="../../cafe/img/mpvisa.jpg" alt="flag">
											</div>
											<div class="col-lg-1 form-group" onclick="fdiv(400);">
												<img src="../../cafe/img/mpmaster.jpg" alt="flag">
											</div>
											<div class="col-lg-4 form-group" id="pay" style='display:none;'>
												<input type="button" onclick="fdiv(777);" class="genric-btn success circle form-control" id="pago" name="pago" value='PAGO CONVENIO iLENIA'>
											</div>
											<div class="col-lg-4 form-group">
												<input type="button" onclick="fdiv(333);" class="genric-btn warning circle form-control" id="minus" name="minus" value='*RESET*'>
											</div>
										</div>										
									</div>	
								</div>
								<!-- tabla numerico -->
						  <br>
						  <br>
						  <br>
						  
						  <form action="recibeparamBoleta.jsp" id="submitjsp" name="submitjsp" method="post">
						  		
						  		<input type="hidden" class="common-input mb-1"  id="numboleta" name="numboleta" value='<%=id%>'>
						  		<input type="hidden" class="common-input mb-1"  id="ncodopp" name="ncodopp" value='<%=nombreoopp%>'>
						  		
						  		<input type="hidden" class="common-input mb-1" id="hinst" name="hinst">		  		
						  		<input type="hidden" class="common-input mb-1" id="hvta" name="hvta" >
						  		<input type="hidden" class="common-input mb-1"  id="hvta15" name="hvta15" >
						  		<input type="hidden" class="common-input mb-1"  id="hvta20" name="hvta20" >
						  		<input type="hidden" class="common-input mb-1"  id="hvta25" name="hvta25" >
	
						  		<input type="submit" class="genric-btn primary circle"  id="submitj" name="submitj" disabled value="ENVIA A PROCESO CONTABLE DIARIO BOLETAS">

						  </form>	
						  <br><br><br><br>
						<!-- Linea Base   -->
						<script>
						
							function fdiv(n){
								
								if (n==10) {
									/* alert(n); */
									document.getElementById("pay").style.display = 'block';
									document.getElementById("descripcion").value = "Lena a granel por metro cubico";
									var cont = document.getElementById("qty").value;
									
									var i = parseInt(cont);
									var precio = 36000;
																		
									if (i==0){
										document.getElementById("qty").value=1;
										document.getElementById("vta").value = parseInt(precio);
										i = i + 1;
									}else if(i==1){
										document.getElementById("qty").value=parseInt(2);
										document.getElementById("vta").value = parseInt(precio)*parseInt(2);
										i = i + 1;
									}else if(i==2){
										document.getElementById("qty").value=parseInt(3);
										document.getElementById("vta").value = parseInt(precio)*parseInt(3);
										i = i + 1;
									}else if(i==3){
										document.getElementById("qty").value=parseInt(4);
										document.getElementById("vta").value = parseInt(precio)*parseInt(4);
										i = i + 1;
									}else if(i==4){
										document.getElementById("qty").value=parseInt(5);
										document.getElementById("vta").value = parseInt(precio)*parseInt(5);
									}	
	
								} else if (n==20) {
									/* alert(n); */ 	
									document.getElementById("pay").style.display = 'block';
									document.getElementById("descripcion15").value ="Sacos 15 kg iLenia (8-9 astillas aprox.)";
									var cont = document.getElementById("qty15").value;
									var i = parseInt(cont);
									var precio = 2100;
	
									if (i==0){
										document.getElementById("qty15").value=1;
										document.getElementById("vta15").value = parseInt(precio);
										i = i + 1;
									}else if(i==1){
										document.getElementById("qty15").value=parseInt(2);
										document.getElementById("vta15").value = parseInt(precio)*parseInt(2);
										i = i + 1;
									}else if(i==2){
										document.getElementById("qty15").value=parseInt(3);
										document.getElementById("vta15").value = parseInt(precio)*parseInt(3);
										i = i + 1;
									}else if(i==3){
										document.getElementById("qty15").value=parseInt(4);
										document.getElementById("vta15").value = parseInt(precio)*parseInt(4);
										i = i + 1;
									}else if(i==4){
										document.getElementById("qty15").value=parseInt(5);
										document.getElementById("vta15").value = parseInt(precio)*parseInt(5);
									} 
									
								}else if (n==30) {
									/* alert(n); */ 
									document.getElementById("pay").style.display = 'block';
									document.getElementById("descripcion20").value ="Sacos 20 kg iLenia (12-13 astillas aprox.)";
									var cont = document.getElementById("qty20").value;
									var i = parseInt(cont);
									var precio = 2600; 
									
									if (i==0){
										document.getElementById("qty20").value=1;
										document.getElementById("vta20").value = parseInt(precio);
										i = i + 1;
									} else if(i==1){
										document.getElementById("qty20").value=parseInt(2);
										document.getElementById("vta20").value = parseInt(precio)*parseInt(2);
										i = i + 1;
									} else if(i==2){
										document.getElementById("qty20").value=parseInt(3);
										document.getElementById("vta20").value = parseInt(precio)*parseInt(3);
										i = i + 1;
									} else if(i==3){
										document.getElementById("qty20").value=parseInt(4);
										document.getElementById("vta20").value = parseInt(precio)*parseInt(4);
										i = i + 1;
									} else if(i==4){
										document.getElementById("qty20").value=parseInt(5);
										document.getElementById("vta20").value = parseInt(precio)*parseInt(5);
									} 
									
								}else if (n==40) {
									/* alert(n); */ 		
									document.getElementById("pay").style.display = 'block';
									document.getElementById("descripcion25").value ="Sacos 25 kg iLenia(15-16 astillas aprox.)";
									var cont = document.getElementById("qty25").value;
									var i = parseInt(cont);
									var precio = 3100; 
									
									if (i==0){
										document.getElementById("qty25").value=1;
										document.getElementById("vta25").value = parseInt(precio);
										i = i + 1;
									} else if(i==1){
										document.getElementById("qty25").value=parseInt(2);
										document.getElementById("vta25").value = parseInt(precio)*parseInt(2);
										i = i + 1;
									} else if(i==2){
										document.getElementById("qty25").value=parseInt(3);
										document.getElementById("vta25").value = parseInt(precio)*parseInt(3);
										i = i + 1;
									} else if(i==3){
										document.getElementById("qty25").value=parseInt(4);
										document.getElementById("vta25").value = parseInt(precio)*parseInt(4);
										i = i + 1;
									} else if(i==4){
										document.getElementById("qty25").value=parseInt(5);
										document.getElementById("vta25").value = parseInt(precio)*parseInt(5);
									}  
									
								} else if (n==333) {
									location.reload();
								} else if (n==200) {
								 /* alert(Pago con VISA); */ 
								} else if (n==300) {
								 alert("Pago con VISA"); 
								} else if (n==400) {
								alert("Pago con MASTER");
								} else if (n==777) {
									
									document.getElementById("submitj").disabled = false;
									
									var institucion = document.getElementById("institucion").value;
									document.getElementById("hinst").value = institucion;
																				
									var lg = parseInt(document.getElementById("vta").value);
									var lg15 = parseInt(document.getElementById("vta15").value);
									var lg20 = parseInt(document.getElementById("vta20").value);
									var lg25 = parseInt(document.getElementById("vta25").value);
									var sumaCLP = (parseInt(lg)+parseInt(lg15)+parseInt(lg20)+parseInt(lg25));
									
									document.getElementById("muestra").innerHTML = formatNumber(sumaCLP);
									
									document.getElementById("vta").value = formatNumber(lg);
									document.getElementById("vta15").value = formatNumber(lg15);
									document.getElementById("vta20").value = formatNumber(lg20);
									document.getElementById("vta25").value = formatNumber(lg25);
															
									document.getElementById("hvta").value = lg;
									document.getElementById("hvta15").value = lg15;
									document.getElementById("hvta20").value = lg20;
									document.getElementById("hvta25").value = lg25;
									
								    document.getElementById("pago").disabled=true; 
									
									document.getElementById("codprod").disabled=true;
									document.getElementById("codprods15").disabled=true;
									document.getElementById("codprods20").disabled=true;
									document.getElementById("codprods25").disabled=true; 
									
									document.getElementById("tabla").style.display = "none";
									
								}
							}
							
							function formatNumber(num) {
							   num += '';
							   var splitStr = num.split('.');
							   var splitLeft = splitStr[0];
							   var splitRight = splitStr.length > 1 ? '.' + splitStr[1] : '';
							   var regx = /(\d+)(\d{3})/;
							   while (regx.test(splitLeft)) {
							      splitLeft = splitLeft.replace(regx, '$1' + '.' + '$2');
							   }
							   return splitLeft + splitRight + ' CLP' ;
							}	
							
							function pasarVariables(pagina, nombres) {
								  pagina +="?";
								  nomVec = nombres.split(",");
								  for (i=0; i<nomVec.length; i++)
								    pagina += nomVec[i] + "=" + escape(eval(nomVec[i]))+"&";
								  pagina = pagina.substring(0,pagina.length-1);
								  location.href=pagina;
								}
							
							function fcambia(){	
								var cambio = document.getElementById("institucion").value
								
							}
						</script>
						<!--  end container  --------------------------->
						</div>
					<!--  end container  --------------------------->
					</div>
				</div>
			</div>
		</div>
	<!--end contact Area -->
	<script src="../../cafe/js/validarRUT.js"></script>
	<%@ include file="../../convenios/inc/foot.inc"%>						

<%}catch(Exception e) { 
  	 	e.printStackTrace(); 
  	} 		    
%>
						