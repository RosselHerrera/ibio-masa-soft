<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOconvenios" %>

<%
String TipoConvenio = request.getParameter("conveniotipo");
/* System.out.println(TipoConvenio); */
String RazonConvenio = request.getParameter("razonconvenio");
/* System.out.println(RazonConvenio); */
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
/* System.out.println(fecha); */
	/* --------------------------------------------------- */
	MantenedorConvenios convenio = new MantenedorConvenios();
	/* ----- obtiene correlativo convenio ---- */
	int id = convenio.identidad("eiconvenios");
	/* --------------------------------------------------- */
	/* System.out.println(id); */
	if (id==0) { 
		id = 1000;
	}else{
		id = id + 1000;
	}
	/* --------------------------------------------------- */
%>
<%@ include file="../../convenios/inc/header.inc"%> 
		<section class="contact-area section-gap" id="contact">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div class="menu-content pb-60 col-lg-4">
						<div class="title text-center">
							<h2 class="mb-10">Energ&iacute;a Inteligente</h2>
							<p>Te ayudamos con tu ecosistema tecnológico.</p>
							<h3><%=TipoConvenio%></h3>
							<br>
							<form class="form-area" id="convenioForm" name="convenioForm" action="procesaconvenio.jsp" method="post">
								<div class="row">
									<div class="form-group">
										<input id="bconvenio" name="bconvenio" placeholder="rut razón asociado al Convenio" onfocus="this.placeholder = ''" onblur="this.placeholder = 'rut razón asociado al Convenio'" class="common-input mb-20 form-control" required="" type="text" oninput="checkRut(this)">
										<input id="fonoconvenio" name="fonoconvenio" placeholder="fono institución asociado al Convenio" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Ingresa fono institución asociado convenio'" class="common-input mb-20 form-control" required="" type="text">
										<button class="primary-btn mt-20">Actualiza Vigencia y Convenio<span class="lnr lnr-arrow-right"></span></button>
									</div>
								</div>
								<input id="tipoconvenio" name="tipoconvenio" type="hidden" value="<%=TipoConvenio%>">
								<input id="numconvenio" name="numconvenio" type="hidden" value="<%=id%>">
								<input id="razonconvenio" name="razonconvenio" type="hidden" value="<%=RazonConvenio%>">	
							</form>	
						</div>	
					</div>		
				</div>
			</div>
		</section>
<%@ include file="../../convenios/inc/foot.inc"%>
     <script src="../../convenios/js/validarRUT.js"></script>