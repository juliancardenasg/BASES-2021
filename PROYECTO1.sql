--Drop de las tablas
drop table multa;
drop table carro;
drop table conductor;

--Drop de las vistas
drop view MultasXAnnio; 
drop view MultasxElectrico; 
drop view MultasxNoElectrico; 

create table carro(
    id_carro NUMBER(7,0) NOT NULL,
    placa VARCHAR2(6) NOT NULL,
    marca VARCHAR2(70) NOT NULL,
    electrico VARCHAR2(2) NOT NULL,
    estado VARCHAR2(2) NOT NULL,
    constraint CHK_ESTADO CHECK (estado in('SI', 'NO')), 
    constraint CHK_ELECTRICO CHECK(electrico in('SI', 'NO')),
    primary key (id_carro)
);

CREATE TABLE conductor(
    id_conductor NUMBER(7,0) NOT NULL,
    cedula NUMBER(10,0) NOT NULL,
    nombre VARCHAR(90) NOT NULL,
    primary key (id_conductor)
);

CREATE TABLE multa(
    id_multa NUMBER(7,0) NOT NULL,
    valor_multa NUMBER (8,1) NOT NULL,
    id_carro NUMBER (7,0) NOT NULL,
    id_conductor NUMBER (7,0) NOT NULL,
    fecha DATE NOT NULL,
    primary key (id_multa),
    foreign key (id_carro) references Carro,
    foreign key (id_conductor) references Conductor
);


--Carros:
insert into carro values(9425178, 'HKW728', 'Mercedes Benz', 'SI', 'SI');
insert into carro values(9425179, 'RHR887', 'Renault', 'NO', 'SI');
insert into carro values(9425180, 'KOL980', 'Dodge', 'NO', 'SI');
insert into carro values(9425181, 'PAT903', 'Ford', 'SI', 'NO');
insert into carro values(9425182, 'WIN823', 'Toyota', 'NO', 'SI');
insert into carro values(9425183, 'WIN390', 'Honda', 'NO', 'SI');
insert into carro values(9425184, 'RLQ694', 'Lamborgini', 'SI', 'SI');
insert into carro values(9425185, 'HBA281', 'Lexus', 'SI', 'NO');
insert into carro values(9425186, 'EBA151', 'BMW', 'SI', 'SI');
insert into carro values(9425187, 'KBA304', 'KIA', 'NO', 'SI');
commit; 

--Conductores:
insert into conductor values(1193018, 1003451324,'Juan Pablo Fernandez Becerra');
insert into conductor values(1193019, 1193072143,'David Gabriel Meneses Arroyo');
insert into conductor values(1193020, 94251789,'Cristian Sebastian Vargas Benitez');
insert into conductor values(1193021, 100034532,'Jorge Miguel Alboroto Avila');
insert into conductor values(1193022, 13021122,'David Bolivar Perez');
insert into conductor values(1193023, 109283212,'Karol Cebollos Torre');
insert into conductor values(1193024, 134729821,'Paul Matinez Coral');
insert into conductor values(1193025, 82910111,'Pedro Raul Barrera');
insert into conductor values(1193026, 97262132,'Barbara Naranjo Quintana');
insert into conductor values(1193027, 193021121,'Manuela Carrillo Sanabria');
insert into conductor values(1193028, 193021122,'German Julian Burgos Arroyo');
commit; 

