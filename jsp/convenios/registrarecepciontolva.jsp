<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOProdStock" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
String hora = new SimpleDateFormat("HH:MM:ss").format(new Date());
String codigoP = "LHCAM";
String tipodoc = "COMPRA";
int unidades = 0;

String nombreproveedor = request.getParameter("nombreproveedor");
System.out.println(nombreproveedor);
String rutproveedor = request.getParameter("rutproveedor");
System.out.println(rutproveedor);
String numdoc = request.getParameter("numdoc");
System.out.println(numdoc);
String vehiculo = request.getParameter("vehiculo");
System.out.println(vehiculo);
String conductor = request.getParameter("conductor");
System.out.println(conductor);
String celular = request.getParameter("celular");
System.out.println(celular);
String email = request.getParameter("email");
System.out.println(email);
String codprod = request.getParameter("codprod");
System.out.println(codprod);
String qty = request.getParameter("qty");
System.out.println(qty);
int iqty = Integer.parseInt(qty);
String humedad = request.getParameter("humedad");
System.out.println(humedad);
int ihumedad = Integer.parseInt(humedad);

String OC = request.getParameter("oc");
int oc = Integer.parseInt(OC);
System.out.println(OC);

String tolva = request.getParameter("tolva");
System.out.println(tolva);
String obsevaciones = request.getParameter("obsevaciones");
System.out.println(obsevaciones);

String msg =  "\"{\"Tolva\": "+ tolva + ", \"qty\": " + qty + ", \"Humedad\": " + humedad + ", \"Nombre Proveedor\": " + nombreproveedor + ", \"fono\": " + celular + ", \"email\": " + email + ", \"Fecha\": " + fecha + ", \"Obs\": " + obsevaciones + "}\"";
System.out.println(msg);

String filler="";
 
/* --------------------------------------------------------- */
MantenedorConvenios ficharecepcion = new MantenedorConvenios();
/* --------------------------------------------------------- */
int Ret = 0; 
int iPrecioStock=0;
int Stock = 0;
	/* ----- obtiene correlativo movimiento ---- */
	int id = ficharecepcion.identidad("eistkmovfechacv");
	/* ----------------------------------------- */
	if (id==0) { 
		id = 1100;
	}else{
		id = id + 1101;
	}
	/* ------------- obtiene precio de Stocks ------------ */
	iPrecioStock = ficharecepcion.precioProducto(codprod);	
	/* --------------------------------------------------- */
	try{
		Ret = ficharecepcion.GrabaMovimiento (id, 
												codprod, 
												  tipodoc, 
												     rutproveedor, 
												   		oc, 
												   		  fecha, 
												   			iqty, 
												            	msg, 
												           	ihumedad, 
												           	unidades, 
													              vehiculo+conductor, 
													        iPrecioStock, 
												            unidades);
		
	
		
	/* --- Registra Movimiento 27.09.2018 ------------------------------- */
    }catch (Exception e) { 
 	e.printStackTrace(); 
    }

/* ----------------------------------------- */
%>

<%@ include file="../../convenios/inc/header.inc"%>
	<!-- start contact Area -->
	<!-- <section class="contact-area section-gap" id="contact"> -->
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-60 col-lg-8">
					<div class="title text-center">
						<h2 class="mb-10">Registro Ficha Recepci&oacute;n LEÑA</h2>
						<p>Te ayudamos con tu ecosistema tecnológico.</p>
						<!-- /* ------------------------------------------------ */ -->
							<form class="form-area " id="tipoconvForm" name="tipoconvForm" action="rendermov.jsp" method="post" class="contact-form text-center">
								<div class="row">
									<div class="col-lg-6 form-group">
										<input id="1" name="1" class="common-input mb-10 form-control" disabled type="text" value='<%="Numero Documento : " + oc%>'>
										<input id="2" name="2" class="common-input mb-10 form-control" disabled type="text" value='<%="Rut Asociado : " + rutproveedor%>'>									
										<input id="3" name="3" class="common-input mb-10 form-control" disabled type="text" value='<%="Codigo de Producto : " + codigoP%>'>
										<input id="4" name="4" class="common-input mb-10 form-control" disabled type="text" value='<%="% humedad : " + humedad%>'>
										<input id="5" name="5" class="common-input mb-10 form-control" disabled type="text" value='<%="Volumen M3 : " + qty%>'>
									</div>
									<div class="col-lg-6 form-group">
										<input id="6" name="6" class="common-input mb-10 form-control" disabled type="text" value='<%="Fecha Hora : " + fecha + " : " + hora%>'>
										<input id="7" name="7" class="common-input mb-10 form-control" disabled type="text" value='<%="Tolva : " + tolva%>'>
										<input id="8" name="8" class="common-input mb-10 form-control" disabled type="text" value='<%="Conductor : " + conductor%>'>
										<input id="9" name="9" class="common-input mb-10 form-control" disabled type="text" value='<%="Email : " + email%>'>
										<input id="10" name="10" class="common-input mb-10 form-control" disabled type="text" value='<%="Precio de Stock : " + iPrecioStock%>'>
										
										<button class="primary-btn mt-10">INGRESO MOVIMIENTOS<span class="lnr lnr-arrow-right"></span></button>
									</div>	
								</div>
								<input type="hidden" id="condicion" name="condicion" value="COMPRA" > 
							</form>
						<!-- /* ------------------------------------------------ */ -->		
					</div>
				</div>		
			</div>=
		</div>	
	<!-- </section> -->
	
	<!-- end contact Area -->
<%@ include file="../../convenios/inc/foot.inc"%>