-- ************************
-- Movimientos por fecha --
-- ************************
SELECT
`eistkmovfechacv`.`ideistkMovfechaCV`,
`eistkmovfechacv`.`eistkcodigoP`,
`eistkmovfechacv`.`eistktipodoc`,
`eistkmovfechacv`.`eistkrut`,
`eistkmovfechacv`.`eistknumdoc`,
`eistkmovfechacv`.`eistkfechamovimiento`,
`eistkmovfechacv`.`eistkunidadesP`,
`eistkmovfechacv`.`eistkfiller`,
`eistkmovfechacv`.`humedad`,
`eistkmovfechacv`.`distancia`,
`eistkmovfechacv`.`transporte`,
`eistkmovfechacv`.`valor`,
`eistkmovfechacv`.`valoragregado`
FROM `orgdata`.`eistkmovfechacv`
WHERE (eistkfechamovimiento BETWEEN '2018-09-30 00:00:00' AND '2018-10-05 00:00:00') 
AND (eistktipodoc = 'GUIAINT');

-- ********************************
-- Movimientos boletas por fecha -- 
-- ********************************
SELECT  `boletasconvenio`.`idboletasconvenio` ,  `boletasconvenio`.`boleta` ,  `boletasconvenio`.`codInstitucion` , `boletasconvenio`.`neto` ,  `boletasconvenio`.`iva` ,  `boletasconvenio`.`totalBoleta` ,  `boletasconvenio`.`filler` 
FROM  `orgdata`.`boletasconvenio` 
WHERE (filler BETWEEN  '2018-10-08 00:00:00' AND  '2018-10-11 00:00:00');



 