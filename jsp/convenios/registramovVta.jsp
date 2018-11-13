<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
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
int humedad=0;
int distancia=0;
String Transporte = "N/A";
String filler="";
/* E----------------------------------------- */
 String Rutconvenio = request.getParameter("rutconvenio");
/*  System.out.println(Rutconvenio); */
 String Documento = request.getParameter("documento");
/*  System.out.println(Documento); */
 String Numdoc = request.getParameter("numdoc");
   int iNumdoc = Integer.parseInt(Numdoc);
/*  System.out.println(iNumdoc);  */
 String Nombreproveedor = request.getParameter("nombreproveedor"); 
 /* System.out.println(Nombreproveedor);  */
 String Observaciones = request.getParameter("observaciones");
/*  System.out.println(Observaciones);  */
 /* ----------------------------------------- */
 
 /* D----------------------------------------- */
 String CodProducto = request.getParameter("lblcodProducto");
 System.out.println(CodProducto);
 String Precio = request.getParameter("precio");
 int iPrecio = Integer.parseInt(Precio);
 String Qty = request.getParameter("qty");
 System.out.println("q :" + Qty);
 int iQty = Integer.parseInt(Qty);
 String Preciot = "";
 int iPreciot=0;
 if (iQty==0){
	 iPreciot=0;
	 Preciot = "";
 }else{
 	Preciot = request.getParameter("preciot");
 	iPreciot = (iQty*iPrecio);
 }
/* L1------------------------------------------ */
 String CodProducto1 = request.getParameter("lblcodProducto1");
 String Precio1 = request.getParameter("precio1");
 int iPrecio1 = Integer.parseInt(Precio1);
 String Qty1 = request.getParameter("qty1");
 System.out.println("q1 :" + Qty1);
 int iQty1 = Integer.parseInt(Qty1);
 String Preciot1 = "";
 int iPreciot1=0;
 if (iQty1==0){
	 iPreciot1=0;
	 Preciot1 = "";
 }else{
 	Preciot1 = request.getParameter("preciot1");
 	iPreciot1 = (iQty1*iPrecio1);
 }
/* L2------------------------------------------ */
 String CodProducto2 = request.getParameter("lblcodProducto2");
 String Precio2 = request.getParameter("precio2");
 int iPrecio2 = Integer.parseInt(Precio2);
 String Qty2 = request.getParameter("qty3");
 System.out.println("q2 :" + Qty2);
 int iQty2 = Integer.parseInt(Qty2);
 String Preciot2 = "";
 int iPreciot2=0;
 if (iQty2==0){
	 iPreciot2=0;
	 Preciot2 = "";
 }else{
 	Preciot2 = request.getParameter("preciot2");
 	iPreciot2 = (iQty2*iPrecio2);
 }
/* L3---------------------------------------------- */

/* L3---------------------------------------------- */
 String Valorneto = request.getParameter("valorneto");
 int iValorneto = Integer.parseInt(Valorneto);
 /* System.out.println(iValorneto);  */
 
 String Iva = request.getParameter("porcentaje");
 int iIva = Integer.parseInt(Iva);
 /* System.out.println(iIva); */  
 
 String Valortotal = request.getParameter("valortotal");
 int iValortotal = Integer.parseInt(Valortotal);
/*  System.out.println(iValortotal); */
 /* L4------------------------------------------ */
 
 String sCodProducto = CodProducto +","+ CodProducto1 +","+ CodProducto2;
 Precio = Precio +","+  Precio1 +","+ Precio2;
 Preciot = Preciot +","+  Preciot1 +","+  Preciot2;
 /* -------------------------------------------------- */
 filler ="\"[{\"Producto\": "   + sCodProducto +
		   ", \"precio\": "		+ Precio + 
		   ", \"Q\": "   	    + Qty + Qty1 + Qty2 +
		   ", \"neto\": "    	+ iPreciot + 
		   ", \"Obs\": "      	+ Observaciones + "}] \"";
/* -------------------------------------------------- */ 
 /* CodProducto = "VENTA03"; */
 Observaciones = filler;
