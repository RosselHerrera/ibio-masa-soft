<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOInstituciones" %>
<%@ page import = "cl.energiainteligente.dto.DTOProdStock" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd : HH:MM:ss").format(new Date());



/* ------------------------------------------ */
NumberFormat fmt = new DecimalFormat("#,###");
/* ------------------------------------------ */
/* --------------------------------------------------- */
MantenedorConvenios convenio = new MantenedorConvenios();
/* --------------------------------------------------- */
String Institucion = request.getParameter("hinst");
/* System.out.println(Institucion); */
String iBoleta = request.getParameter("numboleta");
int boleta = Integer.parseInt(iBoleta);
/* System.out.println(iBoleta); */
String razon = request.getParameter("ncodopp");
/* System.out.println(razon); */
String vta = request.getParameter("hvta");
/* System.out.println(vta); */
int cant =   Integer.parseInt(vta)/36000;

String vta15 = request.getParameter("hvta15");
/* System.out.println(vta15); */
int cant1 =   Integer.parseInt(vta15)/2100;
String vta20 = request.getParameter("hvta20");
int iQty = cant1;
/* System.out.println(vta20); */
int cant2 =   Integer.parseInt(vta20)/2600;
int iQty1 = cant2;
String vta25 = request.getParameter("hvta25");
/* System.out.println(vta25); */
int cant3 =   Integer.parseInt(vta25)/3100;
int iQty2 = cant3;

int itotal = Integer.parseInt(vta) + Integer.parseInt(vta15) + Integer.parseInt(vta20) + Integer.parseInt(vta25);


String sTotal = fmt.format(itotal);

/* --------------------------------------------------- */
String CodProducto = "S15KiL";
String CodProducto1 = "S20KiL";
String CodProducto2 = "S25KiL";
String Documento = "BOLETA";
String Rutconvenio = razon;
int iNumdoc = boleta;
String Observaciones = "OBSERVACION VENTA BOLETA";

int humedad = 24; 
int iIva = 0; 
String Transporte = "N/A"; 

int iPrecio  = Integer.parseInt(vta15); 
int iPreciot = Integer.parseInt(vta15)*cant1;

int iPrecio1  = Integer.parseInt(vta20);  
int iPreciot1 =  Integer.parseInt(vta20)*cant2;

int iPrecio2  = Integer.parseInt(vta25);  
int iPreciot2 =  Integer.parseInt(vta25)*cant3;



/* --------------------------------------------------- */
 	int Ret = 0;
 	int Ret1 = 0;
 	int Ret2 = 0;
	int Stock = 0;
	/*********************************************************/
	/* ----  LGXM3  ---------------------------------------- */ 
	if (cant!=0) {
		String CodProd = "LGXM3";	
		int iPrec = 36000;
		int iPrect = 36000*cant; 	
		/* ----- obtiene correlativo movimiento ---- */
		int id = convenio.identidad("eistkmovfechacv");
		/* ----------------------------------------- */
		if (id==0) { 
			id = 5000;
		}else{
			id = id + 5001;
		}	
		/* ----  LGXM3  ------------------------------------ */ 
		Ret = convenio.GrabaMovimiento(id, CodProd,	Documento, Rutconvenio, iNumdoc, fecha, cant, Observaciones, humedad, iIva, Transporte, iPrec, iPrect);
		/* ----  LGXM3  ------------------------------------ */ 
		
		/* ---- 3 Productos ------------------------------------ */
		if ((iQty!=0) && (iQty1!=0) && (iQty2!=0)) {
			
			/* ----- obtiene correlativo movimiento ---- */
			id = convenio.identidad("eistkmovfechacv");
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
				id = convenio.identidad("eistkmovfechacv");
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
				id = convenio.identidad("eistkmovfechacv");
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
				id = convenio.identidad("eistkmovfechacv");
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
				id = convenio.identidad("eistkmovfechacv");
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
				id = convenio.identidad("eistkmovfechacv");
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
				id = convenio.identidad("eistkmovfechacv");
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
		/*********************************************************/
		/* ---- 3 Productos ------------------------------------ */
	} else {
		/* ---- 3 Productos ------------------------------------ */
		/*********************************************************/
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
		/* ---- 3 Productos ------------------------------------ */
	}
	/*********************************************************/
%>

<!-- /*   contact Area   */ -->
    	<%@ include file="../../convenios/inc/headerB.inc"%>
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-20 col-lg-5">
					<div class="title text-center">
						<h3 class="text">BOLETA N° <font color="#ff0000"><%=" "+iBoleta%></font></h3>
						<h5 class="mb-10">R.U.T. 78.000.102-K </h5>
						<p>GIRO  Venta y secado de biomasa	DIRECCION Planta Las Lumas Lote 1. Km 13, Ruta Internacional Puyehue, km 1,5 a Mulpulmo, "iLeniaSoft",  Aportamos valor al ecosistema.</p> 
						<h3><font color="#BDBDBD"><p id="muestra4">---------------------------</p></font></h3>
						<h1><font color="#5F04B4"><p id="muestra">TOTAL <%=sTotal%> CLP</p></font></h1>
						<h3><font color="#BDBDBD"><p id="muestra4">---------------------------</p></font></h3>
						<h5 class="mb-10"><%="CONVENIO " + razon%></h5>
						<!-- Start container ----------------------- -->
							<div class="container"> 
							<!-- Start container ----------------------- -->
								<!-- Linea Base -->
								 
								<div class="row">
									<div class="col-lg-6 form-group">
										<input id="1" name="1" class="genric-btn primary form-control" disabled type="text" value='<%="BOLETA N° " + iBoleta%>'>
										<input id="2" name="2" class="common-input mb-1 form-control" disabled type="text" value='<%="LGXM3 : " + cant%>'>									
										<input id="3" name="3" class="common-input mb-1 form-control" disabled type="text" value='<%="S15KiL : " + cant1%>'>
										<input id="4" name="4" class="common-input mb-1 form-control" disabled type="text" value='<%="S20KiL : " + cant2%>'>
										<input id="5" name="5" class="common-input mb-1 form-control" disabled type="text" value='<%="S25KiL : " + cant3%>'>
									</div>
									<div class="col-lg-6 form-group">
										<input id="6" name="6" class="genric-btn primary form-control" disabled type="text" value='<%=Institucion%>'>
										<input id="7" name="7" class="common-input mb-1 form-control" disabled type="text" value='<%="CLP " + vta%>'>
										<input id="8" name="8" class="common-input mb-1 form-control" disabled type="text" value='<%="CLP " + vta15%>'>
										<input id="9" name="9" class="common-input mb-1 form-control" disabled type="text" value='<%="CLP " + vta20%>'>
										<input id="10" name="10" class="common-input mb-1 form-control" disabled type="text" value='<%="CLP " + vta25%>'>
									</div>	
								</div>
								<!-- <button class="primary-btn mt-10">INGRESO MOVIMIENTOS<span class="lnr lnr-arrow-right"></span></button> -->
								<h3><font color="#BDBDBD"><p id="muestra4">-------------------------</p></font></h3>
								
								<!-- Linea Base -->							
							 </div>
						<!--  end container  --------------------------->		
					</div>
				</div>
			</div>
		</div>
	<!--end contact Area -->
	<script src="../../cafe/js/validarRUT.js"></script>
	<%@ include file="../../convenios/inc/foot.inc"%>	
								