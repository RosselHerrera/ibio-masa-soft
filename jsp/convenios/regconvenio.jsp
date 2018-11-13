<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOconvenios" %>

<%
int Ret = 0;
String Tipoconvenio = request.getParameter("tipoconvenio");
/* System.out.println(Tipoconvenio); */
/* --------------------------------------------------- */
String NumConvenio = request.getParameter("numconvenio");
/* System.out.println(NumConvenio); */
/* --------------------------------------------------- */
int numConv = Integer.parseInt(NumConvenio);
/* --------------------------------------------------- */
String RutConvenio = request.getParameter("rutconvenio");
/* System.out.println(RutConvenio); */
/* --------------------------------------------------- */
String RazonConvenio = request.getParameter("razonconvenio");
/* System.out.println(RazonConvenio); */
/* --------------------------------------------------- */
String FonoConvenio = request.getParameter("fonoconvenio");
/* System.out.println(FonoConvenio); */
/* --------------------------------------------------- */
String EmailConvenio = request.getParameter("bemail");
/* System.out.println(EmailConvenio); */
/* --------------------------------------------------- */
String VigenciaConvenio = request.getParameter("datepicker");
/* System.out.println(VigenciaConvenio); */
/* --------------------------------------------------- */
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
/* System.out.println(fecha); */

	/* --------------------------------------------------- */
	MantenedorConvenios convenio = new MantenedorConvenios();
	/* --------------------------------------------------- */
	try{
		/* ----- Registra convenio ---- */
		Ret = convenio.GrabaConvenio(numConv, 
										RutConvenio, 
											RazonConvenio, 
												EmailConvenio, 
													FonoConvenio, 
														VigenciaConvenio, 
															Tipoconvenio);
		/* ------------------------------------------------------------- */
		/* ------------------------------------------------------------- */	
	}catch (Exception e) {
		e.printStackTrace();
	}	
%>
<!-- /* ------------------------------------ */ -->
<%@ include file="../../convenios/inc/header.inc"%>
	<!-- start contact Area -->
	<section class="contact-area section-gap" id="contact">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-60 col-lg-8">
					<div class="title text-center">
						<h2 class="mb-10">Convenio de Servicios de Energ&iacute;a Inteligente</h2>
						<p>Te ayudamos con tu ecosistema tecnológico.</p>
						<div class="row">
							<div class="col-lg-6 form-group">
								<input id="1" name="1" class="common-input mb-10 form-control" disabled type="text" value="Tipo de Convenio:">
								<input id="2" name="2" class="common-input mb-10 form-control" disabled type="text" value="Rut de Convenio:">
								<input id="3" name="3" class="common-input mb-10 form-control" disabled type="text" value="Raz&oacute;n Social:">
								<input id="4" name="4" class="common-input mb-10 form-control" disabled type="text" value="Correo electr&oacute;nico:">
								<input id="5" name="5" class="common-input mb-10 form-control" disabled type="text" value="Tel&eacute;fono:">
								<input id="6" name="6" class="common-input mb-10 form-control" disabled type="text" value="Fecha Vigencia:">
							</div>
							<div class="col-lg-6 form-group">
								<input id="7" name="7" class="common-input mb-10 form-control" disabled type="text" value="<%=numConv%><%=": " + Tipoconvenio%>">
								<input id="8" name="8" class="common-input mb-10 form-control" disabled type="text" value="<%=RutConvenio%>">
								<input id="9" name="9" class="common-input mb-10 form-control" disabled type="text" value="<%=RazonConvenio%>">
								<input id="10" name="10" class="common-input mb-10 form-control" disabled type="text" value="<%=EmailConvenio%>">
								<input id="11" name="11" class="common-input mb-10 form-control" disabled type="text" value="<%=FonoConvenio%>">
								<input id="12" name="12" class="common-input mb-10 form-control" disabled type="text" value="<%=VigenciaConvenio%>">
							</div>	
						</div>
						
						<div class="row">
							<div class="col-lg-12 form-group">
								<a href="renderconvenio.jsp">
									<button class="primary-btn mt-1">Generar c&oacute;digo Salida<span class="lnr lnr-arrow-right"></span></button>
								</a>
								<div class="alert-msg">								
							</div>
						</div>	
					</div>
				</div>		
			</div>
		</div>	
	</section>
	<!-- end contact Area -->
<%@ include file="../../convenios/inc/foot.inc"%>
<!-- /* ----------------------------------- */ -->