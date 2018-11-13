<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOHumedad" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

int id; 
String	codAndamio = ""; 
String  codBin = ""; 
String  factorH = ""; 
String  fechaR = ""; 
String  descR = "";
String  sale = ""; 

String  FILLER = "";

	/* --------------------------------------------------- */
	MantenedorConvenios humedad = new MantenedorConvenios();
	/* --------------------------------------------------- */
	ArrayList ListaHumedad = humedad.ListaHumedad();
    Iterator it = ListaHumedad.iterator();
    
	    if (it.hasNext()) { %>
	    <%@ include file="../../convenios/inc/header.inc"%>
	    <!-- start contact Area -->
	    <section>
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-10">
							<div class="title text-center">
								<h2 class="mb-10">Humedad en Andamios</h2>
								<p>Te ayudamos con tu ecosistema tecnológico.</p>
									<h3 class="mb-10">Humedad Registrada</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="serial">CODANDA</div>
												<div class=serial>CODBIN</div>
												<div class=percentage>DESCRIPCION</div>
												<div class="serial">HUMEDAD</div>
												<div class="serial">FECHAREG</div>
												<div class="serial">SALIDA</div>
											</div>
											<% while (it.hasNext()){
												/* ----------------------------------------------- */
												DTOHumedad obj = (DTOHumedad) it.next();
												/* ----------------------------------------------- */
												id = obj.getId();
												codAndamio = obj.getCodAndamio(); 
												codBin = obj.getCodBin();
												factorH = obj.getHumedad(); 
												fechaR = obj.getFechaRegistro(); 
												descR = obj.getDescripcion();
												sale = obj.getSalida();
												%>
												<div class="table-row">
												<div class="serial"><%=codAndamio%></div>
												<div class="serial"><%=codBin%></div>
												<div class="percentage"><%=descR%></div>
												<div class="serial"><%=factorH%>%</div>
												<div class="serial"><%=fechaR%></div>
												<%
												if (sale.equals("OK")){%>
													<div class="serial"><h5><%=sale%></h5></div>
												<%} else {%>
													<div class="serial"><%=sale%></div>
												<%}%>
											</div> 
										<%}%>
								    </div>
								</div>
							</div>
						</div>		
					</div>
				</div>	
			</section>
		<!-- end contact Area  -->
		<%@ include file="../../convenios/inc/foot.inc"%>	
		<%} else {%>		
			<%@ include file="../../convenios/inc/header.inc"%> 
				<div class="container">
					<div class="section-top-border">
						<h3 class="mb-30">&nbsp;&nbsp;&nbsp;Humedad Registrada</h3>
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No existen registros para Render Andamios</h5>	
					</div>
				</div>		
			<%@ include file="../../convenios/inc/foot.inc"%>
		<%
	}		
%>