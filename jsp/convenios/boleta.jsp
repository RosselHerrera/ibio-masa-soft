<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOInstituciones" %>
<%@ page import = "cl.energiainteligente.dto.DTOProdStock" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd : HH:MM:ss").format(new Date());

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
   	<%@ include file="../../convenios/inc/headerB.inc"%>
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content pb-20 col-lg-5">
				<div class="title text-center">
					<h3 class="text">BOLETA N° <font color="#ff0000"><%=" "+id%></font></h3>
					<h5 class="mb-10">R.U.T. 78.000.102-K </h5>
					<p>GIRO Secado y Venta de Leña	DIRECCION Planta Las Lumas Lote 1. Km 13, Ruta Internacional Puyehue, km 1,5 a Mulpulmo COMUNA Osorno, "LAS LUMAS",  Aportamos valor al ecosistema.</p> 
					<!-- <div class="col-lg-8 form-group"> -->
						<div class="form-select" id="default-select">
							<select id="institucion" name="institucion" onchange="fcambia()">
								<option value="CLIENTE HTTP">SELECCIONE CONVENIO INSTITUCION</option>
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
						<div class="container a"> 
						<!-- Start container ----------------------- -->
						
						<!-- Linea Base 06.10.2018 -->	
							<!-- tabla numerico -->
							<div class="progress-table-wrap" id="tabla" style='display:none;'>
								<div class="progress-table">
								
									<div class="table-row">
										<div class="serial">TOT.</div>
										<div></div>
										<div></div>
										<div class="percentage">
										   <input type="text" class="common-input mb-1 form-control form-control" id="lblboletaventa" name="lblboletaventa"placeholder="TOTAL VENTA :" onfocus="this.placeholder = ''" onblur="this.placeholder = 'TOTAL VENTA :'" value=0>
										</div>
									</div>
									
									<div class="table-row">
										<div class="serial">CLP:</div>
										<div>&nbsp;</div>
										<div>&nbsp;</div>
										<div class="percentage">
											<input type="text" class="common-input mb-1 form-control" id="boletaventa" name="boletaventa" placeholder="0" onfocus="this.placeholder = ''" onblur="this.placeholder = '0'" value="">
										</div>
									</div>
									<!-- teclado numerico -->
									<div class="table-row">
										<div class="serial">
											<input type="button" onclick="fcapnum(1);"  id="01" name="01" class="genric-btn primary-border circle arrow" value=1>
										</div>
										<div class="serial">
											<input type="button" onclick="fcapnum(2);"  id="02" name="02" class="genric-btn primary-border circle arrow" value=2>
										</div>
										<div class="serial">
											<input type="button" onclick="fcapnum(3);"  id="03" name="03" class="genric-btn primary-border circle arrow" value=3>
										</div>
										<div class="serial">
											<input type="button" onclick="fcapnum(100);" id="mas" name="mas" class="genric-btn primary circle arrow" value=+CLP>
										</div>	
									</div>
									
									<div class="table-row">
										<div class="serial">
											<input type="button" onclick="fcapnum(4);"  id="04" name="04" class="genric-btn primary-border circle arrow" value=4>
										 </div>
										<div class="serial">
											<input type="button" onclick="fcapnum(5);"  id="05" name="05"  class="genric-btn primary-border circle arrow" value=5>
										</div>
										<div class="serial">
											<input type="button" onclick="fcapnum(6);"  id="06" name="06"  class="genric-btn primary-border circle arrow" value=6>
										</div>
										<div class="serial">
											<input type="button"  onclick="fcapnum(103);" class="genric-btn danger circle arrow" value=-CLP>
										</div>
									</div>
									
									<div class="table-row"> 
										<div class="serial">	
											<input type="button" onclick="fcapnum(7);"  id="07" name="07"  class="genric-btn primary-border circle arrow" value=7>
										</div>
										<div class="serial">
											<input type="button" onclick="fcapnum(8);"  id="08" name="08"  class="genric-btn primary-border circle arrow" value=8>
										</div>
										<div class="serial">
											<input type="button" onclick="fcapnum(9);"  id="09" name="09"  class="genric-btn primary-border circle arrow" value=9>
										</div>
										<div class="serial">
											<input type="button" class="genric-btn warning circle arrow" value=%IVA>
										</div>
									</div>
									
									<div class="table-row">
										<div class="serial">
											<input type="button" class="genric-btn primary-border circle arrow" value=*>
										 </div>
										<div class="serial">
											<input type="button" onclick="fcapnum(0);"  id="00" name="00"  class="genric-btn primary-border circle arrow" value=0>
										</div>
										<div class="serial">
											<input type="button" class="genric-btn primary-border circle arrow" value=#>
										</div>
										<div class="serial" id="pago" style='display:none;'>
											<input type="button" onclick="fcapnum(200);" id="T" name="T" class="genric-btn success circle arrow" value=PAGAR>
										</div>
									</div>
									
									<div class="table-row">
										<div class="serial"></div>
										<div class="percentage" id="nva">
											<input type="button" onclick="fcapnum(404);" id="reset" name="reset" class="genric-btn success circle arrow" value="Registra Nueva Venta">
										 </div>
									</div>
									<!-- teclado numerico -->
								</div>
							</div>	
							<div>
								&nbsp;
							</div>
							<!-- tosubmit -->
							<div class="table-row" id="fsubmit" style='display:none;'>
								<form action="recibeBoleta.jsp" id="submitjsp" name="submitjsp"  method="post">	 
									
									<input type="hidden" id="sId" name="sId" value='<%=id%>' >
									<input type="hidden" id="sInstitucion" name="sInstitucion">
									<input type="hidden" id="sNeto" name="sNeto">
									<input type="hidden" id="sIva" name="sIva">
									<input type="hidden" id="sTotal" name="sTotal">
								
									<input type="submit" class="genric-btn primary circle"  id="submitj" name="submitj" value="ENVIA A PROCESO CONTABLE DIARIO BOLETAS">
								
								</form>
							</div>
							<!-- tabla numerico -->
						<!-- Linea Base 06.10.2018  -->
					</div>
					<!--  end container a --------------------------->
					
				<!--  end container  --------------------------->
				</div>
			</div>
		</div>
	</div>
	<!--end contact Area -->
	<!-- JS 06.10.2018  -->
	<script>
		function fcambia(){	
			  var selectBox = document.getElementById("institucion");
			  var selectedValue = selectBox.options[selectBox.selectedIndex].value; 
		      document.getElementById("sInstitucion").value = selectedValue;
		      document.getElementById("tabla").style.display = 'block';
		}
		function fcapnum(n){
			if (n<100){
				document.getElementById("pago").style.display = 'block';
			}
			
			if (n==200){
				var div = document.getElementById("pago");
				div.style.display = "none";
				
				var div = document.getElementById("tabla");
				div.style.display = "none";
				
				document.getElementById("fsubmit").style.display = 'block';
				
				var acum = parseInt(document.getElementById("lblboletaventa").value);
				var empty = document.getElementById("boletaventa").value;
				if (empty==""){ 
			 	   document.getElementById("boletaventa").value=0; 
			 	}
				var total =  parseInt(acum) + parseInt(document.getElementById("boletaventa").value);
										
				document.getElementById("muestra").innerHTML = formatNumber(total);
				document.getElementById("lblboletaventa").value = formatNumber(total);
				document.getElementById("boletaventa").value="";
				document.getElementById("boletaventa").disabled=true;
				document.getElementById("lblboletaventa").disabled=true;
				
				var Institucion = document.getElementById("institucion").value;
				document.getElementById("sInstitucion").value = Institucion;
				
				var iva = total*19/100;
				document.getElementById("sNeto").value = parseInt(total) - parseInt(iva);
				
				document.getElementById("sIva").value = parseInt(iva);
				var total = parseInt(total); 
				document.getElementById("sTotal").value = parseInt(total);
			
			} else if (n==100) {
				
				var empty = document.getElementById("boletaventa").value;
				if (empty==""){ 
			 	   var total =  parseInt(document.getElementById("lblboletaventa").value); 
			 	}else{ 	
			 	   var totalacum = parseInt(document.getElementById("boletaventa").value);
			 	   var total = parseInt(document.getElementById("lblboletaventa").value);
			 	   
			 	   document.getElementById("lblboletaventa").value = parseInt(total) + parseInt(totalacum);
			 	   document.getElementById("boletaventa").value="";
				   
			 	}
			} else if (n==404) {
				location.reload();
			} else if (n==103) {
				document.getElementById("boletaventa").value="";
			}
				
			var num = "0"+ n;
			var bol = document.getElementById("boletaventa").value;
			document.getElementById("boletaventa").value = bol + document.getElementById(num).value;
			
			function formatNumber(num) {
			   num += '';
			   var splitStr = num.split('.');    
			   var splitLeft = splitStr[0];
			   var splitRight = splitStr.length > 1 ? '.' + splitStr[1] : '';
			   var regx = /(\d+)(\d{3})/;
			   while (regx.test(splitLeft)) {
			      splitLeft = splitLeft.replace(regx, '$1' + '.' + '$2');
			   }
			   return splitLeft + splitRight + ' CLP';
			} 
		}
	</script>
	<!-- JS   -->
	<%@ include file="../../convenios/inc/foot.inc"%>						

<%}catch(Exception e) { 
  	 	e.printStackTrace(); 
  	} 		    
%>