--Multas:
insert into multa values( 2382133,1100000,9425187,1193028, to_date('08/02/2021','dd/mm/yyyy'));
insert into multa values( 2382132,1100000,9425186,1193028, to_date('08/02/2021','dd/mm/yyyy'));
insert into multa values( 2382134,1100000,9425187,1193027, to_date('08/02/2021','dd/mm/yyyy'));
insert into multa values( 2382135,2900000,9425178,1193019, to_date('18/12/2020','dd/mm/yyyy'));
insert into multa values( 2382136,5500000,9425179,1193026, to_date('30/08/2020','dd/mm/yyyy'));
insert into multa values( 2382137,8040000,9425182,1193021, to_date('03/03/2021','dd/mm/yyyy'));
insert into multa values( 2382138,1280000,9425181,1193025, to_date('01/02/2021','dd/mm/yyyy'));
insert into multa values( 2382139,2100000,9425180,1193023, to_date('15/01/2021','dd/mm/yyyy'));
insert into multa values( 2382140,6500000,9425185,1193024, to_date('28/08/2020','dd/mm/yyyy'));
insert into multa values( 2382141,3480000,9425179,1193020, to_date('18/02/2021','dd/mm/yyyy'));
insert into multa values( 2382142,1390000,9425178,1193023, to_date('08/04/2020','dd/mm/yyyy'));
insert into multa values( 2382143,7800000,9425184,1193018, to_date('13/09/2020','dd/mm/yyyy'));
insert into multa values( 2382144,1200000,9425187,1193020, to_date('09/02/2019','dd/mm/yyyy'));
insert into multa values( 2382145,2850000,9425179,1193024, to_date('14/12/2018','dd/mm/yyyy'));
insert into multa values( 2382146,5460000,9425186,1193021, to_date('31/12/2019','dd/mm/yyyy'));
insert into multa values( 2382147,9560000,9425181,1193018, to_date('11/11/2020','dd/mm/yyyy'));
insert into multa values( 2382148,1340000,9425183,1193026, to_date('25/01/2021','dd/mm/yyyy'));
insert into multa values( 2382149,2300000,9425182,1193021, to_date('18/07/2020','dd/mm/yyyy'));
insert into multa values( 2382150,9700000,9425179,1193019, to_date('07/08/2019','dd/mm/yyyy'));
insert into multa values( 2382151,9800000,9425185,1193020, to_date('14/02/2021','dd/mm/yyyy'));
insert into multa values( 2382152,2700000,9425187,1193018, to_date('18/10/2020','dd/mm/yyyy'));
insert into multa values( 2382153,4600000,9425178,1193027, to_date('21/05/2020','dd/mm/yyyy'));
insert into multa values( 2382154,2150000,9425185,1193023, to_date('17/06/2019','dd/mm/yyyy'));
insert into multa values( 2382155,6780000,9425181,1193024, to_date('13/11/2020','dd/mm/yyyy'));
insert into multa values( 2382156,4300000,9425182,1193026, to_date('27/10/2019','dd/mm/yyyy'));
insert into multa values( 2382157,1700000,9425179,1193019, to_date('28/04/2020','dd/mm/yyyy'));
insert into multa values( 2382158,3480000,9425180,1193025, to_date('19/02/2021','dd/mm/yyyy'));
insert into multa values( 2382159,2380000,9425186,1193027, to_date('14/01/2021','dd/mm/yyyy'));
insert into multa values( 2382160,9820000,9425183,1193026, to_date('23/08/2019','dd/mm/yyyy'));
insert into multa values( 2382161,3300000,9425178,1193020, to_date('02/02/2021','dd/mm/yyyy'));
insert into multa values( 2382162,1500000,9425187,1193021, to_date('30/09/2020','dd/mm/yyyy'));
insert into multa values( 2382163,6400000,9425178,1193018, to_date('11/11/2020','dd/mm/yyyy'));
insert into multa values( 2382164,3000000,9425180,1193025, to_date('23/02/2021','dd/mm/yyyy'));
insert into multa values( 2382165,6000000,9425186,1193026, to_date('08/11/2020','dd/mm/yyyy'));
insert into multa values( 2382166,8900000,9425182,1193024, to_date('24/08/2020','dd/mm/yyyy'));
insert into multa values( 2382167,7000000,9425185,1193026, to_date('15/03/2019','dd/mm/yyyy'));
insert into multa values( 2382168,1800000,9425184,1193023, to_date('11/12/2020','dd/mm/yyyy'));
insert into multa values( 2382169,2550000,9425178,1193027, to_date('15/01/2020','dd/mm/yyyy'));
insert into multa values( 2382170,9000000,9425181,1193018, to_date('23/06/2020','dd/mm/yyyy'));
insert into multa values( 2382171,2800000,9425179,1193019, to_date('19/04/2020','dd/mm/yyyy'));
insert into multa values( 2382172,1200000,9425183,1193021, to_date('18/01/2020','dd/mm/yyyy'));
insert into multa values( 2382173,9900000,9425181,1193020, to_date('12/07/2020','dd/mm/yyyy'));
insert into multa values( 2382174,1590000,9425186,1193023, to_date('27/07/2020','dd/mm/yyyy'));
insert into multa values( 2382175,7300000,9425183,1193027, to_date('19/12/2020','dd/mm/yyyy'));
insert into multa values( 2382176,5800000,9425178,1193025, to_date('31/07/2020','dd/mm/yyyy'));
insert into multa values( 2382177,8600000,9425184,1193026, to_date('06/12/2020','dd/mm/yyyy'));
insert into multa values( 2382178,9080000,9425179,1193018, to_date('26/02/2019','dd/mm/yyyy'));
insert into multa values( 2382179,2100000,9425180,1193026, to_date('15/02/2021','dd/mm/yyyy'));
insert into multa values( 2382180,6500000,9425182,1193021, to_date('28/08/2020','dd/mm/yyyy'));
insert into multa values( 2382181,3480000,9425187,1193027, to_date('16/01/2021','dd/mm/yyyy'));
insert into multa values( 2382182,1390000,9425179,1193026, to_date('09/04/2019','dd/mm/yyyy'));
insert into multa values( 2382183,7800000,9425185,1193025, to_date('23/09/2020','dd/mm/yyyy'));
insert into multa values( 2382184,7000000,9425182,1193020, to_date('29/01/2021','dd/mm/yyyy'));
insert into multa values( 2382185,2900000,9425184,1193023, to_date('07/12/2020','dd/mm/yyyy'));
insert into multa values( 2382186,5500000,9425186,1193019, to_date('30/05/2020','dd/mm/yyyy'));
insert into multa values( 2382187,8040000,9425180,1193018, to_date('05/03/2021','dd/mm/yyyy'));
insert into multa values( 2382188,1280000,9425181,1193024, to_date('01/02/2021','dd/mm/yyyy'));
insert into multa values( 2382189,2100000,9425178,1193026, to_date('10/01/2021','dd/mm/yyyy'));
insert into multa values( 2382190,6500000,9425185,1193027, to_date('18/08/2018','dd/mm/yyyy'));
insert into multa values( 2382191,3480000,9425179,1193021, to_date('20/02/2021','dd/mm/yyyy'));
insert into multa values( 2382192,1390000,9425187,1193020, to_date('08/09/2020','dd/mm/yyyy'));
insert into multa values( 2382193,7800000,9425185,1193023, to_date('13/09/2019','dd/mm/yyyy'));
insert into multa values( 2382194,2000000,9425184,1193025, to_date('08/03/2021','dd/mm/yyyy'));
insert into multa values( 2382195,2900000,9425182,1193019, to_date('16/02/2020','dd/mm/yyyy'));
insert into multa values( 2382196,5500000,9425178,1193026, to_date('31/08/2018','dd/mm/yyyy'));
insert into multa values( 2382197,9204000,9425180,1193023, to_date('03/03/2021','dd/mm/yyyy'));
insert into multa values( 2382198,1280000,9425181,1193025, to_date('04/02/2020','dd/mm/yyyy'));
insert into multa values( 2382199,2100000,9425181,1193018, to_date('19/01/2019','dd/mm/yyyy'));
insert into multa values( 2382200,6500000,9425183,1193025, to_date('28/08/2020','dd/mm/yyyy'));
insert into multa values( 2382201,3480000,9425178,1193019, to_date('18/02/2021','dd/mm/yyyy'));
insert into multa values( 2382202,1390000,9425179,1193023, to_date('05/04/2020','dd/mm/yyyy'));
insert into multa values( 2382203,7800000,9425187,1193027, to_date('01/09/2020','dd/mm/yyyy'));
insert into multa values( 2382204,1800000,9425183,1193025, to_date('23/05/2020','dd/mm/yyyy'));
insert into multa values( 2382205,2900000,9425182,1193026, to_date('30/11/2020','dd/mm/yyyy'));
insert into multa values( 2382206,5500000,9425184,1193024, to_date('30/07/2019','dd/mm/yyyy'));
insert into multa values( 2382207,3940000,9425185,1193021, to_date('03/07/2018','dd/mm/yyyy'));
insert into multa values( 2382208,1280000,9425186,1193023, to_date('17/03/2019','dd/mm/yyyy'));
insert into multa values( 2382209,2700000,9425182,1193024, to_date('21/02/2019','dd/mm/yyyy'));
insert into multa values( 2382210,7500000,9425183,1193023, to_date('20/01/2020','dd/mm/yyyy'));
insert into multa values( 2382211,3480000,9425178,1193020, to_date('10/12/2020','dd/mm/yyyy'));
insert into multa values( 2382212,1390000,9425181,1193026, to_date('08/10/2020','dd/mm/yyyy'));
insert into multa values( 2382213,7800000,9425183,1193018, to_date('13/06/2020','dd/mm/yyyy'));
insert into multa values( 2382214,1160000,9425180,1193020, to_date('28/08/2020','dd/mm/yyyy'));
insert into multa values( 2382215,2900000,9425184,1193027, to_date('10/10/2019','dd/mm/yyyy'));
insert into multa values( 2382216,5500000,9425186,1193023, to_date('30/11/2020','dd/mm/yyyy'));
insert into multa values( 2382217,7004000,9425185,1193025, to_date('13/10/2020','dd/mm/yyyy'));
insert into multa values( 2382218,1880000,9425182,1193018, to_date('01/02/2019','dd/mm/yyyy'));
insert into multa values( 2382219,7100000,9425181,1193024, to_date('25/07/2020','dd/mm/yyyy'));
insert into multa values( 2382230,8500000,9425180,1193020, to_date('24/04/2020','dd/mm/yyyy'));
insert into multa values( 2382231,8480000,9425187,1193018, to_date('11/03/2019','dd/mm/yyyy'));
insert into multa values( 2382232,1790000,9425184,1193027, to_date('04/04/2019','dd/mm/yyyy'));
insert into multa values( 2382233,5800000,9425181,1193020, to_date('14/12/2020','dd/mm/yyyy'));
insert into multa values( 2382234,1000000,9425185,1193026, to_date('05/01/2021','dd/mm/yyyy'));
insert into multa values( 2382235,4580000,9425179,1193024, to_date('19/11/2020','dd/mm/yyyy'));
insert into multa values( 2382236,5500000,9425182,1193026, to_date('03/08/2020','dd/mm/yyyy'));
insert into multa values( 2382237,3120000,9425187,1193025, to_date('09/03/2018','dd/mm/yyyy'));
insert into multa values( 2382238,1680000,9425178,1193021, to_date('04/09/2020','dd/mm/yyyy'));
insert into multa values( 2382239,2890000,9425184,1193020, to_date('16/01/2019','dd/mm/yyyy'));
insert into multa values( 2382240,6500000,9425183,1193019, to_date('20/05/2020','dd/mm/yyyy'));
insert into multa values( 2382241,1350000,9425185,1193018, to_date('15/01/2021','dd/mm/yyyy'));
insert into multa values( 2382242,7890000,9425186,1193023, to_date('13/04/2020','dd/mm/yyyy'));
insert into multa values( 2382243,7500000,9425183,1193027, to_date('16/04/2019','dd/mm/yyyy'));
commit; 

