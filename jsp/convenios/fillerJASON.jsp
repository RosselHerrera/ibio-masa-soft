<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOMovimientos" %>
<%
int idDoc; 
String  fillerJASON = "";
String  eistkFechamovimiento = "";
	
	/* --------------------------------------------------- */
	MantenedorConvenios filler = new MantenedorConvenios();
	/* --------------------------------------------------- */
		idDoc = 1082;
		ArrayList ListaFillerJSON = filler.ListaFillerJSON(idDoc);
		Iterator it = ListaFillerJSON.iterator();   
	    if (it.hasNext()) { %>
	    <%@ include file="../../convenios/inc/header.inc"%>
	    <% while (it.hasNext()){
			/* ----------------------------------------------- */
			DTOMovimientos obj = (DTOMovimientos) it.next();
			/* ----------------------------------------------- */
			eistkFechamovimiento = obj.getEifechamovimiento();
			fillerJASON = obj.getEifiller();%>
			<div class="country"><%=eistkFechamovimiento%></div>
			<div class="serial"><%=fillerJASON%></div>
		<%}
		}else{%>		
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