/* ------------------------------------------ */
NumberFormat fmt = new DecimalFormat("#,###");
/* ------------------------------------------ */
/* --------------------------------------------------- */
MantenedorConvenios convenio = new MantenedorConvenios();
/* --------------------------------------------------- */
 	int Ret = 0;
 	int Ret1 = 0;
 	int Ret2 = 0;
	int Stock = 0;
	
	if ((iQty!=0) && (iQty1!=0) && (iQty2!=0)) {
		
		/* ----- obtiene correlativo movimiento ---- */
		int id = convenio.identidad("eistkmovfechacv");
		/* ----------------------------------------- */
		if (id==0) { 
			id = 5000;
		}else{
			id = id + 5001;
		}
		
		/* --------------------------------------------------- */
		try{ 
			/* --- Registra Movimiento 12.09.2018 ---- */
			Ret = convenio.GrabaMovimiento(id, CodProducto,	Documento, Rutconvenio, iNumdoc, fecha, iQty, Observaciones, humedad, iIva, Transporte, iPrecio, iPreciot);
			/* --- Registra Movimiento 30.09.2018 ------------------------------- */
			if (Ret==1){
				id = id +1; 
				Ret1 = convenio.GrabaMovimiento(id, CodProducto1,	Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio1, iPreciot1);
			}
			/* --- Registra Movimiento 30.09.2018 ------------------------------- */
			if (Ret1==1){
				id = id +1;
				Ret2 = convenio.GrabaMovimiento(id, CodProducto2, Documento, Rutconvenio, iNumdoc, fecha, iQty2, Observaciones, humedad, iIva, Transporte, iPrecio2, iPreciot2);
			}
			/* -------------------------------------------------- */	
			}catch (Exception e) { 
			 	e.printStackTrace(); 
			} 
			/* --------------------------------------------------- */
		} else if ((iQty!=0) && (iQty1!=0) && (iQty2==0)){		
			/* ----- obtiene correlativo movimiento ---- */
			int id = convenio.identidad("eistkmovfechacv");
			/* ----------------------------------------- */
			if (id==0) { 
				id = 5000;
			}else{
				id = id + 5001;
			}
			/* --------------------------------------------------- */
			try{ 
				/* --- Registra Movimiento 12.09.2018 ---- */
				Ret = convenio.GrabaMovimiento(id, CodProducto,	Documento, Rutconvenio, iNumdoc, fecha, iQty, Observaciones, humedad, iIva, Transporte, iPrecio, iPreciot);
				/* --- Registra Movimiento 30.09.2018 ------------------------------- */		
				if (Ret==1){
					id = id +1;
					Ret1 = convenio.GrabaMovimiento(id, CodProducto1, Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio1, iPreciot1);
				}
			/* --- Registra Movimiento 30.09.2018 ------------------------------- */
			}catch (Exception e) { 
			 	e.printStackTrace(); 
			} 	
		} else if ((iQty!=0) && (iQty1==0) && (iQty2!=0)){		
			/* ----- obtiene correlativo movimiento ---- */
			int id = convenio.identidad("eistkmovfechacv");
			/* ----------------------------------------- */
			if (id==0) { 
				id = 5000;
			}else{
				id = id + 5001;
			}		
			/* --------------------------------------------------- */
			try{ 
				/* --- Registra Movimiento 12.09.2018 ---- */
				Ret = convenio.GrabaMovimiento(id, CodProducto1, Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio, iPreciot1);

				/* --- Registra Movimiento 30.09.2018 ------------------------------- */
				if (Ret==1){
					id = id +1;
					Ret2 = convenio.GrabaMovimiento(id, CodProducto2, Documento, Rutconvenio, iNumdoc, fecha, iQty2, Observaciones, humedad, iIva, Transporte, iPrecio2, iPreciot2);
				}
			/* -------------------------------------------------- */	
			}catch (Exception e) { 
			 	e.printStackTrace(); 
			} 
			/* --------------------------------------------------- */	
		} else if ((iQty!=0) && (iQty1==0) && (iQty2==0)){
			/* ----- obtiene correlativo movimiento ---- */
			int id = convenio.identidad("eistkmovfechacv");
			/* ----------------------------------------- */
			if (id==0) { 
				id = 5000;
			}else{
				id = id + 5001;
			}		
			/* --------------------------------------------------- */
			try{ 
				/* --- Registra Movimiento 12.09.2018 ---- */
				Ret = convenio.GrabaMovimiento(id, CodProducto, Documento, Rutconvenio, iNumdoc, fecha, iQty, Observaciones, humedad, iIva, Transporte, iPrecio, iPreciot);
			/* -------------------------------------------------- */	
			}catch (Exception e) { 
			 	e.printStackTrace(); 
			} 
			/* --------------------------------------------------- */
		} else if ((iQty==0) && (iQty1==0) && (iQty2!=0)){		
			/* ----- obtiene correlativo movimiento ---- */
			int id = convenio.identidad("eistkmovfechacv");
			/* ----------------------------------------- */
			if (id==0) { 
				id = 5000;
			}else{
				id = id + 5001;
			}
			try{ 			
				Ret2 = convenio.GrabaMovimiento(id, CodProducto2, Documento, Rutconvenio, iNumdoc, fecha, iQty2, Observaciones, humedad, iIva, Transporte, iPrecio2, iPreciot2);
			/* --------------------------------------------------- */	
			} catch (Exception e) { 
			 	e.printStackTrace(); 
			} 
			/* ---------------------------------------------------- */
		}else if ((iQty==0) && (iQty1!=0) && (iQty2!=0)){	
			/* ----- obtiene correlativo movimiento ---- */
			int id = convenio.identidad("eistkmovfechacv");
			/* ----------------------------------------- */
			if (id==0) { 
				id = 5000;
			}else{
				id = id + 5001;
			}		
			/* --------------------------------------------------- */
			try{ 			
				Ret1 = convenio.GrabaMovimiento(id, CodProducto1, Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio1, iPreciot1);
				/* ---------------------------------- */
				if (Ret1==1){
					id = id +1;
					Ret2 = convenio.GrabaMovimiento(id, CodProducto2, Documento, Rutconvenio, iNumdoc, fecha, iQty2, Observaciones, humedad, iIva, Transporte, iPrecio2, iPreciot2);
					}			
			/* -------------------------------------------------- */	
			}catch (Exception e) { 
			 	e.printStackTrace(); 
			} 
			/* --------------------------------------------------- */
	   }else if ((iQty==0) && (iQty1!=0) && (iQty2==0)){		
			/* ----- obtiene correlativo movimiento ---- */
			int id = convenio.identidad("eistkmovfechacv");
			/* ----------------------------------------- */
			if (id==0) { 
				id = 5000;
			}else{
				id = id + 5001;
			}
			/* --------------------------------------------------- */
			try{ 
				Ret1 = convenio.GrabaMovimiento(id, CodProducto1, Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio1, iPreciot1);
			/* -------------------------------------------------- */	
			} catch (Exception e) { 
			 	e.printStackTrace(); 
			} 
			/* --------------------------------------------------- */
	}	