--Vistas: 

    --Vista que permita ver las multas por año:
    
create view MultasXAnnio as
    select extract( year from multa.fecha) AS Año_Multa, sum(multa.valor_multa)as Valor_Total_de_Multas
    from multa
    group by extract( year from multa.fecha);
    
grant all on MultasXAnnio to public;

    --Vista que permite ver las multas año, mes de un carro electrico: 

create view MultasxElectrico as
    select extract( year from multa.fecha) AS Año_Multa, extract( month from multa.fecha)as Mes_Multa, sum(multa.valor_multa)as Valor_Total_de_Multas
    from multa, carro
    where multa.id_carro = carro.id_carro and carro.electrico like 'SI'
    group by extract(year from multa.fecha),extract( month from multa.fecha)
    order by max(multa.fecha);

grant all on MultasxElectrico to public; 

    --Vista que permite ver las multas año, mes de un carro no electrico: 

create view MultasxNoElectrico as
    select extract( year from multa.fecha) AS Año_Multa, extract( month from multa.fecha)as Mes_Multa, sum(multa.valor_multa)as Valor_Total_de_Multas
    from multa, carro
    where multa.id_carro = carro.id_carro and carro.electrico like 'NO'
    group by extract(year from multa.fecha),extract( month from multa.fecha)
    order by max(multa.fecha);

