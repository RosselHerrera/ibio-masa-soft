<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOconvenios" %>

<%
String Tipoconvenio = request.getParameter("tipoconvenio");
/* System.out.println(Tipoconvenio); */
/* --------------------------------------------------- */
String NumConvenio = request.getParameter("numconvenio");
/* System.out.println(NumConvenio); */
/* --------------------------------------------------- */
String RutConvenio = request.getParameter("bconvenio");
/* System.out.println(RutConvenio); */
/* --------------------------------------------------- */
String RazonConvenio = request.getParameter("razonconvenio");
/* System.out.println(RazonConvenio); */
/* --------------------------------------------------- */
String FonoConvenio = request.getParameter("fonoconvenio");
/* System.out.println(FonoConvenio); */
/* --------------------------------------------------- */
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
/* System.out.println(fecha); */

	/* --------------------------------------------------- */
	/* MantenedorConvenios convenio = new MantenedorConvenios(); */
	/* ----- obtiene correlativo convenio ---- */
	/* int id = convenio.identidad("eiconvenios"); */
	/* --------------------------------------------------- */
	/* System.out.println(id); */
	/* --------------------------------------------------- */	
	
%>
<%@ include file="../../convenios/inc/header.inc"%> 
		<!-- start contact Area -->
		<section class="contact-area section-gap" id="contact">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div class="menu-content pb-60 col-lg-8">
						
						<div class="title text-center">
							<h2 class="mb-10">Convenio de Servicios de Energ&iacute;a Inteligente</h2>
							<p>Te ayudamos con tu ecosistema tecnológico.</p>
							<p>El presente convenio establece un valor lista preferencial, correspondiente a la compra de mas de 10 unidades de MT3 de producto, renovable con acuerdo de las partes sin costes adicionales para la instituci&oacute;n asociada en convenio con Energ&iacute;ainteligente LTDA.</p>
						</div>
						
						<form class="form-area " id="qrForm" name="qrForm" action="regconvenio.jsp" method="post" class="contact-form text-right">
							<div class="row">
								<div class="col-lg-6 form-group">
									<input id="numconveniod" name="numconveniod" class="common-input mb-20 form-control" disabled type="text" value="<%=NumConvenio%>">
									<input id="fonoconveniod" name="fonoconveniod" class="common-input mb-20 form-control" disabled type="text" value="<%=FonoConvenio%>">
									<div align="center">
										Fecha de Vigencia Convenio
										<input id="datepicker" name="datepicker" value="2018-08-14" width="340" />
									    <script>
									        $('#datepicker').datepicker({
									        	format: 'yyyy-mm-dd'  
									        });
									    </script>    
								    </div>	
								</div>
								
								<div class="col-lg-6 form-group">
									<input id="bemail" name="bemail" placeholder="email institución asociado al Convenio" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Ingresa email asociado al Convenio'" class="common-input mb-20 form-control" required="" type="email">
									<input id="bconveniod" name="bconveniod" class="common-input mb-20 form-control" disabled type="text" value="<%=RutConvenio%>">
									<button class="primary-btn mt-20">Actualiza Vigencia y Convenio<span class="lnr lnr-arrow-right"></span></button>
								</div>
								<div class="info"></div>
							</div>	
							<input id="tipoconvenio" name="tipoconvenio" type="hidden" value="<%=Tipoconvenio%>">
							<input id="numconvenio" name="numconvenio" type="hidden" value="<%=NumConvenio%>">
							<input id="rutconvenio" name="rutconvenio" type="hidden" value="<%=RutConvenio%>">
							<input id="razonconvenio" name="razonconvenio" type="hidden" value="<%=RazonConvenio%>">
							<input id="fonoconvenio" name="fonoconvenio" type="hidden" value="<%=FonoConvenio%>">
						</form>	
						
					</div>		
				</div>
			</div>	
		</section>
		<!-- end contact Area -->
<%@ include file="../../convenios/inc/foot.inc"%>