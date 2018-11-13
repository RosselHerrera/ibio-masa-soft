<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*, java.text.*" session="true" %>
<%@ page import = "cl.energiainteligente.convenios.MantenedorConvenios" %>
<%@ page import = "cl.escritorio.persistencia.DBConectJDBC" %>
<%@ page import = "cl.energiainteligente.dto.DTOProdStock" %>

<%
String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

int idstk; 
String	stkcodP = ""; 
String  stkDesc = ""; 
String  stkFill = ""; 
int  stkprecio; 
int  stkP;


String  FILLER = "";

	/* --------------------------------------------------- */
	MantenedorConvenios stocks = new MantenedorConvenios();
	/* --------------------------------------------------- */
	ArrayList ListaProdStock = stocks.ListaProdStock();
    Iterator it = ListaProdStock.iterator();
    
	    if (it.hasNext()) { %>
	    
		<%@ include file="../../convenios/inc/header.inc"%>
			<!-- start contact Area -->
			<section>
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-10">
							<div class="title text-center">
								<h2 class="mb-10">Productos en Stock</h2>
								<p>Te ayudamos con tu ecosistema tecnológico.</p>
									<h3 class="mb-10">Stocks Registrados</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="serial">CODPROD</div>
												<div class=percentage>DESCRIPCION</div>
												<div class="country">PRECIO (REFERENCIAL)</div>
												<div class="serial">UNIDADES</div>
											</div>
											<% while (it.hasNext()){
												/* ----------------------------------------------- */
												DTOProdStock obj = (DTOProdStock) it.next();
												/* ----------------------------------------------- */
												idstk = obj.getIdstk();
												stkcodP = obj.getStkcodigoP(); 
												stkDesc = obj.getStkdescripcion();
												stkFill = obj.getStkfiller(); 
												stkprecio = obj.getStkprecio(); 
												stkP = obj.getStkP();%>
												<div class="table-row">
												<div class="serial"><%=stkcodP%></div>
												<div class="percentage"><%=stkDesc%></div>
												<div class="country"><%=stkprecio%></div>
												<div class="serial"><%=stkP%></div>
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
						<h3 class="mb-30">&nbsp;&nbsp;&nbsp;Stocks Registrados</h3>
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Falló Render Stocks</h5>	
					</div>
				</div>		
			<%@ include file="../../convenios/inc/foot.inc"%>
		<%
	}		
%>