grant all on MultasxNoElectrico to public;  

--Consultas: 

    --Primer Punto:

SELECT conductor.cedula as Cédula, conductor.nombre as Nombre_Conductor, carro.placa as Placa_Carro, to_char(multa.fecha, 'dd/mm/yyyy') AS Fecha_Multa, multa.valor_multa as Valor_Multa
FROM carro, conductor, multa
WHERE carro.id_carro = multa.id_carro and conductor.id_conductor = multa.id_conductor
ORDER BY conductor.cedula ASC, carro.placa ASC;

    --Segundo Punto: 

WITH conductorXmulta as(
    SELECT conductor.id_conductor codigoconductor, count(*) as Cantidad_Multas
    FROM conductor inner join multa on conductor.id_conductor = multa.id_conductor
    GROUP BY conductor.id_conductor)
SELECT conductor.nombre Nombre, conductor.cedula Cédula, NVL(conductorXmulta.cantidad_multas,0) as Cantidad_Multas
FROM conductor 
LEFT JOIN conductorXmulta 
ON conductor.id_conductor = conductorXmulta.codigoconductor;

    --Tercer Punto: 
    
WITH multasCarro as (
        SELECT carro.placa as Placa, extract(year from multa.fecha) as Anio, extract(month from multa.fecha) as Mes, multa.valor_multa as valor
        FROM carro, multa
        WHERE carro.id_carro = multa.id_carro
)
SELECT multasCarro.Placa AS Placa, multasCarro.Anio AS Anio, multasCarro.Mes AS Mes, SUM(multasCarro.Valor) AS Total_Multas
FROM multasCarro
GROUP BY multasCarro.Placa, multasCarro.Anio, multasCarro.Mes
ORDER BY multasCarro.Placa ASC, multasCarro.Anio ASC, multasCarro.Mes ASC;
    
    --Cuarto Punto: 
    