%>
	<%@ include file="../../convenios/inc/headerP.inc"%>

	<!--end contact Area -->
	<script src="../../convenios/js/validarRUT.js"></script>
		
		<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content pb-10 col-lg-12">
				<div class="title text-center">
					<h3 class="mb-1">Venta y Despacho Productos Convenio</h3> 
					<h5><%=" iLeniaSoft : " + fecha%></h5>
					<p>Te ayudamos con tu ecosistema tecnológico.</p>
					<!--  ****************************************  -->
					<form class="form-area " id="tipoconvForm" name="tipoconvForm" action="rendermov.jsp" method="post" class="contact-form text-center">
						<div class="row">
							<div class="col-lg-6 form-group">
								<input id="1" name="1" class="common-input mb-10 form-control" disabled type="text" value='<%="Numero Documento : " + iNumdoc%>'>
								<input id="2" name="2" class="common-input mb-10 form-control" disabled type="text" value='<%="Rut Asociado : " + Rutconvenio%>'>									
								<input id="3" name="3" class="common-input mb-10 form-control" disabled type="text" value='<%="Codigo de Producto : " + CodProducto%>'>
								<input id="4" name="4" class="common-input mb-10 form-control" disabled type="text" value='<%="Cantidad: " + humedad%>'>
								<input id="5" name="5" class="common-input mb-10 form-control" disabled type="text" value='<%="Tipo Doc : " + Documento%>'>
							</div>
							<div class="col-lg-6 form-group">
								<input id="6" name="6" class="common-input mb-10 form-control" disabled type="text" value='<%="Fecha Facturacion : " + fecha%>'>
								<input id="7" name="7" class="common-input mb-10 form-control" disabled type="text" value='<%="Valon Neto : " + iValorneto%>'>
								<input id="8" name="8" class="common-input mb-10 form-control" disabled type="text" value='<%="I.V.A. : " + iIva%>'>
								<input id="9" name="9" class="common-input mb-10 form-control" disabled type="text" value='<%="Total : " + iValortotal%>'>
								<input id="10" name="10" class="common-input mb-10 form-control" disabled type="text" value='<%="Observacion : " + filler%>'>
								
								<button class="primary-btn mt-10">INGRESO MOVIMIENTOS<span class="lnr lnr-arrow-right"></span></button>
							</div>	
						</div>
						<input type="hidden" id="condicion" name="condicion" value="<%=Documento%>" > 
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
/* ----------------------------------------- */
%>	