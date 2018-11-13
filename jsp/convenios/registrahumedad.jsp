<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOHumedad" %>

<%
/* --------------------------------------------------- */

String salida = "NOK";

String Andamio = request.getParameter("andamio");
System.out.println(Andamio);  
/* --------------------------------------------------- */
String Bines = request.getParameter("bines");
System.out.println(Bines);
/* --------------------------------------------------- */
String Humedad = request.getParameter("humedad");
System.out.println(Humedad); 
/* --------------------------------------------------- */
int hume = Integer.parseInt(Humedad);
if (hume <= 24) salida = "OK";
/* --------------------------------------------------- */
String Description = request.getParameter("descripcion");
System.out.println(Description); 
/* --------------------------------------------------- */
String FechaReg = request.getParameter("datepicker");
System.out.println(FechaReg);
/* --------------------------------------------------- */
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
int Ret = 0;
	/* --------------------------------------------------- */
	MantenedorConvenios convenio = new MantenedorConvenios();
	/* --------------------------------------------------- */
	/* ----- obtiene correlativo movimiento ---- */
	int id = convenio.identidad("eistkRegAndBin");
	/* ----------------------------------------- */
	if (id==0) { 
		id = 3000;
	}else{
		id = id + 3001;
	}
	/* --------------------------------------------------- */
	try{ 
		/* --------- Registra Humedad en Andamios -------- */
		Ret = convenio.GrabaRegistroHumedad(id, 
											 Andamio, 
											  Bines, 
											   Humedad, 
											    FechaReg, 
											     Description, 
											      salida);
		/* ----------------------------------------------- */
	}catch (Exception e) { 
	 	e.printStackTrace(); 
	} 	
	/* --------------------------------------------------- */
%>


<%@ include file="../../convenios/inc/header.inc"%>

<!-- start contact Area -->
	<section class="contact-area section-gap" id="contact">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-60 col-lg-8">
					<div class="title text-center">
						<h2 class="mb-10">Registro % de Humedad en Bines</h2>
						<p>Te ayudamos con tu ecosistema tecnológico.</p>
						<div class="row">
							<div class="col-lg-6 form-group">
								<input id="1" name="1" class="common-input mb-10 form-control" disabled type="text" value="Andamio:">
								<input id="2" name="2" class="common-input mb-10 form-control" disabled type="text" value="Bin:">
								<input id="3" name="3" class="common-input mb-10 form-control" disabled type="text" value="% Humedad:">
								<input id="4" name="4" class="common-input mb-10 form-control" disabled type="text" value="Observación:">
								<input id="5" name="5" class="common-input mb-10 form-control" disabled type="text" value="Fecha Registro:">
							</div>
							<div class="col-lg-6 form-group">
								<input id="7" name="7" class="common-input mb-10 form-control" disabled type="text" value="<%=Andamio%>">
								<input id="8" name="8" class="common-input mb-10 form-control" disabled type="text" value="<%=Bines%>">
								<input id="9" name="9" class="common-input mb-10 form-control" disabled type="text" value="<%=Humedad%>">
								<input id="10" name="10" class="common-input mb-10 form-control" disabled type="text" value="<%=Description%>">
								<input id="11" name="11" class="common-input mb-10 form-control" disabled type="text" value="<%=FechaReg%>">
							</div>	
						</div>
					</div>
				</div>		
			</div>
		</div>	
	</section>
	<!-- end contact Area -->


<%@ include file="../../convenios/inc/foot.inc"%>