SELECT TO_CHAR(MultasXAnnio.Año_Multa) AS Año, MultasXAnnio.Valor_Total_de_Multas AS Valor_Total_de_Multas
FROM MultasXAnnio
    
UNION ALL
    
SELECT 'TOTAL',SUM(MultasXAnnio.Valor_Total_de_Multas)
FROM MultasXAnnio;
    
    --Quinto Punto: REVISAR MÁS TARDE
    

SELECT DISTINCT conductor.nombre Nombre
FROM multa INNER JOIN conductor ON multa.id_conductor = conductor.id_conductor; 

    --Sexto Punto:
    
WITH promedioGeneral as (
    SELECT extract(year from multa.fecha) as Año, ROUND(AVG(multa.valor_multa),2) as Promedio_Multas
    FROM multa
    GROUP BY  extract(year from multa.fecha)),
    promedioPorYear as (
    SELECT extract(year from multa.fecha) as Año, conductor.id_conductor as codigoConductor, ROUND(AVG(multa.valor_multa),2) as Promedio_Multas 
    FROM conductor INNER JOIN multa on conductor.id_conductor = multa.id_conductor
    GROUP BY extract(year from multa.fecha), conductor.id_conductor
    order by max(multa.fecha))
SELECT DISTINCT conductor.nombre Nombre, promedioPorYear.Año, NVL(promedioGeneral.Promedio_Multas,0) Promedio_Conductor, NVL(promedioPorYear.Promedio_Multas,0) Promedio_General
FROM multa
LEFT JOIN promedioGeneral
ON extract(year from multa.fecha) = promedioGeneral.Año
LEFT JOIN promedioPorYear
ON promedioGeneral.Año = promedioPorYear.Año
LEFT JOIN conductor 
ON  promedioPorYear.codigoConductor = conductor.id_conductor
WHERE promedioGeneral.Promedio_Multas > promedioPorYear.Promedio_Multas
order by promedioPorYear.Año; 

    --Séptimo Punto: 
    
