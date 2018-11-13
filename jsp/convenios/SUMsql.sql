SELECT SUM(totalBoleta) AS TotalBoletas 
FROM `boletasconvenio` 
WHERE (filler BETWEEN  '2018-10-24 00:00:00' AND '2018-10-01 00:00:00');




SELECT  `boletasconvenio`.`idboletasconvenio` ,  `boletasconvenio`.`boleta` ,  `boletasconvenio`.`codInstitucion` , `boletasconvenio`.`neto` ,  `boletasconvenio`.`iva` ,  `boletasconvenio`.`totalBoleta` ,  `boletasconvenio`.`filler` 
FROM  `orgdata`.`boletasconvenio` 
WHERE (filler BETWEEN  '2018-10-08 00:00:00' AND  '2018-10-11 00:00:00');