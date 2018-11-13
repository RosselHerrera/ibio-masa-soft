<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOMovimientos" %>

<%
/* --------------------------------------------------------------- */
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
/* --------------------------------------------------------------- */
int idmov; 
String	eistkcodP = ""; 
String  eistktipdoc = ""; 
String  eistkRut = ""; 
String  eistkNumdoc = ""; 
String  eistkFechamovimiento = "";
String  eistkUnidadesP = ""; 
/* --------------------------------------------------------------- */
int iHumedad;
int iDistancia;
String eistkTransporte = "";
int ivalor;
/* --------------------------------------------------------------- */
String  FILLER = "";

	/* --------------------------------------------------- */
	MantenedorConvenios movimiento = new MantenedorConvenios();
	/* --------------------------------------------------- */
		ArrayList ListaMovimientos = movimiento.ListaMovimientos();
		Iterator it = ListaMovimientos.iterator();   
	    if (it.hasNext()) { %>
	    
		<%@ include file="../../convenios/inc/header.inc"%>
			<!-- start contact Area -->
			<section>
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-12">
							<div class="title text-center">
								<h2 class="mb-10">Movimientos Inventario x Producto</h2>
								<p>Te ayudamos con tu ecosistema tecnológico.</p>
									<h3 class="mb-10">Movimientos F&iacute;sico Registrados</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="serial">N° FICHA</div>
												<div class="serial">CODPROD</div>
												<div class=serial>TIPODOC</div>
												<div class=country>RUT MOVIMIENTO</div>
												<div class="country">FECHA HORA MOVIMIENTO</div>
												<div class="serial">UNIDADES</div>
												<div class="serial">%HUMEDAD</div>
												<div class="serial">VALOR U</div>
											</div>
											<% while (it.hasNext()){
												/* ----------------------------------------------- */
												DTOMovimientos obj = (DTOMovimientos) it.next();
												/* ----------------------------------------------- */
												idmov = obj.getIdeiMovfecha();
												eistkcodP = obj.getEicodigoP(); 
												eistktipdoc = obj.getEitipodoc();
												eistkRut = obj.getEirut(); 
												eistkNumdoc = obj.getEinumdoc(); 
												eistkFechamovimiento = obj.getEifechamovimiento();
												eistkUnidadesP = obj.getEiunidadesP();
												iHumedad = obj.getEihumedad();
												ivalor = obj.getEivalor();%>
												<div class="table-row">
												<div class="serial"><%=idmov%></div>
												<div class="serial"><%=eistkcodP%></div>
												<div class="serial"><%=eistktipdoc%></div>
												<div class="country"><%=eistkRut%></div>
												<div class="country"><%=eistkFechamovimiento%></div>
												<div class="serial"><%=eistkUnidadesP%></div>
												<div class="serial"><%=iHumedad + "%"%></div>
												<div class="serial"><%=ivalor%></div>
								        </div> 
										<%}%>
								    </div>
								</div>
							</div>
						</div>		
					</div>
				</div>	
			</section>
			
			<!-- end contact Area -->
		<%@ include file="../../convenios/inc/foot.inc"%>	
		<%} else {%>		
			<%@ include file="../../convenios/inc/header.inc"%> 
				<div class="container">
					<div class="section-top-border">
						<h3 class="mb-30">&nbsp;&nbsp;&nbsp;Movimientos Registrados</h3>
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No existen registros para Render Movimientos</h5>	
					</div>
				</div>		
			<%@ include file="../../convenios/inc/foot.inc"%>
		<%
	}		
%>