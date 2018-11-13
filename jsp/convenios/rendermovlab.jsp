<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.energiainteligente.dto.DTOMovimientos" %>
<%@ page import = "cl.energiainteligente.laboratorio.RegistroLaboratorio" %>
<%@ page import = "cl.energiainteligente.dto.DTOLaboratorio" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>

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
/* -Laboratorio------------------------------------------------- */
	int labid = 0;
	int labidmov = 0;
	String labfecha = "";
	String labnumdoc = "";
	String laboperador = "";
	int labordencompra = 0;
	String labtipolenacarga = "";
	String labcantidad = "";
	String labobservaciones = "";
	String labfiller = "";
/* --------------------------------------------------------------- */
	String  FILLER = "";
	/* --------------------------------------------------- */
	RegistroLaboratorio laboratorio = new RegistroLaboratorio();
	/* --------------------------------------------------- */
	/* obtiene ultimo correlativo desde el movimiento en eistkmovfechacv*/
	int id = laboratorio.identidad("eistkmovfechacv");
	/* ----------------------------------------- */
	if (id==0) { 
		id = 1000;
	}else{
		id = id + 1000;
	}
	/* --------------------------------------------------- */
	MantenedorConvenios movimiento = new MantenedorConvenios();
	/* --------------------------------------------------------------- */
		ArrayList ListaMovimientos = movimiento.ListaMovimientos("LHCAM","COMPRA");
		Iterator it = ListaMovimientos.iterator();   
	    if (it.hasNext()) { %> 
	    <%@ include file="../../convenios/inc/header.inc"%>
	    <h3 class="mb-10">Movimientos F&iacute;sicos Registrados</h3>
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">IDMOV</div>
					<div class=serial>NUMDOC</div>
					<div class="serial">CODPROD</div>
					<div class=serial>TIPODOC</div>
					<!-- <div class=country>RUT MOVIMIENTO</div> -->
					<div class="country">FECHA HORA MOVIMIENTO</div>
					<div class="serial">UNIDADES</div>
					<!-- <div class="serial">%HUMEDAD</div> -->
					<!-- <div class="serial">PRECIO</div> -->
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
						<div class="serial">
							<a href="registramovlab.jsp?idMov=<%=idmov%>"><%=idmov%></a>
							<%-- <input type="hidden" id="idmov" name="idmov" value='<%=idmov%>'> --%>
						</div>
						<div class="serial"><%=eistkNumdoc%></div>
						<div class="serial"><%=eistkcodP%></div>
						<div class="serial"><%=eistktipdoc%></div>
						<%-- <div class="country"><%=eistkRut%></div> --%>
						<div class="country"><%=eistkFechamovimiento%></div>
						<div class="serial"><%=eistkUnidadesP%></div>
						<%-- <div class="serial"><%=iHumedad + "%"%></div> --%>
						<%-- <div class="serial"><%=ivalor%></div> --%>
					</div>	
		    	<%}%>
		   </div>
		</div> 
	    <%@ include file="../../convenios/inc/foot.inc"%>	
		<%} else {%>		
			<%@ include file="../../convenios/inc/header.inc"%> 
				<div class="container">
					<div class="section-top-border">
						<h3 class="mb-30">&nbsp;&nbsp;&nbsp;Movimientos Registrados</h3>
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Falló Render Movimientos</h5>	
					</div>
				</div>		
			<%@ include file="../../convenios/inc/foot.inc"%>
		<%
	}		
%>