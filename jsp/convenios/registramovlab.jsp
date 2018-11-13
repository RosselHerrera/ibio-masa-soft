<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.energiainteligente.dto.DTOMovimientos" %>
<%@ page import = "cl.energiainteligente.laboratorio.RegistroLaboratorio" %>
<%@ page import = "cl.energiainteligente.dto.DTOLaboratorio" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>

<%
String IdMov = request.getParameter("idMov");
System.out.println(IdMov);  
int idmov = Integer.parseInt(IdMov); 
/*  */
int labidmov = idmov;
String labfecha = "";
String labnumdoc = "";
String laboperador = "";
int labordencompra = 0;

int numDoc = 0;
/* --------------------------------------------------- */
String CodProd = request.getParameter("codprod");
/* --------------------------------------------------- */
String Units = request.getParameter("units");
int unidades = 0;
/* --------------------------------------------------- */
int valorprod = 0;
/* --------------------------------------------------- */
String RutMov = request.getParameter("rutmov");
/* --------------------------------------------------- */
int tolva=0;
/* --------------------------------------------------- */
String VigenciaDoc = request.getParameter("datepicker");
/* --------------------------------------------------- */
String Condicion = request.getParameter("condicion");
/* --------------------------------------------------- */
String Operador = request.getParameter("operador");
/* --------------------------------------------------- */
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
/* --------------------------------------------------- */
int humedad = 0;
/* --------------------------------------------------- */
int distancia=0;
/* --------------------------------------------------- */
String Transporte = request.getParameter("transporte");
System.out.println(Transporte);
if (Transporte==null){Transporte="N/A";}
/* --------------------------------------------------- */
String Observacion = request.getParameter("observacion");
System.out.println(Observacion);
String msg =  "\" [{\"Tolva\": "   + tolva +
				", \"Operador\": " + Operador + 
				", \"Precio\": "   + valorprod + 
				", \"Fecha\": "    + fecha + 
				", \"Obs\": "      + Observacion + "}] \"";
/* --------------------------------------------------- */
int Ret = 0;
int Stock = 0;
	/* --------------------------------------------------- */
	RegistroLaboratorio laboratorio = new RegistroLaboratorio();
	/* --------------------------------------------------- */
	/* ----- obtiene correlativo desde el movimiento ---- */
	int id = laboratorio.identidad("eistkmovfechacv");
	/* ----------------------------------------- */
	if (id==0) { 
		id = 4000;
	}else{
		id = id + 4001;
	}
	/* --------------------------------------------------- */
	int labid = id;
	String labtipolenacarga = "";
	String labcantidad = "";
	String labobservaciones = "";
	String labfiller = "";
	/* --------------------------------------------------- */
	
	try{ 
		
		ArrayList ListaMovimientos = laboratorio.ListaMovimientos(labidmov);
		Iterator it = ListaMovimientos.iterator();   
	    if (it.hasNext()) { 
	    	
	    	 while (it.hasNext()){
					/* ----------------------------------------------- */
					DTOMovimientos obj = (DTOMovimientos) it.next();
					/* ----------------------------------------------- */
					idmov = obj.getIdeiMovfecha();
					CodProd = obj.getEicodigoP(); 
					Condicion = obj.getEitipodoc();
					RutMov = obj.getEirut(); 
					labnumdoc = obj.getEinumdoc(); 
					labfecha = obj.getEifechamovimiento();
					Units = obj.getEiunidadesP();
					humedad = obj.getEihumedad();
					valorprod = obj.getEivalor();
	    	 }
	    }
	    
		
		/* ---Registra Laboratorio 17.09.2018 ---- */
		/* Ret = laboratorio.GrabaMovimientoLab(labid, 
												labidmov, 
													labfecha, 
														labnumdoc,
															laboperador,
																labordencompra, 
																	labtipolenacarga, 
																		labcantidad,
																			labobservaciones,
																				labfiller); */
		/* ----------------------------------------------- */
	}catch (Exception e) { 
	 	e.printStackTrace(); 
	} 
	
	