SELECT * FROM carro; 
    
UPDATE carro
SET estado='NO'
WHERE carro.id_carro = (with cantiMultas as(
                                            select carro.id_carro codigo_Carro, count(*) as Cantidad_Multas
                                            from  carro inner join multa on carro.id_carro = multa.id_carro
                                            group by carro.id_carro)
                                            select cantiMultas.codigo_carro
                                            from cantiMultas, carro 
                                            where cantiMultas.codigo_carro = carro.id_carro and cantiMultas.Cantidad_Multas = (select MAX(cantiMultas.Cantidad_Multas)    
                                                                                                                               from cantiMultas)); 
    
SELECT * FROM carro; 

    --Octavo Punto: 
   
WITH TotalColum as (
    SELECT MultasxElectrico.Año_Multa Año, MultasxElectrico.Mes_Multa Mes, NVL(MultasxElectrico.Valor_Total_de_Multas,0) + NVL(MultasxNoElectrico.Valor_Total_de_Multas, 0) Total
    FROM MultasxElectrico 
    LEFT JOIN MultasxNoElectrico 
    ON (MultasxElectrico.Año_Multa = MultasxNoElectrico.Año_Multa and MultasxElectrico.Mes_Multa = MultasxNoElectrico.Mes_Multa)
    ORDER BY MultasxElectrico.Año_Multa ASC, MultasxElectrico.Mes_Multa ASC
)
SELECT to_char(MultasxElectrico.Año_Multa) Año, to_char(MultasxElectrico.Mes_Multa)Mes, NVL(MultasxElectrico.Valor_Total_de_Multas, 0) Electrico, NVL(MultasxNoElectrico.Valor_Total_de_Multas,0) No_Electrico, TotalColum.Total Total
FROM MultasxElectrico 
LEFT JOIN MultasxNoElectrico 
ON (MultasxElectrico.Año_Multa = MultasxNoElectrico.Año_Multa and MultasxElectrico.Mes_Multa = MultasxNoElectrico.Mes_Multa)
LEFT JOIN TotalColum 
ON (MultasxElectrico.Año_Multa = TotalColum.Año and MultasxElectrico.Mes_Multa = TotalColum.Mes)
    
UNION
    
SELECT 'Totales',' ', SUM(MultasxElectrico.Valor_Total_de_Multas), SUM(MultasxNoElectrico.Valor_Total_de_Multas), SUM(TotalColum.Total)
FROM MultasxElectrico 
LEFT JOIN MultasxNoElectrico 
ON (MultasxElectrico.Año_Multa = MultasxNoElectrico.Año_Multa and MultasxElectrico.Mes_Multa = MultasxNoElectrico.Mes_Multa)
LEFT JOIN TotalColum 
ON (MultasxElectrico.Año_Multa = TotalColum.Año and MultasxElectrico.Mes_Multa = TotalColum.Mes); 
    
    
    
    