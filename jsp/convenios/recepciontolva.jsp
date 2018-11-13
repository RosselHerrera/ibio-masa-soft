<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOProdStock" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());


/* ----------------------------------------- */
%>
	<%@ include file="../../convenios/inc/header.inc"%>
	<script>
		window.addEventListener("load", function() {
			codForm.numdoc.addEventListener("keypress", soloNumeros, false); 
			codForm.oc.addEventListener("keypress", soloNumeros, false);
			codForm.qty.addEventListener("keypress", soloNumeros, false);
			codForm.humedad.addEventListener("keypress", soloNumeros, false);
			/* 
			codForm.valorprod.addEventListener("keypress", soloNumeros, false);
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
	</script>
	
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-10 col-lg-12">
					<div class="title text-center">
						<h3 class="mb-10">Ficha Recepci&oacute;n Leña</h3>
						<p>Te ayudamos con tu ecosistema tecnológico.</p>
						
						<form class="form-area " id="codForm" name="codForm" action="registrarecepciontolva.jsp" method="post" class="contact-form text-right">
							
							<!-- Linea Base  -->
							<div class="row">
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="lblnombreproveedor" name="lblnombreproveedor" disabled value="NOMBRE PROVEEDOR">
								</div>
								<div class="col-lg-9 form-group">
									<input type="text" class="common-input mb-1 form-control" id="nombreproveedor" name="nombreproveedor" placeholder="Nombre Proveedor" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nombre Proveedor'" required="">
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="lblrutproveedor" name="lblrutproveedor" disabled value="RUT PROVEEDOR">
								</div>
								
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="rutproveedor" name="rutproveedor" placeholder="RUT Proveedor 99999999-K" onfocus="this.placeholder = ''" onblur="this.placeholder = 'RUT Proveedor 99999999-K'" required="" oninput="checkRut(this)">
								</div>
								
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga03" name="carga03" disabled value="N° GUIA DESPACHO">
								</div>
								
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="numdoc" name="numdoc" placeholder="GUIA DESPACHO" onfocus="this.placeholder = ''" onblur="this.placeholder = 'GUIA DESPACHO'" required="">
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-2 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga05" name="carga05" disabled value="VEHICULO">
								</div>
								
								<div class="col-lg-4 form-group">
									<input type="text" class="common-input mb-1 form-control" id="vehiculo" name="vehiculo" placeholder="Patente Vehiculo" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patente Vehiculo'" required="">
								</div>
								
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga07" name="carga07" disabled value="CONDUCTOR">
								</div>
								
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="conductor" name="conductor" placeholder="Nombre conductor vehiculo" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nombre conductor vehiculo'" required="">
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-2 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga09" name="carga09" disabled value="CELULAR">
								</div>
								
								<div class="col-lg-4 form-group">
									<input type="text" class="common-input mb-1 form-control" id="celular" name="celular" placeholder="+569 99999999" onfocus="this.placeholder = ''" onblur="this.placeholder = '+569 99999999'" required="">
								</div>
								
								<div class="col-lg-2 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga11" name="carga11" disabled value="MAIL">
								</div>
								
								<div class="col-lg-4 form-group">
									<input type="text" class="common-input mb-1 form-control" id="email" name="email" placeholder="proveedor@mail.cl" onfocus="this.placeholder = ''" onblur="this.placeholder = 'proveedor@mail.cl'" required="">
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-2 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga09" name="carga09" disabled value="PRODUCTO">
								</div>
								
								<div class="col-lg-4 form-group">
									<div class="form-select" id="default-select" >
										<select id="codprod" name="codprod" >
											<option value="LHCAM">LHCAM TOLVA</option>
											<option value="LHCM3">LHCM3 ACOPIO</option>
										</select>
									</div>	
									<!-- <input type="text" class="common-input mb-1 form-control" id="codigoproducto" name="codigoproducto" placeholder="codigo producto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'codigoproducto'" required=""> -->
								</div>
								
								<div class="col-lg-2 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga11" name="carga11" disabled value="UNIDADES">
								</div>
								
								<div class="col-lg-4 form-group">
									<input type="text" class="common-input mb-1 form-control" id="qty" name="qty" placeholder="unidades m3" onfocus="this.placeholder = ''" onblur="this.placeholder = 'unidades m3'" required="">
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-2 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga09" name="carga09" disabled value="HUMEDAD">
								</div>
								
								<div class="col-lg-4 form-group">
									<input type="text" class="common-input mb-1 form-control" id="humedad" name="humedad" placeholder="% humedad promedio" onfocus="this.placeholder = ''" onblur="this.placeholder = '% humedad promedio'" required="">
								</div>
								
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga11" name="carga11" disabled value="ORDEN de COMPRA">
								</div>
								
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="oc" name="oc" placeholder="Orden de compra iLenia" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Orden de compra iLenia'" required="">
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-3 form-group">
									<input type="text" class="common-input mb-1 form-control" id="carga01" name="carga01" disabled value="TOLVA o CANCHA">
								</div>
								<div class="col-lg-9 form-group">
									<input type="text" class="common-input mb-1 form-control" id="tolva" name="tolva" placeholder="Detalle Recepción TOLVA" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Detalle Recepción TOLVA'" required="">
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-12 form-group">
									<textarea class="common-textarea mt-1 form-control" id="obsevaciones" name="obsevaciones" placeholder="Detalle Recepción MP" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Detalle Recepción MP'" required=""></textarea>
								</div>
								<div class="col-lg-12 form-group">
									<button class="primary-btn mt-1">Generar c&oacute;digo Recepci&oacute;n<span class="lnr lnr-arrow-right"></span></button>
									<div class="alert-msg">								
								</div>
							</div>	
							<!-- Linea Base   -->
							
						</form>
						
					</div>
				</div>
			</div>
		</div>
		<!--end contact Area -->
		<script src="../../convenios/js/validarRUT.js"></script>
		<%@ include file="../../convenios/inc/foot.inc"%>	

<%
%>