%>
<%@ include file="../../convenios/inc/headerL.inc"%>
	<!-- start contact Area -->
	<!-- <section class="contact-area section-gap" id="contact"> -->
		<div class="container">
			<a class="navbar-brand" href="../../convenios/index.html">
				<button class="primary-btn mt-1">iLeniaSoft<span class="lnr lnr-arrow-right"></span></button>
			</a>
			<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-10">
							<div class="title text-center">
								<h3 class="mb-10">Laboratorio Registro de Muestras</h3>
								<p>Te ayudamos con tu ecosistema tecnológico.</p>
								
								<form class="form-area " id="tipoconvForm" name="tipoconvForm" action="../jsp/convenios/registramovlab.jsp" method="post" class="contact-form text-right">
								
									<div class="row">
										<div class="col-lg-6 form-group">
											<input id="numdoc" name="numdoc" placeholder="NUMERO CARGA" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Debe ingresr solo n&uacute;meros'" class="common-input mb-10 form-control" required="" disabled type="text" value='<%="N° Registro: "+ idmov%><%=id%>'>
											<input id="idmov" name="idmov" placeholder="IDMOV" onfocus="this.placeholder = ''" onblur="this.placeholder = 'IDMOV'" class="common-input mb-10 form-control" required="" type="text">
											<div class="form-select" id="default-select" >
												<select id="codprod" name="codprod" >
													<option value="LHCAM">LHCAM TOLVA</option>
												</select>
											</div>		
											<br>									
											<input id="units" name="units" placeholder="UNIDADES M3" onfocus="this.placeholder = ''" onblur="this.placeholder = 'UNIDADES'" class="common-input mb-10 form-control" required="" type="text" value='<%=Units%>'>
											<!-- <input id="valorprod" name="valorprod" placeholder="PRECIO $9999999" onfocus="this.placeholder = ''" onblur="this.placeholder = '$9999999'" class="common-input mb-10 form-control" required="" type="text"> -->
											<input id="humedad" name="humedad" placeholder="CANTIDAD 3 MEDIDAS" onfocus="this.placeholder = ''" onblur="this.placeholder = 'CANTIDAD 3 MEDIDAS'" class="common-input mb-10 form-control" required="" type="text">
											<input id="transporte" name="transporte" placeholder="TIPO LENA" onfocus="this.placeholder = ''" onblur="this.placeholder = 'TIPO LENA'" class="common-input mb-10 form-control" required="" type="text">
											<input id="guiadespacho" name="guiadespacho" placeholder="GUIA DESPACHO CAMION 999999" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Debe ingresr solo n&uacute;meros'" class="common-input mb-10 form-control" required="" type="text" value='<%=labnumdoc%>'>
										</div>
										<div class="col-lg-6 form-group">
											<input id="oc" name="oc" placeholder="ORDEN DE COMPRA" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ORDEN DE COMPRA'" class="common-input mb-10 form-control" required="" type="text">
											<input id="operador" name="operador" placeholder="INICIALES OPERADOR ABC" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ABC'" class="common-input mb-20 form-control" required="" type="text">
											<div >
												<div class="switch-wrap d-flex justify-content-between">
												  <label class="form-check-label">
												    <input type="radio" id="default-radio" name="optradio" value=1  required="">Tolva 1
												  </label>
												  <label class="form-check-label">
												    <input type="radio" id="default-radio" name="optradio" value=2 > Tolva 2
												  </label>
												  <label class="form-check-label">
												    <input type="radio" id="default-radio" name="optradio" value=3 > Tolva 3
												  </label>
												</div>
											</div>		
											<br>									
											<input id="datepicker" name="datepicker" class="common-input mb-1 form-control" required="" />
										    <script>
										        $('#datepicker').datepicker({
										        	format: 'yyyy-mm-dd'  
										        });
										    </script>
											<input id="observacion" name="observacion" placeholder="OBSERVACION" onfocus="this.placeholder = ''" onblur="this.placeholder = 'DISTANCIA PREDIO KM'" class="common-input mb-10 form-control" required="" type="text">
											<input id="filler" name="filler" placeholder="JSON RECEPCION" onfocus="this.placeholder = ''" onblur="this.placeholder = 'OBSERVACION'" class="common-input mb-10 form-control" required="" type="text">
											<button class="primary-btn mt-1">REGISTRO LABORATORIO<span class="lnr lnr-arrow-right"></span></button>
										</div>	
									</div>
								</form>
								
							</div>
						</div>				
					</div>							
				</div>	
		</div>	
	<!-- </section> -->
	
	<!-- end contact Area -->
<%@ include file="../../convenios/inc/foot.inc"%>