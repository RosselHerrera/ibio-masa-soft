<%@ page language = "java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOconvenios" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

int idconv; 
String	eirut = ""; 
String  eirazonsocial = ""; 
String  eiemail = ""; 
String  eifono = ""; 
String  eifechavigencia = "";
String  eimensaje = ""; 

String  FILLER = ""; 
	/* --------------------------------------------------- */
	MantenedorConvenios convenio = new MantenedorConvenios();
	/* --------------------------------------------------- */
	ArrayList ListaConvenios = convenio.ListaConvenios();
    Iterator it = ListaConvenios.iterator();
    
	    if (it.hasNext()) { %>

		<%@ include file="../../convenios/inc/header.inc"%> 
				
			<section>
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-12">
							<div class="title text-center">
								<h2 class="mb-10">Convenios de Servicios</h2>
								<p>Te ayudamos con tu ecosistema tecnológico.</p>
								<!-- <div class="section-top-border"> -->
									<h3 class="mb-10">Convenios Registrados</h3>
										<div class="progress-table-wrap">
											<div class="progress-table">
												<div class="table-head">
													<div class="serial"># CONV</div>
													<div class=percentage>RAZON SOCIAL</div>
													<div class="country">CORREO ELECTRONICO</div>
													<div class="serial">VIGENCIA</div>
												</div>
												<% while (it.hasNext()){
												/* ----------------------------------------------- */
												DTOconvenios obj = (DTOconvenios) it.next();
												/* ----------------------------------------------- */
												idconv = obj.getIdeiconvenios();
												eirut = obj.getEirut(); 
												eirazonsocial = obj.getEirazonsocial();
												eiemail = obj.getEiemail(); 
												eifono = obj.getEifono(); 
												eifechavigencia = obj.getEifechavigencia();
												eimensaje = obj.getEimensaje();%>
												<div class="table-row">
												<div class="serial"><%=idconv%></div>
												<div class="percentage"><%=eirazonsocial%></div>
												<div class="country"><%=eiemail%></div>
												<div class="serial"><%=eifechavigencia%></div>
								            </div> 
										    <%} /* END WHILE*/ %>
								      </div>
							</div>
						</div>			
					</div>
				</div> 
			</section>
						
			<%@ include file="../../convenios/inc/foot.inc"%>
		<%} else {%>		
			<%@ include file="../../convenios/inc/header.inc"%> 
				<div class="container">
					<div class="section-top-border">
						<h3 class="mb-30">&nbsp;&nbsp;&nbsp;Convenios Registrados</h3>
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Falló Render Convenios</h5>	
					</div>
				</div>		
			<%@ include file="../../convenios/inc/foot.inc"%>
		<%
	}		
%>
		
		
		
				