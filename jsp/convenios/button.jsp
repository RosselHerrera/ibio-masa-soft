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
    <%@ include file="../../convenios/inc/header.inc"%>
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-20 col-lg-5">
					<div class="title text-center">
						<h3 class="text">BOLETA N° <font color="#ff0000"><%=" "+id%></font></h3>
						<h5 class="mb-10">R.U.T. 78.000.102-K </h5>
						<p>GIRO Secado y Venta de Leña	DIRECCION Planta Las Lumas Lote 1. Km 13, Ruta Internacional Puyehue, km 1,5 a Mulpulmo COMUNA Osorno, "LAS LUMAS",  Aportamos valor al ecosistema.</p> 
						
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
						
						<br>
						<h1><font color="#5F04B4"><p id="muestra">TOTAL CLP</p></font></h1>
						<!-- Start container ----------------------- -->
						<div class="container"> 
						<!-- Start container ----------------------- -->
						<!-- Linea Base  -->
							<div class="progress-table-wrap" id="tabla">
								<div class="progress-table">
																											
									<div class="table-row">
										<div class="col-lg-6 form-group">  
											<input type="button" onclick="fdiv(10);" class="genric-btn primary circle form-control"  id="codprod" name="codprod" value="LGXM3 Leña a granel x M3 (encastillada)">
										</div>	
									</div>
										<!-- display:none -->
										<div class="col-lg-2 form-group" id="desc" style='display:none;'>
											<input type="text" class="common-input mb-1 form-control" id="descripcion" name="descripcion" placeholder="Descripcion Producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Descripcion Producto'" disabled >
										</div>
										<div class="col-lg-2 form-group" id="cant" style='display:none;'>
											<input type="text" class="common-input mb-1 form-control" id="qty" name="qty" placeholder="Q de producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Q de producto' " disabled value=0>
										</div>
										<div class="col-lg-2 form-group" id="precio" style='display:none;'>
											<input type="text" class="common-input mb-1 form-control" id="vta" name="vta" disabled value=0>
										</div>
										<!-- display:none -->
								</div>
							</div>			
						<!-- Linea Base   -->
					</div>
				</div>
			</div>	
		</div>
	<%@ include file="../../convenios/inc/foot.inc"%>						
	
	<script>
		function fdiv(n){
			
			if (n==10) {
				document.getElementById("descripcion").value = "Precio de convenio";
				var cont = document.getElementById("qty").value;
				var i = parseInt(cont);
				document.getElementById("qty").value=parseInt(i+1);
				var precio = 35000;
				document.getElementById("vta").value = parseInt(precio*(i+1));
				var CLP = document.getElementById("vta").value;
				document.getElementById("muestra").innerHTML = formatNumber(CLP);
				/* document.getElementById("vta").value = 0; */
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
		
		function fcambia(){	
			var cambio = document.getElementById("institucion").value
			/* alert(cambio); */
			/* document.getElementById("muestra").innerHTML = "CLP"; */
		}
	</script>
<%}catch(Exception e) { 
  	 	e.printStackTrace(); 
  	} 		    
%>