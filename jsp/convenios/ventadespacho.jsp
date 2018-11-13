<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%-- <%@ page import = "cl.energiainteligente.trazabilidad.TrazabilidadProducto" %> --%>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOconvenios" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd : HH:MM:ss").format(new Date());
/* convenios */
int iconvenios = 0;
String irut = "";
String irazonsocial = "";
String iemail = "";
String ifono = "";
String ifechavigencia = "";
String imensaje = "";

/* ----------------------------------------- */
%>
	<%@ include file="../../convenios/inc/header.inc"%>
	<script>
		window.addEventListener("load", function() {
			vtaForm.numdoc.addEventListener("keypress", soloNumeros, false); 
			/* vtaForm.precio.addEventListener("keypress", soloNumeros, false); */
			/* vtaForm.qty.addEventListener("keypress", soloNumeros, false);
			vtaForm.qty1.addEventListener("keypress", soloNumeros, false);
			vtaForm.qty2.addEventListener("keypress", soloNumeros, false); */
			/* 
			codForm.humedad.addEventListener("keypress", soloNumeros, false);
			codForm.distancia.addEventListener("keypress", soloNumeros, false); 
			*/
		});
		
		//Solo permite introducir numeros.
		function soloNumeros(e){
		  var key = window.event ? e.which : e.keyCode;
		  if (key < 48 || key > 57) {
		    e.preventDefault();
		  }
		}
		
		function changeFunc() {
		    var selectBox = document.getElementById("rutconvenio");
		    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
		    document.getElementById("nombreproveedor").value = selectedValue;
		    document.getElementById("button").style.display = "none";
		    /* alert(selectedValue); */ 
		   }
	</script>
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content pb-10 col-lg-12">
				<div class="title text-center">
					<h3 class="mb-1">Venta Convenios</h3> 
					<h5><%=" iLeniaSoft : " + fecha%></h5>
					<p>Te ayudamos con tu ecosistema tecnológico.</p>
					<!--  ****************************************  -->
					<form class="form-area " id="vtaForm" name="vtaForm" action="registramovVta.jsp" method="post" class="contact-form text-right">
						<!-- Linea Base  -->
						<div class="row">
							<div class="col-lg-3 form-group">
								<input type="text" class="common-input mb-1 form-control" id="lblcliente" name="lblcliente" disabled value="RUT CLIENTE o CONVENIO ILENIA">
							</div>
							<div class="col-lg-5 form-group">
								<select id="rutconvenio" name="rutconvenio" onchange="changeFunc();">
									<option value="RUT">Seleccione RUT</option>
								<% 
								/* --------------------------------------------------- */
								MantenedorConvenios productocodigo = new MantenedorConvenios();
								/* --------------------------------------------------- */
								ArrayList ListaConvenios = productocodigo.ListaConvenios();
								Iterator it = ListaConvenios.iterator();   
								/* IF */
								if (it.hasNext()) { 
									while (it.hasNext()){
										/* ----------------------------------------------- */
										DTOconvenios obj = (DTOconvenios) it.next();
										/* ----------------------------------------------- */
										iconvenios = obj.getIdeiconvenios();
										irut = obj.getEirut();	
										irazonsocial = obj.getEirazonsocial();
										iemail = obj.getEiemail();
										ifono = obj.getEifono();
										ifechavigencia = obj.getEifechavigencia();
										imensaje = obj.getEimensaje();										
									%>				 
									<option value='<%= irut %>'><%= irut+" : "+irazonsocial%></option>
									<%	
									} 
								}
								%>
								</select>
								<!-- 
								<div id="button">								
									<a href="../../convenios/convenio.html" class="genric-btn success-border circle arrow">Nuevo Cliente iLenia<span class="lnr lnr-arrow-right"></span></a>
								</div> 
								-->
							</div>
							
							<div class="col-lg-2 form-group">
								<div class="form-select" id="default-select" > 
									<select id="documento" name="documento" >
										<option value="VENTA">FACTURA N° :</option>
										<option value="GUIADESP">GUIA DESPACHO N°</option>
									</select>
								</div>
							</div>
							
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="numdoc" name="numdoc" placeholder="999999" onfocus="this.placeholder = ''" onblur="this.placeholder = '999999'" required="">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3 form-group">
								<input type="text" class="common-input mb-1 form-control" id="lblnombreproveedor" name="lblnombreproveedor" disabled value="NOMBRE o RAZON SOCIAL">
							</div>
							<div class="col-lg-9 form-group">
								<input type="text" class="common-input mb-1 form-control" id="nombreproveedor" name="nombreproveedor" placeholder="Nombre Proveedor" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nombre Proveedor'" required="">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-12 form-group">
								<textarea class="common-textarea mt-1 form-control" id="observaciones" name="observaciones" placeholder="Notas a la Venta" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Notas a la Venta'" required=""></textarea>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="lblcodProducto_" name="lblcodProducto_" disabled value="S15KiL">
								<input type="hidden" class="common-input mb-1 form-control" id="lblcodProducto" name="lblcodProducto" value="S15KiL">
							</div>
							<div class="col-lg-4 form-group">
								<input type="text" class="common-input mb-1 form-control" id="descripcion" name="descripcion" placeholder="Descripcion" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Descripcion'" required="" value='Sacos 15 kg iLenia (8-9 astillas aprox.) | $ ' >
							</div>
							<div class="col-lg-2 form-group">	
								<input type="text" class="common-input mb-1 form-control" id="precio" name="precio" placeholder="Valor Producto CLP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Valor Producto CLP'" required=""  value=2457 >
							</div>
							<div class="col-lg-1 form-group" id="qtydiv">
								<select id="qty" name="qty" onchange="fcambia()" >
									<option value=0>0</option>
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
									<option value=6>6</option>
									<option value=7>7</option>
									<option value=8>8</option>
									<option value=9>9</option>
									<option value=10>10</option>
									<option value=11>11</option>
									<option value=12>12</option>
									<option value=13>13</option>
									<option value=14>14</option>
									<option value=15>15</option>
								</select>
								
								<script>
									function fcambia(){	
										var P = document.getElementById("precio").value;
										var Q = document.getElementById("qty").value;
										var VN = document.getElementById("valorneto").value;
										var sumaVN = parseInt(VN) + parseInt(P*Q);
										document.getElementById("valorneto").value = sumaVN;
										var vIVA = document.getElementById("porcentaje").value;
										var IVA = 20;
										IVA = Math.round(parseInt(IVA)*parseInt(sumaVN)/100);
										document.getElementById("porcentaje").value = IVA; 
										var Total = parseInt(sumaVN) + parseInt(IVA);
										document.getElementById("valortotal").value = Total;
										var ctd = parseInt(Q);
										document.getElementById("qtydiv").style.display = "none";
										document.getElementById("qty0").value = ctd;
										document.getElementById("preciot").value = formatNumber(parseInt(P*Q));
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
									   return '$' + splitLeft + splitRight;
									}
								</script>
							</div>
							<div class="col-lg-1 form-group">
								<input type="text" class="common-input mb-1 form-control" id="qty0" name="qty0" placeholder="0" onfocus="this.placeholder = ''" disabled >
							</div>
							<div class="col-lg-2 form-group">	
								<input type="text" class="common-input mb-1 form-control" id="preciot" name="preciot" placeholder="Valor Productos CLP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Valor Productos CLP'" disabled >
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="lblcodProducto1_" name="lblcodProducto1_" disabled value="S20KiL">
							<input type="hidden" class="common-input mb-1 form-control" id="lblcodProducto1" name="lblcodProducto1" value="S20KiL">
							</div>
							<div class="col-lg-4 form-group">
								<input type="text" class="common-input mb-1 form-control" id="descripcion1" name="descripcion1" placeholder="Descripcion" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Descripcion'" required="" value='Sacos 20 kg iLenia (12-13 astillas aprox.) | $ ' >
							</div>
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="precio1" name="precio1" placeholder="Valor Producto CLP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Valor Producto CLP'" required="" value=3042>
							</div>
							<div class="col-lg-1 form-group" id="qtydiv1">
								<select id="qty1" name="qty1" onchange="fcambia1()" >
									<option value=0>0</option>
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
									<option value=6>6</option>
									<option value=7>7</option>
									<option value=8>8</option>
									<option value=9>9</option>
									<option value=10>10</option>
									<option value=11>11</option>
									<option value=12>12</option>
									<option value=13>13</option>
									<option value=14>14</option>
									<option value=15>15</option>
								</select>

								<script>
									function fcambia1(){
										 var P = document.getElementById("precio1").value;
										 var Q = document.getElementById("qty1").value;
										 var VN = document.getElementById("valorneto").value;
										 var sumaVN = parseInt(VN) + parseInt(P*Q);
										 document.getElementById("valorneto").value = sumaVN;	
										 var vIVA = document.getElementById("porcentaje").value;
										 var IVA = 20; 
										 IVA = Math.round(parseInt(IVA)*parseInt(sumaVN)/100);
										 document.getElementById("porcentaje").value = IVA; 
										 var Total = parseInt(sumaVN) + parseInt(IVA);
										 document.getElementById("valortotal").value = Total;
										 var ctd = parseInt(Q);
										 document.getElementById("qtydiv1").style.display = "none";
										 document.getElementById("qty2").value = ctd;
										 document.getElementById("preciot1").value = formatNumber(parseInt(P*Q));
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
										   return '$' + splitLeft + splitRight;
										} 
								</script>
							</div>
							<div class="col-lg-1 form-group">
								<input type="text" class="common-input mb-1 form-control" id="qty2" name="qty2" placeholder="0" onfocus="this.placeholder = ''" disabled >
							</div>
							<div class="col-lg-2 form-group">	
								<input type="text" class="common-input mb-1 form-control" id="preciot1" name="preciot1" placeholder="Valor Productos CLP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Valor Productos CLP'" disabled >
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="lblcodProducto_" name="lblcodProducto2_" disabled value="S25KiL">
								<input type="hidden" class="common-input mb-1 form-control" id="lblcodProducto2" name="lblcodProducto2" value="S25KiL">
							</div>
							<div class="col-lg-4 form-group">
								<input type="text" class="common-input mb-1 form-control" id="descripcion2" name="descripcion2" placeholder="Descripcion" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Descripcion'" required="" value='Sacos 25 kg iLenia(15-16 astillas aprox.) | $ ' >
							</div>
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="precio2" name="precio2" placeholder="Valor Producto CLP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Valor Producto CLP'" required="" value=3627>
							</div>
							
							<div class="col-lg-1 form-group" id="qtydiv2">
								<select id="qty3" name="qty3" onchange="fcambia2()" >
									<option value=0>0</option>
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
									<option value=6>6</option>
									<option value=7>7</option>
									<option value=8>8</option>
									<option value=9>9</option>
									<option value=10>10</option>
									<option value=11>11</option>
									<option value=12>12</option>
									<option value=13>13</option>
									<option value=14>14</option>
									<option value=15>15</option>
								</select>
								<script>
									function fcambia2(){
										 var P = document.getElementById("precio2").value;
										 var Q = document.getElementById("qty3").value;
										 var VN = document.getElementById("valorneto").value;
										 var sumaVN = parseInt(VN) + parseInt(P*Q);
										 document.getElementById("valorneto").value = sumaVN;	
										 var vIVA = document.getElementById("porcentaje").value;
										 var IVA = 20;
										 IVA = Math.round(parseInt(IVA)*parseInt(sumaVN)/100);
										 document.getElementById("porcentaje").value = IVA; 
										 var Total = parseInt(sumaVN) + parseInt(IVA);
										 document.getElementById("valortotal").value = Total;
										 var ctd = parseInt(Q);
										 document.getElementById("qtydiv2").style.display = "none";
										 document.getElementById("qty4").value = ctd;
										 document.getElementById("preciot2").value = formatNumber(parseInt(P*Q));
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
										   return '$' + splitLeft + splitRight;
										}
							 	</script>
							</div>
							
							<div class="col-lg-1 form-group">
								<input type="text" class="common-input mb-1 form-control" id="qty4" name="qty4" placeholder="0" onfocus="this.placeholder = ''" disabled >
							</div>
							<div class="col-lg-2 form-group">	
								<input type="text" class="common-input mb-1 form-control" id="preciot2" name="preciot2" placeholder="Valor Productos CLP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Valor Productos CLP'" disabled >
							</div>
							
						</div>
						
						<div class="row">
							<div class="col-lg-8 form-group">
								<input type="text" class="common-input mb-1 form-control" id="neto" name="neto" disabled value=" ">
							</div>
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="valorneto" name="valorneto" placeholder="Valor Neto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Valor Neto'" required="" value=0>
							</div>
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="ty" name="ty" placeholder=" " onfocus="this.placeholder = ''" onblur="this.placeholder = ' '"  disabled value="NETO">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-8 form-group">
								<input type="text" class="common-input mb-1 form-control" id="iva" name="iva" disabled value=" ">
							</div>
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="porcentaje" name="porcentaje" placeholder="20%" onfocus="this.placeholder = ''" onblur="this.placeholder = '20%'" required="" value=0>
							</div>
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="t" name="t" placeholder="Q" onfocus="this.placeholder = ''" onblur="this.placeholder = ' '"  disabled value="IVA">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-8 form-group">
								<input type="text" class="common-input mb-1 form-control" id="total" name="total" disabled value=" ">
							</div>
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="valortotal" name="valortotal" placeholder="Valor Total" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Valor Total'" required=""  value=0>
							</div> 
							<div class="col-lg-2 form-group">
								<input type="text" class="common-input mb-1 form-control" id="y" name="y" placeholder="T" onfocus="this.placeholder = ''" onblur="this.placeholder = 'T'"  disabled value="TOTAL">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-12 form-group">
								<button class="primary-btn mt-1">VALIDAR<span class="lnr lnr-arrow-right"></span></button>
								<div class="alert-msg">								
							</div>
						</div>	
						<!-- Linea Base  -->
					</form>
					<!--  ****************************************   -->
				</div>
			</div>
		</div>
	</div>
	<!--end contact Area -->
	<script src="../../convenios/js/validarRUT.js"></script>
	<%@ include file="../../convenios/inc/foot.inc"%>	
<%
%>
	