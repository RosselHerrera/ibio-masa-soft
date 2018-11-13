<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOMovimientos" %>

<%
/* ------------------------------------------ */
NumberFormat fmt = new DecimalFormat("#,###");
/* ------------------------------------------ */
/* --------------------------------------------------- */
MantenedorConvenios convenio = new MantenedorConvenios();
/* --------------------------------------------------- */
String NumDoc = request.getParameter("numdoc");
/* System.out.println(NumDoc);  */
int numDoc = Integer.parseInt(NumDoc);
/* --------------------------------------------------- */
String CodProd = request.getParameter("codprod");
/* System.out.println(CodProd);  */
/* --------------------------------------------------- */
String Units = request.getParameter("units");
int units = Integer.parseInt(Units);
/* --------------------------------------------------- */
String Condicion = request.getParameter("condicion");
/* System.out.println(Condicion); */ 
/* --------------------------------------------------- */
String ValorProd = request.getParameter("valorprod");
int valorprod = 0 ;
double valoragregado = 0;
double valor = 0;
double fvalorpresecado = 1.15;
double fvalorventa = 1.25;
String sCLP1 = "0";
if (ValorProd==null) {
	ValorProd = "0";
	/* Calculo Valor Agregado */
	fvalorpresecado = 1.25;
	valorprod = convenio.precioProducto(CodProd);
	valoragregado = Math.round(valorprod*fvalorpresecado); 
	sCLP1 = fmt.format(valoragregado);	
}else{
	valorprod = Integer.parseInt(ValorProd);
    /* Calculo Valor Agregado */
	valor = Double.valueOf(ValorProd); 
    
	if (Condicion.equals("GUIAINT")) {
		valoragregado = Math.round(valor*fvalorpresecado); 
		sCLP1 = fmt.format(valoragregado);
	}else{
		valoragregado = Math.round(valor*fvalorventa); 
		sCLP1 = fmt.format(valoragregado);	
	}
}  
/* --------------------------------------------------- */

/* --------------------------------------------------- */
String RutMov = request.getParameter("rutmov");
/* System.out.println(RutMov); */
/* --------------------------------------------------- */
String Tolva = "";
int tolva = 0;
if (request.getParameter("optradio")!=null){
	Tolva = request.getParameter("optradio");
	System.out.println(Tolva);
	
	if (Tolva==null){
		tolva = 0;
	} else {
		tolva = Integer.parseInt(Tolva);	
	}
}
/* --------------------------------------------------- */
String VigenciaDoc = request.getParameter("datepicker");
/* System.out.println(VigenciaDoc); */ 
/* --------------------------------------------------- */
String Operador = request.getParameter("operador");
System.out.println(Operador);
/* --------------------------------------------------- */
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
/* System.out.println(fecha);  */
/* --------------------------------------------------- */

/* --------------------------------------------------- */
String Humedad = request.getParameter("humedad");;
System.out.println(Humedad);
int humedad = Integer.parseInt(Humedad);
/* --------------------------------------------------- */
String Distancia = request.getParameter("distancia");;
/* System.out.println(Distancia);  */
int distancia = 0;
if (Distancia==null){
	distancia = 0;
}else{
	 distancia = Integer.parseInt(Distancia);
}
/* --------------------------------------------------- */
String Transporte = request.getParameter("transporte");
/* System.out.println(Transporte); */
if (Transporte==null){Transporte="N/A";}
/* --------------------------------------------------- */
String Observacion = request.getParameter("observacion");
System.out.println(Observacion);
//String msg =  "\"{\"Tolva\": "+ tolva + ", \"Operador\": " + Operador + ", \"Precio\": " + valorprod + ", \"PrecioVA\": " + valoragregado + ", \"Fecha\": " + fecha + ", \"Obs\": " + Observacion + "}\"";
String msg =  Observacion + "Vacio";
/* --------------------------------------------------- */
int Ret = 0;
int Stock = 0;
	/* ----- obtiene correlativo movimiento ---- */
	int id = convenio.identidad("eistkmovfechacv");
	/* ----------------------------------------- */
	if (id==0) { 
		id = 2000;
	}else{
		id = id + 2001;
	}
	/* --------------------------------------------------- */
	try{ 
		/* --- Registra Movimiento 12.09.2018 ---- */
		Ret = convenio.GrabaMovimiento(id, 
										 CodProd, 
										   Condicion, 
										     RutMov,
										       numDoc,
										         VigenciaDoc, 
										           units, 
										             msg,
													   humedad,
													     distancia,
													   	   Transporte,
													   	     valorprod,
													   	  	   valoragregado);
		/* --- Registra Movimiento 21.09.2018 ------------------------------- */
		if (Ret==1){
			
			
		}else{
			
			
			
		}
		
	}catch (Exception e) { 
	 	e.printStackTrace(); 
	} 
	
	
%>
<%@ include file="../../convenios/inc/header.inc"%>
	<!-- start contact Area -->
	<!-- <section class="contact-area section-gap" id="contact"> -->
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-60 col-lg-8">
					<div class="title text-center">
						<h2 class="mb-10">Registro Movimiento <%=Condicion%></h2>
						<p>Te ayudamos con tu ecosistema tecnológico.</p>
						<!-- /* ------------------------------------------------ */ -->
							<form class="form-area " id="tipoconvForm" name="tipoconvForm" action="rendermov.jsp" method="post" class="contact-form text-center">
								<div class="row">
									<div class="col-lg-6 form-group">
										<input id="1" name="1" class="common-input mb-10 form-control" disabled type="text" value='<%="Numero Documento : " + numDoc%>'>
										<input id="2" name="2" class="common-input mb-10 form-control" disabled type="text" value='<%="Rut Asociado : " + RutMov%>'>									
										<input id="3" name="3" class="common-input mb-10 form-control" disabled type="text" value='<%="Codigo de Producto : " + CodProd%>'>
										<input id="4" name="4" class="common-input mb-10 form-control" disabled type="text" value='<%="% de humedad : " + humedad%>'>
										<input id="5" name="5" class="common-input mb-10 form-control" disabled type="text" value='<%="PPP en Stock : " + sCLP1%>'>
									</div>
									<div class="col-lg-6 form-group">
										<input id="6" name="6" class="common-input mb-10 form-control" disabled type="text" value='<%="Fecha Facturacion : " + VigenciaDoc%>'>
										<input id="7" name="7" class="common-input mb-10 form-control" disabled type="text" value='<%="Unidades de Producto : " + units%>'>
										<input id="8" name="8" class="common-input mb-10 form-control" disabled type="text" value='<%="Distancia : " + distancia%>'>
										<input id="9" name="9" class="common-input mb-10 form-control" disabled type="text" value='<%="Transporte : " + Transporte%>'>
										<input id="10" name="10" class="common-input mb-10 form-control" disabled type="text" value='<%="Observacion : " + Observacion%>'>
										
										<button class="primary-btn mt-10">INGRESO MOVIMIENTOS<span class="lnr lnr-arrow-right"></span></button>
									</div>	
								</div>
								<input type="hidden" id="condicion" name="condicion" value="<%=Condicion%>" > 
							</form>
						<!-- /* ------------------------------------------------ */ -->		
					</div>
				</div>		
			</div>=
		</div>	
	<!-- </section> -->
	
	<!-- end contact Area -->
<%@ include file="../../convenios/inc/foot.inc"%>