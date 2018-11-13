/* --------------------------------------------------- */
	try{ 
		/* --- Registra Movimiento 12.09.2018 ---- */
		Ret = convenio.GrabaMovimiento(id, CodProducto,	Documento, Rutconvenio, iNumdoc, fecha, iQty, Observaciones, humedad, iIva, Transporte, iPrecio, iPreciot);
		/* --- Registra Movimiento 30.09.2018 ------------------------------- */
		if (Ret==1){
			id = id +1; 
			Ret1 = convenio.GrabaMovimiento(id, CodProducto1,	Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio1, iPreciot1);
		}
		/* --- Registra Movimiento 30.09.2018 ------------------------------- */
		if (Ret1==1){
			id = id +1;
			Ret2 = convenio.GrabaMovimiento(id, CodProducto2, Documento, Rutconvenio, iNumdoc, fecha, iQty2, Observaciones, humedad, iIva, Transporte, iPrecio2, iPreciot2);
		}
		/* -------------------------------------------------- */	
		}catch (Exception e) { 
		 	e.printStackTrace(); 
		} 
		/* --------------------------------------------------- */
	} else if ((iQty!=0) && (iQty1!=0) && (iQty2==0)){		
		/* ----- obtiene correlativo movimiento ---- */
		int id = convenio.identidad("eistkmovfechacv");
		/* ----------------------------------------- */
		if (id==0) { 
			id = 5000;
		}else{
			id = id + 5001;
		}
		/* --------------------------------------------------- */
		try{ 
			/* --- Registra Movimiento 12.09.2018 ---- */
			Ret = convenio.GrabaMovimiento(id, CodProducto,	Documento, Rutconvenio, iNumdoc, fecha, iQty, Observaciones, humedad, iIva, Transporte, iPrecio, iPreciot);
			/* --- Registra Movimiento 30.09.2018 ------------------------------- */		
			if (Ret==1){
				id = id +1;
				Ret1 = convenio.GrabaMovimiento(id, CodProducto1, Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio1, iPreciot1);
			}
		/* --- Registra Movimiento 30.09.2018 ------------------------------- */
		}catch (Exception e) { 
		 	e.printStackTrace(); 
		} 	
	} else if ((iQty!=0) && (iQty1==0) && (iQty2!=0)){		
		/* ----- obtiene correlativo movimiento ---- */
		int id = convenio.identidad("eistkmovfechacv");
		/* ----------------------------------------- */
		if (id==0) { 
			id = 5000;
		}else{
			id = id + 5001;
		}		
		/* --------------------------------------------------- */
		try{ 
			/* --- Registra Movimiento 12.09.2018 ---- */
			Ret = convenio.GrabaMovimiento(id, CodProducto1, Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio, iPreciot1);

			/* --- Registra Movimiento 30.09.2018 ------------------------------- */
			if (Ret==1){
				id = id +1;
				Ret2 = convenio.GrabaMovimiento(id, CodProducto2, Documento, Rutconvenio, iNumdoc, fecha, iQty2, Observaciones, humedad, iIva, Transporte, iPrecio2, iPreciot2);
			}
		/* -------------------------------------------------- */	
		}catch (Exception e) { 
		 	e.printStackTrace(); 
		} 
		/* --------------------------------------------------- */	
	} else if ((iQty!=0) && (iQty1==0) && (iQty2==0)){
		/* ----- obtiene correlativo movimiento ---- */
		int id = convenio.identidad("eistkmovfechacv");
		/* ----------------------------------------- */
		if (id==0) { 
			id = 5000;
		}else{
			id = id + 5001;
		}		
		/* --------------------------------------------------- */
		try{ 
			/* --- Registra Movimiento 12.09.2018 ---- */
			Ret = convenio.GrabaMovimiento(id, CodProducto, Documento, Rutconvenio, iNumdoc, fecha, iQty, Observaciones, humedad, iIva, Transporte, iPrecio, iPreciot);
		/* -------------------------------------------------- */	
		}catch (Exception e) { 
		 	e.printStackTrace(); 
		} 
		/* --------------------------------------------------- */
	} else if ((iQty==0) && (iQty1==0) && (iQty2!=0)){		
		/* ----- obtiene correlativo movimiento ---- */
		int id = convenio.identidad("eistkmovfechacv");
		/* ----------------------------------------- */
		if (id==0) { 
			id = 5000;
		}else{
			id = id + 5001;
		}
		try{ 			
			Ret2 = convenio.GrabaMovimiento(id, CodProducto2, Documento, Rutconvenio, iNumdoc, fecha, iQty2, Observaciones, humedad, iIva, Transporte, iPrecio2, iPreciot2);
		/* --------------------------------------------------- */	
		} catch (Exception e) { 
		 	e.printStackTrace(); 
		} 
		/* ---------------------------------------------------- */
	}else if ((iQty==0) && (iQty1!=0) && (iQty2!=0)){	
		/* ----- obtiene correlativo movimiento ---- */
		int id = convenio.identidad("eistkmovfechacv");
		/* ----------------------------------------- */
		if (id==0) { 
			id = 5000;
		}else{
			id = id + 5001;
		}		
		/* --------------------------------------------------- */
		try{ 			
			Ret1 = convenio.GrabaMovimiento(id, CodProducto1, Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio1, iPreciot1);
			/* ---------------------------------- */
			if (Ret1==1){
				id = id +1;
				Ret2 = convenio.GrabaMovimiento(id, CodProducto2, Documento, Rutconvenio, iNumdoc, fecha, iQty2, Observaciones, humedad, iIva, Transporte, iPrecio2, iPreciot2);
				}			
		/* -------------------------------------------------- */	
		}catch (Exception e) { 
		 	e.printStackTrace(); 
		} 
		/* --------------------------------------------------- */
   }else if ((iQty==0) && (iQty1!=0) && (iQty2==0)){		
		/* ----- obtiene correlativo movimiento ---- */
		int id = convenio.identidad("eistkmovfechacv");
		/* ----------------------------------------- */
		if (id==0) { 
			id = 5000;
		}else{
			id = id + 5001;
		}
		/* --------------------------------------------------- */
		try{ 
			Ret1 = convenio.GrabaMovimiento(id, CodProducto1, Documento, Rutconvenio, iNumdoc, fecha, iQty1, Observaciones, humedad, iIva, Transporte, iPrecio1, iPreciot1);
		/* -------------------------------------------------- */	
		} catch (Exception e) { 
		 	e.printStackTrace(); 
		} 
		/* --------------------------------------------------- */
