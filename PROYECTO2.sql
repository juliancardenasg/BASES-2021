DROP TABLE RENTA; 
DROP TABLE BONO;
DROP TABLE CREDITO;
DROP TABLE EFECTIVO;
DROP TABLE IMPUESTO;
DROP TABLE DESCUENTO;
DROP TABLE COMISION;
DROP TABLE conductorXpago;
DROP TABLE PAGO; 
DROP TABLE TARJETACREDITO; 
DROP TABLE FOTO;
DROP TABLE CLIENTE; 
DROP TABLE CONDUCTOR;
DROP TABLE CARRO;
DROP TABLE DUENIO; 
DROP TABLE PERSONA;
DROP TABLE UBICACION; 
DROP TABLE PAIS; 
DROP TABLE MUNICIPIO; 
DROP TABLE DEPARTAMENTO; 

--Drop vistas: 

DROP VIEW TABLA_EFECTIVO;
DROP VIEW TABLA_BONO;
DROP VIEW TOTAL_MONTOS;
DROP VIEW TOTAL_RENTA;
DROP VIEW TOTAL_DESCUENTO;
DROP VIEW TOTAL_IMPUESTO;

CREATE TABLE bono (
    codigopago  NUMBER(4) NOT NULL,
    valor       NUMBER(7, 2) NOT NULL
);

ALTER TABLE bono ADD CONSTRAINT bono_pk PRIMARY KEY ( codigopago );
-----------------------------------------------------------------------------------------------
CREATE TABLE carro (
    placa                 VARCHAR2(6 CHAR) NOT NULL,
    marca                 VARCHAR2(20 CHAR) NOT NULL,
    tipocarro             VARCHAR2(20 CHAR) NOT NULL,
    estado                CHAR(1 CHAR) NOT NULL,
    valorrenta            NUMBER(7, 2) NOT NULL,
    duenio_codigopersona  NUMBER(4) NOT NULL
);
ALTER TABLE carro ADD CONSTRAINT carro_pk PRIMARY KEY ( placa );
-----------------------------------------------------------------------------------------------
CREATE TABLE cliente (
    codigopersona  NUMBER(4) NOT NULL,
    presupuesto    NUMBER(7, 2) NOT NULL,
    usuario        VARCHAR2(20 CHAR) NOT NULL,
    contrasenia    VARCHAR2(20 CHAR) NOT NULL
);
ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( codigopersona );
-----------------------------------------------------------------------------------------------
CREATE TABLE conductor (
    codigopersona      NUMBER(4) NOT NULL,
    licencia           NUMBER(12) NOT NULL
);
ALTER TABLE conductor ADD CONSTRAINT conductor_pk PRIMARY KEY ( codigopersona );
-----------------------------------------------------------------------------------------------
CREATE TABLE conductorXpago (
    codigopersona      NUMBER(4) NOT NULL,
    pago_codigopago       NUMBER(4) NOT NULL
);
ALTER TABLE conductorXpago ADD CONSTRAINT conductorXpago_pk PRIMARY KEY ( codigopersona, pago_codigopago );
-----------------------------------------------------------------------------------------------
CREATE TABLE credito (
    codigopago    NUMBER(4) NOT NULL,
    autorizacion  NUMBER(6) NOT NULL, 
    entidad       VARCHAR2(30) NOT NULL
);

ALTER TABLE credito ADD CONSTRAINT credito_pk PRIMARY KEY ( codigopago );
-----------------------------------------------------------------------------------------------
CREATE TABLE comision(
    codigocomision NUMBER(4,0) NOT NULL, 
    tipo VARCHAR2(15 CHAR) NOT NULL, 
    porcentaje NUMBER(3,3) NOT NULL, 
    pago_codigopago NUMBER (4,0) NOT NULL
);

ALTER TABLE comision ADD CONSTRAINT comisiones_pk PRIMARY KEY (codigocomision, pago_codigopago);
-----------------------------------------------------------------------------------------------
CREATE TABLE departamento (
    iddpto            NUMBER(4) NOT NULL,
    nombre            VARCHAR2(30 CHAR) NOT NULL
);
ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( iddpto );
-----------------------------------------------------------------------------------------------
CREATE TABLE descuento (
    codigodescuento  NUMBER(4) NOT NULL,
    tipo             VARCHAR2(15 CHAR) NOT NULL,
    porcentaje       NUMBER(2, 2) NOT NULL,
    pago_codigopago  NUMBER(4) NOT NULL
);

ALTER TABLE descuento ADD CONSTRAINT descuento_pk PRIMARY KEY ( codigodescuento, pago_codigopago );

-----------------------------------------------------------------------------------------------
CREATE TABLE duenio (
    codigopersona  NUMBER(4) NOT NULL,
    direccion      VARCHAR2(30 CHAR) NOT NULL,
    usuario        VARCHAR2(20 CHAR) NOT NULL,
    contrasenia    VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE duenio ADD CONSTRAINT duenio_pk PRIMARY KEY ( codigopersona );
-----------------------------------------------------------------------------------------------
CREATE TABLE efectivo (
    codigopago  NUMBER(4) NOT NULL,
    monto       NUMBER(7, 2) NOT NULL
);

ALTER TABLE efectivo ADD CONSTRAINT efectivo_pk PRIMARY KEY ( codigopago );
-----------------------------------------------------------------------------------------------
CREATE TABLE foto (
    idfoto       NUMBER(4) NOT NULL,
    descripcion  VARCHAR2(200 CHAR) NOT NULL,
    fecha        DATE NOT NULL,
    pais_idpais  NUMBER(4) NOT NULL,
    carro_placa  VARCHAR2(6 CHAR) NOT NULL
);
ALTER TABLE foto ADD CONSTRAINT foto_pk PRIMARY KEY ( idfoto );
-----------------------------------------------------------------------------------------------
CREATE TABLE impuesto (
    codigoimpuesto   NUMBER(4,0) NOT NULL,
    tipo             VARCHAR2(15 CHAR) NOT NULL,
    porcentaje       NUMBER(4,2) NOT NULL,
    pago_codigopago  NUMBER(4,0) NOT NULL
);

ALTER TABLE impuesto ADD CONSTRAINT impuesto_pk PRIMARY KEY ( codigoimpuesto, pago_codigopago );

-----------------------------------------------------------------------------------------------
CREATE TABLE municipio (
    idmun                          NUMBER(4) NOT NULL,
    nombre                         VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( idmun );
-----------------------------------------------------------------------------------------------
CREATE TABLE pago (
    codigopago         NUMBER(4) NOT NULL,
    tipo               CHAR(2 CHAR) NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( codigopago );
-----------------------------------------------------------------------------------------------
CREATE TABLE pais (
    idpais                         NUMBER(4) NOT NULL,
    nombre                         VARCHAR2(30 CHAR) NOT NULL
);
ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( idpais );
-----------------------------------------------------------------------------------------------
CREATE TABLE persona (
    codigopersona     NUMBER(4) NOT NULL,
    correo            VARCHAR2(30 CHAR) NOT NULL,
    nombre            VARCHAR2(30 CHAR) NOT NULL,
    apellidos         VARCHAR2(30 CHAR) NOT NULL,
    documento         NUMBER(12) NOT NULL,
    tipodocumento     VARCHAR2(15 CHAR) NOT NULL,
    ubicacion_idmun   NUMBER(4) NOT NULL,
    ubicacion_iddpto  NUMBER(4) NOT NULL,
    ubicacion_idpais  NUMBER(4) NOT NULL
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( codigopersona );
-----------------------------------------------------------------------------------------------
CREATE TABLE renta (
    codigorenta              NUMBER(4) NOT NULL,
    fecharenta               DATE NOT NULL,
    fechaentrega             DATE,
    hora                     DATE NOT NULL,
    cliente_codigopersona    NUMBER(4) NOT NULL,
    carro_placa              VARCHAR2(6 CHAR) NOT NULL,
    pago_codigopago          NUMBER(4) NOT NULL
);

ALTER TABLE renta ADD CONSTRAINT renta_pk PRIMARY KEY ( codigorenta );
-----------------------------------------------------------------------------------------------
CREATE TABLE tarjetacredito (
    numero                 NUMBER(16) NOT NULL,
    tipo                   VARCHAR2(10 CHAR) NOT NULL,
    mesexpiracion          NUMBER(2) NOT NULL,
    anioexpiracion         NUMBER(4) NOT NULL,
    cliente_codigopersona  NUMBER(4) NOT NULL
);

ALTER TABLE tarjetacredito ADD CONSTRAINT tarjetacredito_pk PRIMARY KEY ( numero );
-----------------------------------------------------------------------------------------------
CREATE TABLE ubicacion (
    barrio                 VARCHAR2(30 CHAR) NOT NULL,
    municipio_idmun        NUMBER(4) NOT NULL,
    departamento_iddpto    NUMBER(4) NOT NULL,
    pais_idpais            NUMBER(4) NOT NULL
);

ALTER TABLE ubicacion
    ADD CONSTRAINT ubicacion_pk PRIMARY KEY ( municipio_idmun,
                                              departamento_iddpto,
                                              pais_idpais );
-----------------------------------------------------------------------------------------------
ALTER TABLE bono
    ADD CONSTRAINT bono_pago_fk FOREIGN KEY ( codigopago )
        REFERENCES pago ( codigopago );

ALTER TABLE carro
    ADD CONSTRAINT carro_duenio_fk FOREIGN KEY ( duenio_codigopersona )
        REFERENCES duenio ( codigopersona );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_persona_fk FOREIGN KEY ( codigopersona )
        REFERENCES persona ( codigopersona );

ALTER TABLE conductor
    ADD CONSTRAINT conductor_persona_fk FOREIGN KEY ( codigopersona )
        REFERENCES persona ( codigopersona );
       
ALTER TABLE conductorXpago
    ADD CONSTRAINT conductorXpago_persona_fk FOREIGN KEY ( codigopersona )
        REFERENCES persona ( codigopersona );
        
ALTER TABLE conductorXpago
    ADD CONSTRAINT conductorXpago_pago_fk FOREIGN KEY ( pago_codigopago )
        REFERENCES pago ( codigopago );

ALTER TABLE credito
    ADD CONSTRAINT credito_pago_fk FOREIGN KEY ( codigopago )
        REFERENCES pago ( codigopago );

ALTER TABLE comision
    ADD CONSTRAINT comision_pago_fk FOREIGN KEY ( pago_codigopago )
        REFERENCES pago ( codigopago );
        
ALTER TABLE descuento
    ADD CONSTRAINT descuento_pago_fk FOREIGN KEY ( pago_codigopago )
        REFERENCES pago ( codigopago );

ALTER TABLE duenio
    ADD CONSTRAINT duenio_persona_fk FOREIGN KEY ( codigopersona )
        REFERENCES persona ( codigopersona );

ALTER TABLE efectivo
    ADD CONSTRAINT efectivo_pago_fk FOREIGN KEY ( codigopago )
        REFERENCES pago ( codigopago );

ALTER TABLE foto
    ADD CONSTRAINT foto_carro_fk FOREIGN KEY ( carro_placa )
        REFERENCES carro ( placa );

ALTER TABLE foto
    ADD CONSTRAINT foto_pais_fk FOREIGN KEY ( pais_idpais )
        REFERENCES pais ( idpais );

ALTER TABLE impuesto
    ADD CONSTRAINT impuesto_pago_fk FOREIGN KEY ( pago_codigopago )
        REFERENCES pago ( codigopago );
        

ALTER TABLE persona
    ADD CONSTRAINT persona_ubicacion_fk FOREIGN KEY ( ubicacion_idmun,
                                                      ubicacion_iddpto,
                                                      ubicacion_idpais )
        REFERENCES ubicacion ( municipio_idmun,
                               departamento_iddpto,
                               pais_idpais );

ALTER TABLE renta
    ADD CONSTRAINT renta_carro_fk FOREIGN KEY ( carro_placa )
        REFERENCES carro ( placa );

ALTER TABLE renta
    ADD CONSTRAINT renta_cliente_fk FOREIGN KEY ( cliente_codigopersona )
        REFERENCES cliente ( codigopersona );

ALTER TABLE renta
    ADD CONSTRAINT renta_pago_fk FOREIGN KEY ( pago_codigopago )
        REFERENCES pago ( codigopago );

ALTER TABLE tarjetacredito
    ADD CONSTRAINT tarjetacredito_cliente_fk FOREIGN KEY ( cliente_codigopersona )
        REFERENCES cliente ( codigopersona );

ALTER TABLE ubicacion
    ADD CONSTRAINT ubicacion_departamento_fk FOREIGN KEY ( departamento_iddpto )
        REFERENCES departamento ( iddpto );

ALTER TABLE ubicacion
    ADD CONSTRAINT ubicacion_municipio_fk FOREIGN KEY ( municipio_idmun )
        REFERENCES municipio ( idmun );

ALTER TABLE ubicacion
    ADD CONSTRAINT ubicacion_pais_fk FOREIGN KEY ( pais_idpais )
        REFERENCES pais ( idpais );


-----------------------------------------------------------------------------------------------
-- Lugares:
--- DEPARTAMENTOS:
INSERT INTO DEPARTAMENTO VALUES (1, 'Cundinamarca');
INSERT INTO DEPARTAMENTO VALUES (2, 'Atlántico');
INSERT INTO DEPARTAMENTO VALUES (3, 'Bolivar');
INSERT INTO DEPARTAMENTO VALUES (4, 'Antioquia');
INSERT INTO DEPARTAMENTO VALUES (5, 'Santander');
INSERT INTO DEPARTAMENTO VALUES (6, 'Cauca');
INSERT INTO DEPARTAMENTO VALUES (7, 'Meta');
INSERT INTO DEPARTAMENTO VALUES (8, 'Córdoba');
INSERT INTO DEPARTAMENTO VALUES (9, 'Tolima');
INSERT INTO DEPARTAMENTO VALUES (10, 'Sucre');
commit;

---PAIS
INSERT INTO PAIS VALUES (1, 'Colombia');
commit; 

---Municipio
INSERT INTO MUNICIPIO VALUES (1, 'Soacha');
INSERT INTO MUNICIPIO VALUES (2, 'Fusagasugá');
INSERT INTO MUNICIPIO VALUES (3, 'Zipaquirá');
INSERT INTO MUNICIPIO VALUES (4, 'Funza');
INSERT INTO MUNICIPIO VALUES (5, 'Cota');
INSERT INTO MUNICIPIO VALUES (6, 'Bucaramanga');
INSERT INTO MUNICIPIO VALUES (7, 'San Gil');
INSERT INTO MUNICIPIO VALUES (8, 'Barrancabermeja');
INSERT INTO MUNICIPIO VALUES (9, 'Cimitarra');
INSERT INTO MUNICIPIO VALUES (10, 'Floridablanca');
INSERT INTO MUNICIPIO VALUES (11, 'Puerto Wilches');
INSERT INTO MUNICIPIO VALUES (12, 'Baranoa');
INSERT INTO MUNICIPIO VALUES (13, 'Galapa');
INSERT INTO MUNICIPIO VALUES (14, 'Luraco');
INSERT INTO MUNICIPIO VALUES (15, 'Candelaria');
INSERT INTO MUNICIPIO VALUES (16, 'Ponedera');
INSERT INTO MUNICIPIO VALUES (17, 'Margarita');
INSERT INTO MUNICIPIO VALUES (18, 'Cartagena de Indias');
INSERT INTO MUNICIPIO VALUES (19, 'María la Baja');
INSERT INTO MUNICIPIO VALUES (20, 'Cantagallo');
INSERT INTO MUNICIPIO VALUES (21, 'Achí');
INSERT INTO MUNICIPIO VALUES (22, 'Ibagué');
INSERT INTO MUNICIPIO VALUES (23, 'Flandes');
INSERT INTO MUNICIPIO VALUES (24, 'Piedras');
INSERT INTO MUNICIPIO VALUES (25, 'Coello');
INSERT INTO MUNICIPIO VALUES (26, 'Espinal');
INSERT INTO MUNICIPIO VALUES (27, 'Cáceres');
INSERT INTO MUNICIPIO VALUES (28, 'Nechí');
INSERT INTO MUNICIPIO VALUES (29, 'Medellin');
INSERT INTO MUNICIPIO VALUES (30, 'Bello');
INSERT INTO MUNICIPIO VALUES (31, 'Sabaneta');
INSERT INTO MUNICIPIO VALUES (32, 'Planeta Rica');
INSERT INTO MUNICIPIO VALUES (51, 'Montería');
INSERT INTO MUNICIPIO VALUES (33, 'Montelibano');
INSERT INTO MUNICIPIO VALUES (34, 'Cereté');
INSERT INTO MUNICIPIO VALUES (35, 'Cotorra');
INSERT INTO MUNICIPIO VALUES (36, 'Popayán');
INSERT INTO MUNICIPIO VALUES (37, 'Morales');
INSERT INTO MUNICIPIO VALUES (38, 'Miranda');
INSERT INTO MUNICIPIO VALUES (39, 'Florencia');
INSERT INTO MUNICIPIO VALUES (40, 'Patía');
INSERT INTO MUNICIPIO VALUES (41, 'Villavicencio');
INSERT INTO MUNICIPIO VALUES (42, 'Mesetas');
INSERT INTO MUNICIPIO VALUES (43, 'El Dorado');
INSERT INTO MUNICIPIO VALUES (44, 'Granada');
INSERT INTO MUNICIPIO VALUES (45, 'Restrepo');
INSERT INTO MUNICIPIO VALUES (46, 'Sincelejo');
INSERT INTO MUNICIPIO VALUES (47, 'Los Palmitos');
INSERT INTO MUNICIPIO VALUES (48, 'Coveñas');
INSERT INTO MUNICIPIO VALUES (49, 'Santiago de Tolú');
INSERT INTO MUNICIPIO VALUES (50, 'San Marcos');
commit;

--- UBICACIÖN:
INSERT INTO UBICACION VALUES ( 'Las Palmas', 1, 1,1);
INSERT INTO UBICACION VALUES ( 'Pradera', 2, 1,1);
INSERT INTO UBICACION VALUES ( 'San Agustin',3 , 1,1);
INSERT INTO UBICACION VALUES ( 'Montero',4 ,1 ,1);
INSERT INTO UBICACION VALUES ( 'La fragata', 5, 1,1);
INSERT INTO UBICACION VALUES ( 'Las magaritas',6 ,5 ,1);
INSERT INTO UBICACION VALUES ( 'Florida Blanca',7 ,5 ,1);
INSERT INTO UBICACION VALUES ( 'Palo Alto', 8,5 ,1);
INSERT INTO UBICACION VALUES ( 'La macarena', 9, 5,1);
INSERT INTO UBICACION VALUES ( 'San Pedro', 10, 5,1);
INSERT INTO UBICACION VALUES ( 'Narida',11 ,5 ,1);
INSERT INTO UBICACION VALUES ( 'La redonda', 12,2,1);
INSERT INTO UBICACION VALUES ( 'Agua Clara',13 ,2,1);
INSERT INTO UBICACION VALUES ( 'Rosales', 14, 2,1);
INSERT INTO UBICACION VALUES ( 'La escondida', 15, 2,1);
INSERT INTO UBICACION VALUES ( 'Palma',16 ,2,1);
INSERT INTO UBICACION VALUES ( 'La bahia', 17, 3,1);
INSERT INTO UBICACION VALUES ( 'Rosas del viento', 18,3 ,1);
INSERT INTO UBICACION VALUES ( 'La extensa1',19 ,3 ,1);
INSERT INTO UBICACION VALUES ( 'Brisas del viento', 21,3 ,1);
INSERT INTO UBICACION VALUES ( 'San Bernardo',20 ,3 ,1);
INSERT INTO UBICACION VALUES ( 'Cauques',22 ,9 ,1);
INSERT INTO UBICACION VALUES ( 'Paniagua',23,9,1);
INSERT INTO UBICACION VALUES ( 'La sureña',24,9,1);
INSERT INTO UBICACION VALUES ( 'Agusto',25 , 9,1);
INSERT INTO UBICACION VALUES ( 'Flor campal', 26, 9,1);
INSERT INTO UBICACION VALUES ( 'Azucenas',27 ,4 ,1);
INSERT INTO UBICACION VALUES ( 'Retoño', 28, 4,1);
INSERT INTO UBICACION VALUES ( 'Rosas de osos', 29,4,1);
INSERT INTO UBICACION VALUES ( 'Comuna 13', 30, 4,1);
INSERT INTO UBICACION VALUES ( 'Flandes',31 ,4 ,1);
INSERT INTO UBICACION VALUES ( 'Coco Blanco', 32, 8,1);
INSERT INTO UBICACION VALUES ( 'La avenida', 33, 8,1);
INSERT INTO UBICACION VALUES ( 'Cienaga de garza',34 , 8,1);
INSERT INTO UBICACION VALUES ( 'El porto', 35,8 ,1);
INSERT INTO UBICACION VALUES ( 'Petunia',36 , 6,1);
INSERT INTO UBICACION VALUES ( 'Monteclara',37,6,1);
INSERT INTO UBICACION VALUES ( 'El mirador',38,6,1);
INSERT INTO UBICACION VALUES ( 'Cascapalma',39,6,1);
INSERT INTO UBICACION VALUES ( 'La araña',40,6,1);
INSERT INTO UBICACION VALUES ( 'Surrendado',41,7,1);
INSERT INTO UBICACION VALUES ( 'Las primaveras',42,7,1);
INSERT INTO UBICACION VALUES ( 'San Cristobal',43,7,1);
INSERT INTO UBICACION VALUES ( 'Aguas',44,7,1);
INSERT INTO UBICACION VALUES ( 'La margarita',45,7,1);
INSERT INTO UBICACION VALUES ( 'Bocachico',46,10,1);
INSERT INTO UBICACION VALUES ( 'El puerto',47,10,1);
INSERT INTO UBICACION VALUES ( 'Oliviaclara',48,10,1);
INSERT INTO UBICACION VALUES ( 'Paquetea',49,10,1);
INSERT INTO UBICACION VALUES ( 'Vientos',50,10,1);
commit;

--Personas:
INSERT INTO PERSONA VALUES ( 1,'daniel@gmail.com','Daniel','Perez Manrrique', 1194173924, 'CC', 1, 1,1);
INSERT INTO PERSONA VALUES ( 2,'MarielA@gmail.com','Mariela','Artunduaga Lopez', 1144679904, 'CC', 2, 1,1);
INSERT INTO PERSONA VALUES ( 3,'FelipeWWE@gmail.com','Felipe','Angel Palacios',342122312,'TI',19 ,3 ,1);
INSERT INTO PERSONA VALUES ( 4,'Migles@hotmail.com','Miguel','Platino Arroyo',46728832,'CC',49,10,1);
INSERT INTO PERSONA VALUES ( 5,'Paolomirad2@gmail.com','Paolo','Bermudez Angarita',329213443,'CC',38,6,1);
INSERT INTO PERSONA VALUES ( 6,'daniloptee@gmail.com','Daniel','Lorpez Armado',339021322,'CC',44,7,1);
INSERT INTO PERSONA VALUES ( 7,'AlvaroRSalta@gmail.com','Alvaro','Ruge Pasito',23156633,'CC',47,10,1);
INSERT INTO PERSONA VALUES ( 8,'MAriobroster@gmail.com','Mario','Sanclemente Urrego',22311975,'CC',18,3 ,1);
INSERT INTO PERSONA VALUES ( 9,'lunagil@gmail.com','Luna','Gil Rodriguez',21112908,'CC',4 ,1 ,1);
INSERT INTO PERSONA VALUES ( 10,'aroe333@gmail.com','Patricia','Fernandez Cesar',9656334,'CC',10, 5,1);
INSERT INTO PERSONA VALUES ( 11,'oe34luis@gmail.com','Luis','Esposito Albornoz',1193723,'CC',28, 4,1);
INSERT INTO PERSONA VALUES ( 12,'juli432osomeloso@gmail.com','Julian','Cardenas Vargas',38492022,'CC',39,6,1);
INSERT INTO PERSONA VALUES ( 13,'Favunique@gmail.com','Fabian','Suluaga Perez',96573922,'CC',30, 4,1);
INSERT INTO PERSONA VALUES ( 14,'bermudeza@gmail.com','Daniela','Bermudez Patrón',47282321,'CC',13 ,2,1);
INSERT INTO PERSONA VALUES ( 15,'ursula322@gmail.com','Ursula','Paniagua Quenguan',33452821,'CC',48,10,1);
INSERT INTO PERSONA VALUES ( 16,'pablo34di4z@gmail.com','Pablo','Diaz Velandia',2950031,'CC',3 , 1,1);
INSERT INTO PERSONA VALUES ( 17,'pituf032@gmail.com','Pilar','Tungaza Fernandez',23122210,'CC',50,10,1);
INSERT INTO PERSONA VALUES ( 18,'gesichte@refec.site','Guiselle','Robert Andorra',3321089,'CE',34 , 8,1);
INSERT INTO PERSONA VALUES ( 19,'barbarau@gmailc.om','Barbara','Gomez Loaiza',11920313,'CC',23,9,1);
INSERT INTO PERSONA VALUES ( 20,'hugol@gmail.com','Hugo','Lamprea Pinzon',3910334,'CC',7 ,5 ,1);
INSERT INTO PERSONA VALUES ( 21,'kamnge33@gmail.com','Karen','Chaparro',10424052,'CC',25 , 9,1);
INSERT INTO PERSONA VALUES ( 22,'lmncue@gmail.com','Leandro','Ason Aleja',19275343,'CC',28, 4,1);
INSERT INTO PERSONA VALUES ( 23,'lveiga@gmail.com','Lola','Pescatori Menoyo',11477959,'CC',36 , 6,1);
INSERT INTO PERSONA VALUES ( 24,'ansabo@gmail.com','ANGEL','SANABRIA BOLAÑOS',17729879,'CC',9, 5,1);
INSERT INTO PERSONA VALUES ( 25,'pompeyo3400@gmail.com','Pompeyo','Feijo Morodo',16481803,'CC',30, 4,1);
INSERT INTO PERSONA VALUES ( 26,'emililledias@gmail.com','Emilian','Ternero Lledias',10068837,'CE',24,9,1);
INSERT INTO PERSONA VALUES ( 27,'nmguitian@gmail.com','Nelly','Mondragon Guitian',19052176,'CC',36 , 6,1);
INSERT INTO PERSONA VALUES ( 28,'d78Phiona@gmail.com','Phiona','Jetino Clemente',14352403,'CC',41,7,1);
INSERT INTO PERSONA VALUES ( 29,'renxosmapa@gmail.com','Renzo','Paratorrecilla Frances',13051075,'CC',6 ,5 ,1);
INSERT INTO PERSONA VALUES ( 30,'arg45033@gmail.com','Argelia','Olivares Ochandio',18773619,'CC',32, 8,1);
INSERT INTO PERSONA VALUES ( 31,'leo@gmail.com','Leocadi','Manglano Collazos',17614019,'CC',47,10,1);
INSERT INTO PERSONA VALUES ( 32,'raquelflo@gmail.com','Raquel ','Cayuso Coloma',16971300,'CC',49,10,1);
INSERT INTO PERSONA VALUES ( 33,'kladd302@gmail.com','Klelia','Rio Delgado',16568388,'CE',15, 2,1);
INSERT INTO PERSONA VALUES ( 34,'julieta233@gmail.com','Julieta','Manso Valsera',10070636,'CE',11 ,5 ,1);
INSERT INTO PERSONA VALUES ( 35,'amanda942@gmail.com','Amanda','Manzanal Viñambres',16367353,'CC',21,3 ,1);
INSERT INTO PERSONA VALUES ( 36,'yulissa975@gmail.com','Yulissa','Palanca Ocouto',11575359,'CC',5, 1,1);
INSERT INTO PERSONA VALUES ( 37,'alexco@gmail.com','Alexandra','Coracera Arnedo',14952161,'CC',46,10,1);
INSERT INTO PERSONA VALUES ( 38,'oieribarra@gmail.com','Oier','Ibarra Ontoria',10747249,'CC',34 , 8,1);
INSERT INTO PERSONA VALUES ( 39,'yosvani@gmail.com','Yosvani','Candana Villabedon',13051075,'CC',26, 9,1);
INSERT INTO PERSONA VALUES ( 40,'delva320@gmail.com','Delva','Villalobos Barreiros',19074934,'CC',49,10,1);
INSERT INTO PERSONA VALUES ( 41,'grace945@gmail.com','Grace','Freijo Vidal',17767582,'CC',1, 1,1);
INSERT INTO PERSONA VALUES ( 42,'yariel822@gmail.com','Yariel','Arganza Guceño',18437665,'CC',12,2,1);
INSERT INTO PERSONA VALUES ( 43,'davi78.da@gmail.com','David','Arostegui Abechuco',17829305,'CC',20 ,3 ,1);
INSERT INTO PERSONA VALUES ( 44,'elder.ob@gmail.com','Elder','Obiano Borrajo',10208711,'CC',44,7,1);
INSERT INTO PERSONA VALUES ( 45,'damian308@gmail.com','Damian','Hualde Caseda',18024500,'CC',25 , 9,1);
INSERT INTO PERSONA VALUES ( 46,'yaz45@gmail.com','Yazmin','Cavadas Roza',17709325,'CC',35,8 ,1);
INSERT INTO PERSONA VALUES ( 47,'norlanvalencia@gmail.com','Norlan','Valenciaga Rebustillo',15218434,'CC',13 ,2,1);
INSERT INTO PERSONA VALUES ( 48,'vndj444@gmail.com','Baldomero','Rollan Imaz',15651786,'CC',31 ,4 ,1);
INSERT INTO PERSONA VALUES ( 49,'281nubia@gmail.com','Nubia','Cienfuegos Ciscal',12830642,'CE',39,6,1);
INSERT INTO PERSONA VALUES ( 50,'mod3546@gmail.com','Modesto','Peramato Acenero',12756030,'CC',4 ,1 ,1);
INSERT INTO PERSONA VALUES ( 51,'aroa293@gmail.com','Aroa','Marquez Bratuti',18931597,'CC',8,5 ,1);
INSERT INTO PERSONA VALUES ( 52,'nico98la@gmail.com','Nicolás','Lamiar Bezares',15311725,'CC',14, 2,1);
INSERT INTO PERSONA VALUES ( 53,'micaela09@gmail.com','Micaela','Pastrana Gotor',19784597,'CC',23,9,1);
INSERT INTO PERSONA VALUES ( 54,'deidi33@gmail.com','Deidi','Echave Portela',12554293,'CC',16 ,2,1);
INSERT INTO PERSONA VALUES ( 55,'hertomo67@gmail.com','Herlinda','Juara Lardero',19375950,'CC',10, 5,1);
INSERT INTO PERSONA VALUES ( 56,'dago2001@gmail.com','Dagoberto','Arbulo Arzalaga',12255573,'CC',40,6,1);
INSERT INTO PERSONA VALUES ( 57,'adro874@gmail.com','Adira','Torienzo Mostache',12432285,'CC',2, 1,1);
INSERT INTO PERSONA VALUES ( 58,'romu3000@gmail.com','Rómulo','Arenillas Iñigo',14352403,'CC',11 ,5 ,1);
INSERT INTO PERSONA VALUES ( 59,'aleyida7695@gmail.com','Aleyda','Camaño Ben',13794695,'CC',43,7,1);
INSERT INTO PERSONA VALUES ( 60,'julio.man@gmail.com','Julio','Manzarias Legaspe',16314127,'CC',17, 3,1);
INSERT INTO PERSONA VALUES ( 61,'gregoro322@gmail.com','Gregorio','Carces Brizuela',19648007,'CC',45,7,1);
INSERT INTO PERSONA VALUES ( 62,'lucero2011@gmail.com','Lucero','Gordejuela Utrera',18159177,'CC',15, 2,1);
INSERT INTO PERSONA VALUES ( 63,'leroy372@gmail.com','Leroy','Sorriba Oblanca',17729879,'CC',27 ,4 ,1);
INSERT INTO PERSONA VALUES ( 64,'serafin783@gmail.com','Serafín','Fuica Rezabal',16223917,'CE',33, 8,1);
INSERT INTO PERSONA VALUES ( 65,'dianamhd@gmail.com','Diana','Orejas Peramato',16082362,'CE',38,6,1);
INSERT INTO PERSONA VALUES ( 66,'evelyn337@gmail.com','Evelyn','Jimeno Rado',16481803,'CC',7 ,5 ,1);
INSERT INTO PERSONA VALUES ( 67,'gonzalo.45@gmail.com','Gonzalo','Malvido Yebra',11477959,'CC',3 , 1,1);
INSERT INTO PERSONA VALUES ( 68,'rub.pago321@gmail.com','Rubén','Pagola Ozana',16902770,'CC',31 ,4 ,1);
INSERT INTO PERSONA VALUES ( 69,'benja1999@gmail.com','Benjamín','Carriazo Aguirol',19744053,'CE',36 , 6,1);
INSERT INTO PERSONA VALUES ( 70,'vailet.2000@gmail.com','Valiet','Guedeja Fuenmayor',18751020,'CE',24,9,1);
INSERT INTO PERSONA VALUES ( 71,'yesmanijef2@gmail.com','Yesmani','Isasaga Minayo',16624040,'CC',6 ,5 ,1);
commit;

--Clientes:
INSERT INTO CLIENTE VALUES (1,90000,'OniSiqUa','griffiegan');
INSERT INTO CLIENTE VALUES (2,21220,'Strongri','ineurcocke');
INSERT INTO CLIENTE VALUES (3,13000,'ZeeBristle','thtucianst');
INSERT INTO CLIENTE VALUES (4,24500,'Radearge','uchincepre');
INSERT INTO CLIENTE VALUES (5,30000,'cREDEreF','dularemwor');
INSERT INTO CLIENTE VALUES (6,43000,'Corami','rislebuxur');
INSERT INTO CLIENTE VALUES (7,90100,'Glimmertu','rislebuxur');
INSERT INTO CLIENTE VALUES (8,22000,'Latinava','hasteighti');
INSERT INTO CLIENTE VALUES (9,50400,'RidaIfall','blembulsty');
INSERT INTO CLIENTE VALUES (10,98000,'Tlacuna','theratervi');
INSERT INTO CLIENTE VALUES (11,21900,'Bretolo','ctubrityra');
INSERT INTO CLIENTE VALUES (12,48700,'Cottonia','gonneousse');
INSERT INTO CLIENTE VALUES (13,36200,'Greedo','ollogyrous');
INSERT INTO CLIENTE VALUES (14,32900,'Plicia','maticerypn');
INSERT INTO CLIENTE VALUES (15,67000,'Rockerti','scatentese');
INSERT INTO CLIENTE VALUES (16,32900,'Trackmb','truscrotem');
INSERT INTO CLIENTE VALUES (17,43600,'Captadu','glisonecti');
INSERT INTO CLIENTE VALUES (18,32000,'Crianen','lentokbate');
INSERT INTO CLIENTE VALUES (19,49400,'GuantoGroup','nghterienc');
INSERT INTO CLIENTE VALUES (20,86500,'Praceolo','anticitern');
INSERT INTO CLIENTE VALUES (21,23600,'Sentegr','urottschri');
INSERT INTO CLIENTE VALUES (22,38800,'Verdiab','gotooducti');
INSERT INTO CLIENTE VALUES (23,65400,'Catado','poilenecto');
INSERT INTO CLIENTE VALUES (24,45300,'Elementil','sheritalco');
INSERT INTO CLIENTE VALUES (25,64900,'Idealec','ampletemes');
commit;

--Conductores
INSERT INTO CONDUCTOR VALUES (26,292462017);
INSERT INTO CONDUCTOR VALUES (27,213702618);
INSERT INTO CONDUCTOR VALUES (28,128040580);
INSERT INTO CONDUCTOR VALUES (29,152520559);
INSERT INTO CONDUCTOR VALUES (30,270482394);
INSERT INTO CONDUCTOR VALUES (31,209236481);
INSERT INTO CONDUCTOR VALUES (32,283438863);
INSERT INTO CONDUCTOR VALUES (33,115934692);
INSERT INTO CONDUCTOR VALUES (34,146997479);
INSERT INTO CONDUCTOR VALUES (35,131385412);
INSERT INTO CONDUCTOR VALUES (36,272038655);
INSERT INTO CONDUCTOR VALUES (37,294889939);
INSERT INTO CONDUCTOR VALUES (38,133070245);
INSERT INTO CONDUCTOR VALUES (39,110597831);
INSERT INTO CONDUCTOR VALUES (40,231261172);
INSERT INTO CONDUCTOR VALUES (41,247482776);
INSERT INTO CONDUCTOR VALUES (42,225010068);
INSERT INTO CONDUCTOR VALUES (43,111366567);
INSERT INTO CONDUCTOR VALUES (45,263487743);
INSERT INTO CONDUCTOR VALUES (46,170226227);
INSERT INTO CONDUCTOR VALUES (44,283750116);
INSERT INTO CONDUCTOR VALUES (47,164796330);
INSERT INTO CONDUCTOR VALUES (48,132644041);
INSERT INTO CONDUCTOR VALUES (1,151998525);
INSERT INTO CONDUCTOR VALUES (13,266424700);
INSERT INTO CONDUCTOR VALUES (18,289528898);
commit;

--Dueños:
INSERT INTO DUENIO VALUES(49,'Cuesta Lorem ipsum, 180B','Kiwilena','hosinerypt');
INSERT INTO DUENIO VALUES(50,'Paseo Lorem ipsum dolor, 253A','BurntLasting','reiltricky');
INSERT INTO DUENIO VALUES(51,'Rambla Lorem, 150B','SkateSheer','polenutens');
INSERT INTO DUENIO VALUES(52,'Carrera Lorem, 221 3ºC','Presic','ickcholarb');
INSERT INTO DUENIO VALUES(53,'Carretera Lorem ipsum, 63 14ºF','Taraja','mbedyborma');
INSERT INTO DUENIO VALUES(54,'Cuesta Lorem DOLORES, 23','Ementopi','unteddoetr');
INSERT INTO DUENIO VALUES(55,'Ronda Lorem, 47B','Conficant','iatonterri');
INSERT INTO DUENIO VALUES(56,'Carrer dolor sit, 286 9ºE','Enterr','oaterchila');
INSERT INTO DUENIO VALUES(57,'Carrer Lorem, 26B','Mundesmoc','ealcariate');
INSERT INTO DUENIO VALUES(58,'Paseo Lorem ipsum, 194 6ºC','Proeg','stemistrec');
INSERT INTO DUENIO VALUES(59,'Carrera Lorem ipsum, 61','SmartBlue','cippyknote');
INSERT INTO DUENIO VALUES(60,'Avenida Lorem ipsum, 2B','ThePong','yneneoseve');
INSERT INTO DUENIO VALUES(61,'Cuesta Lorem, 87B 9ºB','Desgrafre','erillyphoa');
INSERT INTO DUENIO VALUES(62,'Carrer Lorem ipsum dolor, 38A','Faithpera','nkeverityp');
INSERT INTO DUENIO VALUES(63,'Calle dolor, 186B','MyWind','asillindix');
INSERT INTO DUENIO VALUES(64,'Pasaje Lorem ipsum, 105B 15ºF','Rancanord','lmerberlys');
INSERT INTO DUENIO VALUES(65,'Pasadizo Lorem C 9','Sostearec','drusaulelf');
INSERT INTO DUENIO VALUES(66,'Vía Lorem, 288 10ºA','TickerYour','abalvactow');
INSERT INTO DUENIO VALUES(67,'Acceso Lorem ipsum, 217 5ºF','BriefingShark','ezershundi');
INSERT INTO DUENIO VALUES(68,'Callejón FLOR, 284 9ºA','EatsyouDarth','jectumment');
INSERT INTO DUENIO VALUES(69,'Cañada Lorem, 134B 6ºB','Infernolord','tiontoremp');
INSERT INTO DUENIO VALUES(70,'C. Comercial Lorem, 196 3ºC','Porrazole','rogymatelf');
INSERT INTO DUENIO VALUES(71,'Carrera Lorem ipsum, 255A','Sivatico','blentagett');
INSERT INTO DUENIO VALUES(6,'Vía Lorem, 171B 12ºF','Sufrez','nearistela');
INSERT INTO DUENIO VALUES(22,'Avenida Lorem ipsum dolor, 43B','BelieveBuddy','rometteara');
INSERT INTO DUENIO VALUES(15,'Glorieta Lom iSum, 101B','Deshogia','eryllingen');
COMMIT;

--CARROS:
INSERT INTO CARRO VALUES('584GNU','Audi','Sedán','A',5000,49);
INSERT INTO CARRO VALUES('053DIW','BMW','Sedán','E',6000,50);
INSERT INTO CARRO VALUES('430FMF','Dodge','Hatchback ','A',12000,52);
INSERT INTO CARRO VALUES('829PVO','Ford','Sedán','A',15000,51);
INSERT INTO CARRO VALUES('858GRV','Hyundai','Sedán','A',18000,53);
INSERT INTO CARRO VALUES('602DOF','Kia','Hatchback','A',9000,54);
INSERT INTO CARRO VALUES('259BZX','Chevrolet','SUV','A',8000,55);
INSERT INTO CARRO VALUES('969ECK','Honda','SUV','A',20000,56);
INSERT INTO CARRO VALUES('644OEI','Mercedes-Benz','SUV','A',35000,57);
INSERT INTO CARRO VALUES('654CZC','Mazda','Van','A',7000,58);
INSERT INTO CARRO VALUES('571AVU','Chevrolet','Van','A',20000,59);
INSERT INTO CARRO VALUES('578TDC','Fiat','SUV','E',15000,60);
INSERT INTO CARRO VALUES('440HDL','Kia','Sedán','A',12000,61);
INSERT INTO CARRO VALUES('269NDK','Mitsubishi','Hatchback','E',11000,62);
INSERT INTO CARRO VALUES('300VXJ','Renault','Sedán','A',13000,63);
INSERT INTO CARRO VALUES('977FAP','Dodge','Hatchback','A',21000,64);
INSERT INTO CARRO VALUES('299KMQ','BMW','SUV','A',12000,65);
INSERT INTO CARRO VALUES('164YNI','Toyota','Sedán','A',23000,66);
INSERT INTO CARRO VALUES('103FXO','Volkswagen','Van','A',21000,67);
INSERT INTO CARRO VALUES('460QXY','Ford','Van','A',5000,68);
INSERT INTO CARRO VALUES('347FEO','SsangYong','Sedán','A',8000,69);
INSERT INTO CARRO VALUES('175SPE','Jeep','SUV','A',17000,70);
INSERT INTO CARRO VALUES('826YOX','Audi','SUV','A',24000,71);
INSERT INTO CARRO VALUES('819KXH','Subaru','Hatchback','A',30000,6);
INSERT INTO CARRO VALUES('511EVI','Honda','Sedán','A',10000,22);
INSERT INTO CARRO VALUES('399SCX','Hyundai','Sedán','E',10000,15);
INSERT INTO CARRO VALUES('900WGW','Nissan','Sedán','A',21000,63);
INSERT INTO CARRO VALUES('514SII','Mitsubishi','Hatchback','A',17000,54);
INSERT INTO CARRO VALUES('433PSS','Fiat','Hatchback','A',16000,49);
INSERT INTO CARRO VALUES('361LCV','Chevrolet','Sedán','A',14000,62);
INSERT INTO CARRO VALUES('164HKL','Jeep','Sedán ','A',19000,58);
INSERT INTO CARRO VALUES('166HJL','Jeep','Sedán ','E',19000,53);
INSERT INTO CARRO VALUES('174HHL','Jeep','Sedán ','E',19000,53);
commit;

--Pago: 
    --Con bono: 
INSERT INTO PAGO VALUES(5593,'B'); 
INSERT INTO PAGO VALUES(4369,'B'); 
INSERT INTO PAGO VALUES(4421,'B'); 
INSERT INTO PAGO VALUES(4286,'B'); 
INSERT INTO PAGO VALUES(3630,'B');
INSERT INTO PAGO VALUES(5129,'B');
INSERT INTO PAGO VALUES(3840,'B');
INSERT INTO PAGO VALUES(7848,'B');
INSERT INTO PAGO VALUES(7708,'B');
INSERT INTO PAGO VALUES(5983,'B');
commit; 
    --Con efectivo:
INSERT INTO PAGO VALUES(5641,'E');
INSERT INTO PAGO VALUES(5698,'E');
INSERT INTO PAGO VALUES(8172,'E');
INSERT INTO PAGO VALUES(6183,'E');
INSERT INTO PAGO VALUES(4289,'E');
INSERT INTO PAGO VALUES(5110,'E');
INSERT INTO PAGO VALUES(8392,'E');
INSERT INTO PAGO VALUES(3302,'E');
INSERT INTO PAGO VALUES(8838,'E');
INSERT INTO PAGO VALUES(1716,'E');
commit; 
    --Con Crédito:
INSERT INTO PAGO VALUES(1746,'C');
INSERT INTO PAGO VALUES(1557,'C');
INSERT INTO PAGO VALUES(2334,'C');
INSERT INTO PAGO VALUES(1306,'C');
INSERT INTO PAGO VALUES(1908,'C');
INSERT INTO PAGO VALUES(4532,'C');
INSERT INTO PAGO VALUES(9772,'C');
INSERT INTO PAGO VALUES(4741,'C');
INSERT INTO PAGO VALUES(2057,'C');
INSERT INTO PAGO VALUES(4318,'C');
commit; 

--Comision: 

INSERT INTO COMISION VALUES (1, 'Gestion', 0.01, 5593);
INSERT INTO COMISION VALUES (2, 'Administracion', 0.005, 5593);
INSERT INTO COMISION VALUES (1, 'Gestion', 0.01, 4369);
INSERT INTO COMISION VALUES (2, 'Administracion', 0.005, 4369);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 4421);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 4421);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 4286);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 4286);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 3630);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 3630);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 5129);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 5129);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 3840);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 3840);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 7848);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 7848);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 7708);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 7708);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 5983);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 5983);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 5641);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 5641);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 5698);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 5698);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 8172);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 8172);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 6183);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 6183);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 4289);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 4289);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 5110);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 5110);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 8392);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 8392);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 3302);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 3302);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 8838);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 8838);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 1716);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 1716);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 1746);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 1746);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 1557);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 1557);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 2334);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 2334);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 1306);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 1306);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 1908);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 1908);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 4532);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 4532);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 9772);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 9772);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 4741);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 4741);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 2057);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 2057);
INSERT INTO COMISION VALUES(1, 'Gestion', 0.01, 4318);
INSERT INTO COMISION VALUES(2, 'Administracion', 0.005, 4318);
commit;

--Impuesto: 

INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 5593);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 4369);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 4421);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 4286);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 3630);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 5129);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 3840);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 7848);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 7708);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 5983);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 5641);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 5698);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 8172);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 6183);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 4289);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 5110);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 8392);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 3302);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 8838);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 1716);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 1746);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 1557);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 2334);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 1306);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 1908);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 4532);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 9772);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 4741);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 2057);
INSERT INTO IMPUESTO VALUES (1, 'IVA', 0.16, 4318);
INSERT INTO IMPUESTO VALUES (2, 'ICA', 0.06, 2057);
INSERT INTO IMPUESTO VALUES (2, 'ICA', 0.06, 4532);
INSERT INTO IMPUESTO VALUES (2, 'ICA', 0.06, 5110);
INSERT INTO IMPUESTO VALUES (3, 'Rete Fuente', 0.07, 5641);
INSERT INTO IMPUESTO VALUES (3, 'Rete Fuente', 0.07, 2057);
commit; 


--Descuento:

INSERT INTO DESCUENTO VALUES(1, 'Membresia', 0.005, 2057); 
INSERT INTO DESCUENTO VALUES(1, 'Membresia', 0.005, 4289); 
INSERT INTO DESCUENTO VALUES (1, 'Membresia', 0.005, 5641);
INSERT INTO DESCUENTO VALUES (1, 'Membresia', 0.005, 5698);
INSERT INTO DESCUENTO VALUES (1, 'Membresia', 0.005, 1557);
INSERT INTO DESCUENTO VALUES (2, 'Renta Frecuente', 0.005, 2334);
INSERT INTO DESCUENTO VALUES (2, 'Renta Frecuente', 0.005, 1306);
INSERT INTO DESCUENTO VALUES (2, 'Renta Frecuente', 0.005, 1908);
commit;

--Bono:
INSERT INTO BONO VALUES(5593, 5800);
INSERT INTO BONO VALUES(4369, 6960);
INSERT INTO BONO VALUES(4421, 13920);
INSERT INTO BONO VALUES(4286, 17400);
INSERT INTO BONO VALUES(3630, 20880);
INSERT INTO BONO VALUES(5129, 10440);
INSERT INTO BONO VALUES(3840, 9280);
INSERT INTO BONO VALUES(7848, 9280);
INSERT INTO BONO VALUES(7708, 20880);
INSERT INTO BONO VALUES(5983, 23200);
commit; 

--Efectivo: 
INSERT INTO EFECTIVO VALUES(5641, 43050);
INSERT INTO EFECTIVO VALUES(5698, 6930);
INSERT INTO EFECTIVO VALUES(8172, 13920);
INSERT INTO EFECTIVO VALUES(6183, 24360);
INSERT INTO EFECTIVO VALUES(4289, 27720);
INSERT INTO EFECTIVO VALUES(5110, 18300);
INSERT INTO EFECTIVO VALUES(8392, 15080);
INSERT INTO EFECTIVO VALUES(3302, 26680);
INSERT INTO EFECTIVO VALUES(8838, 11600);
INSERT INTO EFECTIVO VALUES(1716, 34800);
commit;

--Crédito: 
INSERT INTO CREDITO VALUES(1746, 22040, 'Mastercard'); 
INSERT INTO CREDITO VALUES(1557, 16170, 'Mastercard'); 
INSERT INTO CREDITO VALUES(2334, 16240, 'Mastercard');
INSERT INTO CREDITO VALUES(1306, 13860, 'Mastercard');
INSERT INTO CREDITO VALUES(1908, 24255, 'Mastercard');
INSERT INTO CREDITO VALUES(4532, 25620, 'Visa');
INSERT INTO CREDITO VALUES(9772, 24360, 'Visa');
INSERT INTO CREDITO VALUES(4741, 10440, 'Visa');
INSERT INTO CREDITO VALUES(2057, 26985, 'Visa');
INSERT INTO CREDITO VALUES(4318, 24360, 'Visa');
commit; 

--ConductorXPago:
INSERT INTO conductorXpago VALUES (1, 5593);
INSERT INTO conductorXpago VALUES (31, 5593);
INSERT INTO conductorXpago VALUES (13, 4369);
INSERT INTO conductorXpago VALUES (18, 4421);
INSERT INTO conductorXpago VALUES (48, 4421);
INSERT INTO conductorXpago VALUES (26, 4286);
INSERT INTO conductorXpago VALUES (27, 4286);
INSERT INTO conductorXpago VALUES (28, 4286);
INSERT INTO conductorXpago VALUES (29, 3630);
INSERT INTO conductorXpago VALUES (30, 3630);
INSERT INTO conductorXpago VALUES (32, 5129);
INSERT INTO conductorXpago VALUES (33, 5129);
INSERT INTO conductorXpago VALUES (34, 3840);
INSERT INTO conductorXpago VALUES (35, 7848);
INSERT INTO conductorXpago VALUES (36, 7848);
INSERT INTO conductorXpago VALUES (47, 7848);
INSERT INTO conductorXpago VALUES (37, 7708);
INSERT INTO conductorXpago VALUES (38, 7708);
INSERT INTO conductorXpago VALUES (39, 5983);
-----------
INSERT INTO conductorXpago VALUES (40, 5641);
INSERT INTO conductorXpago VALUES (41, 5641);
INSERT INTO conductorXpago VALUES (13, 5698);
INSERT INTO conductorXpago VALUES (1, 8172);
INSERT INTO conductorXpago VALUES (18, 6183);
INSERT INTO conductorXpago VALUES (42, 4289);
INSERT INTO conductorXpago VALUES (43, 4289);
INSERT INTO conductorXpago VALUES (44, 5110);
INSERT INTO conductorXpago VALUES (45, 5110);
INSERT INTO conductorXpago VALUES (46, 8392);
INSERT INTO conductorXpago VALUES (47, 8392);
INSERT INTO conductorXpago VALUES (48, 3302);
INSERT INTO conductorXpago VALUES (26, 8838);
INSERT INTO conductorXpago VALUES (27, 8838);
INSERT INTO conductorXpago VALUES (18, 1716);
----------------
INSERT INTO conductorXpago VALUES (28, 1746);
INSERT INTO conductorXpago VALUES (29, 1557);
INSERT INTO conductorXpago VALUES (30, 1557);
INSERT INTO conductorXpago VALUES (31, 2334);
INSERT INTO conductorXpago VALUES (32, 2334);
INSERT INTO conductorXpago VALUES (33, 1306);
INSERT INTO conductorXpago VALUES (34, 1908);
INSERT INTO conductorXpago VALUES (35, 1908);
INSERT INTO conductorXpago VALUES (36, 4532);
INSERT INTO conductorXpago VALUES (37, 4532);
INSERT INTO conductorXpago VALUES (38, 9772);
INSERT INTO conductorXpago VALUES (39, 4741);
INSERT INTO conductorXpago VALUES (40, 4741);
INSERT INTO conductorXpago VALUES (41, 4741);
INSERT INTO conductorXpago VALUES (18, 2057);
INSERT INTO conductorXpago VALUES (42, 4318);
INSERT INTO conductorXpago VALUES (43, 4318);
INSERT INTO conductorXpago VALUES (44, 4318);
commit; 

--Renta: 
INSERT INTO RENTA VALUES (4457, to_date('23/04/2021', 'dd/mm/yyyy'), null, to_date('14:11:14', 'hh24:mi:ss'), 1, '584GNU', 5593);
INSERT INTO RENTA VALUES (1446, to_date('14/10/2020', 'dd/mm/yyyy'), to_date('10/02/2020', 'dd/mm/yyyy'), to_date('09:01:20', 'hh24:mi:ss'), 13, '053DIW', 4369);
INSERT INTO RENTA VALUES (4643, to_date('23/04/2021', 'dd/mm/yyyy'), to_date('01/09/2019', 'dd/mm/yyyy'), to_date('07:58:21', 'hh24:mi:ss'), 18, '430FMF', 4421);
INSERT INTO RENTA VALUES (4458, to_date('29/05/2020', 'dd/mm/yyyy'), to_date('18/12/2019', 'dd/mm/yyyy'), to_date('13:07:01', 'hh24:mi:ss'), 2, '829PVO', 4286);
INSERT INTO RENTA VALUES (3415, to_date('30/04/2018', 'dd/mm/yyyy'), to_date('06/05/2018', 'dd/mm/yyyy'), to_date('11:37:22', 'hh24:mi:ss'), 3, '977FAP', 3630);
INSERT INTO RENTA VALUES (3968, to_date('23/04/2021', 'dd/mm/yyyy'), to_date('28/04/2018', 'dd/mm/yyyy'), to_date('12:27:28', 'hh24:mi:ss'), 4, '602DOF', 5129);
INSERT INTO RENTA VALUES (1518, to_date('24/04/2021', 'dd/mm/yyyy'), null, to_date('06:57:28', 'hh24:mi:ss'), 5, '259BZX', 3840);
INSERT INTO RENTA VALUES (3447, to_date('14/10/2020', 'dd/mm/yyyy'), to_date('13/02/2020', 'dd/mm/yyyy'), to_date('09:00:28', 'hh24:mi:ss'), 6, '259BZX', 7848);
INSERT INTO RENTA VALUES (3141, to_date('01/02/2020', 'dd/mm/yyyy'), to_date('08/02/2020', 'dd/mm/yyyy'), to_date('10:50:28', 'hh24:mi:ss'), 5, '858GRV', 7708);
INSERT INTO RENTA VALUES (2058, to_date('01/02/2020', 'dd/mm/yyyy'), to_date('08/02/2020', 'dd/mm/yyyy'), to_date('15:55:18', 'hh24:mi:ss'), 7, '977FAP', 5983);
-----------
INSERT INTO RENTA VALUES (2737, to_date('01/02/2020', 'dd/mm/yyyy'), to_date('08/02/2020', 'dd/mm/yyyy'), to_date('16:18:18', 'hh24:mi:ss'), 8, '644OEI', 5641);--
INSERT INTO RENTA VALUES (4750, to_date('22/04/2021', 'dd/mm/yyyy'), null, to_date('18:18:18', 'hh24:mi:ss'), 13, '977FAP', 5698);
INSERT INTO RENTA VALUES (4061, to_date('14/04/2019', 'dd/mm/yyyy'), to_date('19/04/2019', 'dd/mm/yyyy'), to_date('08:20:11', 'hh24:mi:ss'), 1, '977FAP', 8172);
INSERT INTO RENTA VALUES (4528, to_date('20/01/2020', 'dd/mm/yyyy'), to_date('25/01/2020', 'dd/mm/yyyy'), to_date('06:25:30', 'hh24:mi:ss'), 18, '977FAP', 6183);
INSERT INTO RENTA VALUES (4566, to_date('14/10/2020', 'dd/mm/yyyy'), to_date('20/01/2020', 'dd/mm/yyyy'), to_date('19:55:30', 'hh24:mi:ss'), 9, '826YOX', 4289);
INSERT INTO RENTA VALUES (2019, to_date('25/04/2021', 'dd/mm/yyyy'), null, to_date('11:25:35', 'hh24:mi:ss'), 14, '578TDC', 5110);
INSERT INTO RENTA VALUES (3052, to_date('18/10/2020', 'dd/mm/yyyy'), to_date('26/11/2020', 'dd/mm/yyyy'), to_date('15:25:36', 'hh24:mi:ss'), 12, '300VXJ', 8392);
INSERT INTO RENTA VALUES (4438, to_date('20/07/2020', 'dd/mm/yyyy'), to_date('23/07/2020', 'dd/mm/yyyy'), to_date('10:30:36', 'hh24:mi:ss'), 11, '977FAP', 3302);
INSERT INTO RENTA VALUES (3484, to_date('14/10/2020', 'dd/mm/yyyy'), to_date('20/07/2019', 'dd/mm/yyyy'), to_date('09:31:39', 'hh24:mi:ss'), 14, '399SCX', 8838);
INSERT INTO RENTA VALUES (7899, to_date('05/03/2019', 'dd/mm/yyyy'), to_date('09/03/2019', 'dd/mm/yyyy'), to_date('06:15:10', 'hh24:mi:ss'), 18, '977FAP', 1716);
----------------
INSERT INTO RENTA VALUES (3887, to_date('25/04/2021', 'dd/mm/yyyy'), null, to_date('09:25:10', 'hh24:mi:ss'), 25, '977FAP', 1746);
INSERT INTO RENTA VALUES (8830, to_date('29/05/2020', 'dd/mm/yyyy'), to_date('31/05/2020', 'dd/mm/yyyy'), to_date('10:15:20', 'hh24:mi:ss'), 24, '977FAP', 1557);
INSERT INTO RENTA VALUES (7942, to_date('15/12/2019', 'dd/mm/yyyy'), to_date('13/06/2020', 'dd/mm/yyyy'), to_date('18:15:20', 'hh24:mi:ss'), 25, '361LCV', 2334);
INSERT INTO RENTA VALUES (4923, to_date('23/04/2021', 'dd/mm/yyyy'), to_date('30/07/2020', 'dd/mm/yyyy'), to_date('10:55:20', 'hh24:mi:ss'), 24, '299KMQ', 1306);
INSERT INTO RENTA VALUES (7663, to_date('15/12/2019', 'dd/mm/yyyy'), to_date('30/08/2020', 'dd/mm/yyyy'), to_date('09:58:36', 'hh24:mi:ss'), 23, '977FAP', 1908);
INSERT INTO RENTA VALUES (6089, to_date('23/04/2021', 'dd/mm/yyyy'), to_date('19/09/2019', 'dd/mm/yyyy'), to_date('19:58:31', 'hh24:mi:ss'), 22, '977FAP', 4532);
INSERT INTO RENTA VALUES (4543, to_date('23/04/2021', 'dd/mm/yyyy'), to_date('05/01/2019', 'dd/mm/yyyy'), to_date('09:48:31', 'hh24:mi:ss'), 21, '103FXO', 9772);
INSERT INTO RENTA VALUES (6676, to_date('23/04/2021', 'dd/mm/yyyy'), null, to_date('09:48:31', 'hh24:mi:ss'), 21, '977FAP', 4741);
INSERT INTO RENTA VALUES (3045, to_date('23/04/2021', 'dd/mm/yyyy'), null, to_date('03:48:31', 'hh24:mi:ss'), 18, '900WGW', 2057);
INSERT INTO RENTA VALUES (7273, to_date('14/10/2020', 'dd/mm/yyyy'), to_date('19/10/2020', 'dd/mm/yyyy'), to_date('02:58:31', 'hh24:mi:ss'), 20, '977FAP', 4318);

--Tarjetas de crédito:
INSERT INTO TARJETACREDITO VALUES(5166772817388344,'Mastercard',2,2037,1);
INSERT INTO TARJETACREDITO VALUES(5526068310880613,'Mastercard',12,2039,3);
INSERT INTO TARJETACREDITO VALUES(5408734507801646,'Mastercard',5,2029,5);
INSERT INTO TARJETACREDITO VALUES(5379434035571028,'Mastercard',6,2040,7);
INSERT INTO TARJETACREDITO VALUES(5140148663640958,'Mastercard',7,2028,12);
INSERT INTO TARJETACREDITO VALUES(5333962308851292,'Mastercard',9,2034,13);
INSERT INTO TARJETACREDITO VALUES(5559281628625428,'Mastercard',8,2096,11);
INSERT INTO TARJETACREDITO VALUES(5377251881621059,'Mastercard',3,2060,15);
INSERT INTO TARJETACREDITO VALUES(5396278208374267,'Mastercard',11,2024,17);
INSERT INTO TARJETACREDITO VALUES(5173120010240345,'Mastercard',10,2026,19);
INSERT INTO TARJETACREDITO VALUES(4185650783957831,'Visa',3,2034,2);
INSERT INTO TARJETACREDITO VALUES(4539357276731607,'Visa',4,2036,4);
INSERT INTO TARJETACREDITO VALUES(4056378210401746,'Visa',1,2022,6);
INSERT INTO TARJETACREDITO VALUES(4929291571286041,'Visa',7,2023,8);
INSERT INTO TARJETACREDITO VALUES(4486553155320388,'Visa',6,2027,10);
INSERT INTO TARJETACREDITO VALUES(4876380651663246,'Visa',8,2028,16);
INSERT INTO TARJETACREDITO VALUES(4439335242329517,'Visa',12,2050,14);
INSERT INTO TARJETACREDITO VALUES(4556842776606134,'Visa',11,2036,18);
INSERT INTO TARJETACREDITO VALUES(4486739872656572,'Visa',5,2045,20);
INSERT INTO TARJETACREDITO VALUES(4556914334468032,'Visa',11,2041,22);
INSERT INTO TARJETACREDITO VALUES(5359577491927383,'Mastercard',11,2029,23);
INSERT INTO TARJETACREDITO VALUES(5263530919971777,'Mastercard',11,2045,24);
INSERT INTO TARJETACREDITO VALUES(4024007118964849,'Visa',1,2024,21);
INSERT INTO TARJETACREDITO VALUES(4532986255003369,'Visa',10,2037,25);
INSERT INTO TARJETACREDITO VALUES(4648374841083230,'Visa',9,2030,9);
commit;

--Fotos;
INSERT INTO FOTO VALUES(156,'Carro vista lateral',to_date('20/03/2020', 'dd/mm/yyyy'),1,'584GNU');
INSERT INTO FOTO VALUES(1481,'Carro vista frontal',to_date('1/06/2020', 'dd/mm/yyyy'),1,'053DIW');
INSERT INTO FOTO VALUES(2000,'Carro vista lateral',to_date('11/03/2020', 'dd/mm/yyyy'),1,'430FMF');
INSERT INTO FOTO VALUES(1214,'Carro vista laretal',to_date('21/10/2020', 'dd/mm/yyyy'),1,'829PVO');
INSERT INTO FOTO VALUES(1886,'Carro vista aérea',to_date('21/09/2020', 'dd/mm/yyyy'),1,'858GRV');
INSERT INTO FOTO VALUES(1719,'Carro vista por dentro',to_date('21/05/2020', 'dd/mm/yyyy'),1,'602DOF');
INSERT INTO FOTO VALUES(1379,'Carro vista del motor',to_date('21/07/2020', 'dd/mm/yyyy'),1,'259BZX');
INSERT INTO FOTO VALUES(1642,'Repuestos del carro',to_date('21/08/2020', 'dd/mm/yyyy'),1,'969ECK');
INSERT INTO FOTO VALUES(1670,'Carro vista lateral',to_date('21/02/2020', 'dd/mm/yyyy'),1,'644OEI');
INSERT INTO FOTO VALUES(1738,'Carro muestra de colores',to_date('31/01/2020', 'dd/mm/yyyy'),1,'654CZC');
INSERT INTO FOTO VALUES(1219,'Carro vista trasera',to_date('11/04/2020', 'dd/mm/yyyy'),1,'571AVU');
INSERT INTO FOTO VALUES(1143,'Repuestos del carro',to_date('10/04/2020', 'dd/mm/yyyy'),1,'578TDC');
INSERT INTO FOTO VALUES(1020,'Carro vista por dentro',to_date('17/09/2020', 'dd/mm/yyyy'),1,'440HDL');
INSERT INTO FOTO VALUES(1644,'Repuestos del carro',to_date('18/08/2020', 'dd/mm/yyyy'),1,'269NDK');
INSERT INTO FOTO VALUES(1701,'Carro vista del motor',to_date('1/04/2020', 'dd/mm/yyyy'),1,'300VXJ');
INSERT INTO FOTO VALUES(1516,'Carro vista aérea',to_date('2/10/2020', 'dd/mm/yyyy'),1,'977FAP');
INSERT INTO FOTO VALUES(1847,'Carro vista lateral',to_date('21/04/2020', 'dd/mm/yyyy'),1,'299KMQ');
INSERT INTO FOTO VALUES(1560,'Carro vista trasera',to_date('21/04/2020', 'dd/mm/yyyy'),1,'164YNI');
INSERT INTO FOTO VALUES(1326,'Carro vista fronta',to_date('21/04/2020', 'dd/mm/yyyy'),1,'103FXO');
INSERT INTO FOTO VALUES(1767,'Repuestos del carro',to_date('21/04/2020', 'dd/mm/yyyy'),1,'460QXY');
INSERT INTO FOTO VALUES(1773,'Carro vista del motor',to_date('21/04/2020', 'dd/mm/yyyy'),1,'347FEO');
INSERT INTO FOTO VALUES(1662,'Carro vista aérea',to_date('21/04/2020', 'dd/mm/yyyy'),1,'175SPE');
INSERT INTO FOTO VALUES(1048,'Carro vista por dentro',to_date('21/03/2020', 'dd/mm/yyyy'),1,'826YOX');
INSERT INTO FOTO VALUES(1095,'Carro vista lateral',to_date('21/2/2020', 'dd/mm/yyyy'),1,'819KXH');
INSERT INTO FOTO VALUES(1141,'Carro vista trasera',to_date('21/11/2020', 'dd/mm/yyyy'),1,'511EVI');
INSERT INTO FOTO VALUES(1737,'Carro vista aérea',to_date('21/12/2020', 'dd/mm/yyyy'),1,'399SCX');
INSERT INTO FOTO VALUES(1502,'Carro vista lateral',to_date('21/01/2020', 'dd/mm/yyyy'),1,'900WGW');
INSERT INTO FOTO VALUES(1169,'Carro vista fronta',to_date('21/03/2020', 'dd/mm/yyyy'),1,'514SII');
INSERT INTO FOTO VALUES(1956,'Carro vista por dentro',to_date('21/08/2020', 'dd/mm/yyyy'),1,'433PSS');
INSERT INTO FOTO VALUES(1101,'Carro vista trasera',to_date('21/10/2020', 'dd/mm/yyyy'),1,'361LCV');
INSERT INTO FOTO VALUES(1816,'Carro vista lateral',to_date('21/09/2020', 'dd/mm/yyyy'),1,'164HKL');
commit;


--CONSULTAS; 

--Primer Punto: Cantidad Total de carros rentados por cliente por períodos (mes, año)

WITH CARRORENTAPERIODO AS (
     SELECT EXTRACT (YEAR FROM RENTA.FECHARENTA)AS ANIO,EXTRACT (MONTH FROM RENTA.FECHARENTA)AS MES,  RENTA.CLIENTE_CODIGOPERSONA AS CLIENTE, PERSONA.NOMBRE AS NOMBRE
     FROM RENTA,PERSONA
     WHERE RENTA.CLIENTE_CODIGOPERSONA = PERSONA.CODIGOPERSONA
)
SELECT DISTINCT CARRORENTAPERIODO.ANIO AS ANIO, CARRORENTAPERIODO.MES AS MES, CARRORENTAPERIODO.CLIENTE AS CODIGOCLIENTE, CARRORENTAPERIODO.NOMBRE AS NOMBRECLIENTE, COUNT(CARRORENTAPERIODO.CLIENTE) AS RENTAS
FROM CARRORENTAPERIODO
GROUP BY CARRORENTAPERIODO.ANIO, CARRORENTAPERIODO.MES,CARRORENTAPERIODO.CLIENTE, CARRORENTAPERIODO.NOMBRE
ORDER BY CARRORENTAPERIODO.ANIO ASC, CARRORENTAPERIODO.MES ASC, CARRORENTAPERIODO.NOMBRE ASC;

-- Segundo Punto: Suma total pagada a los dueños por las rentas de sus carros (suma del valor de renta estipulado)

WITH RENTADUENIO AS (
     SELECT RENTA.CARRO_PLACA AS PLACA, CARRO.DUENIO_CODIGOPERSONA AS CODIGODUENIO, PERSONA.NOMBRE AS NOMBREDUENIO, CARRO.VALORRENTA AS VALOR
     FROM CARRO,PERSONA, RENTA
     WHERE RENTA.CARRO_PLACA = CARRO.PLACA AND CARRO.DUENIO_CODIGOPERSONA = PERSONA.CODIGOPERSONA
)
SELECT DISTINCT RENTADUENIO.CODIGODUENIO AS CODIGO_DUENIO, RENTADUENIO.NOMBREDUENIO AS NOMBRE_DUENIO, SUM(RENTADUENIO.VALOR) AS RENTA_TOTAL
FROM RENTADUENIO
GROUP BY RENTADUENIO.CODIGODUENIO, RENTADUENIO.NOMBREDUENIO
ORDER BY RENTADUENIO.CODIGODUENIO ASC;

-- Tercer Punto: Suma total de comisiones que la empresa obtiene por las rentas, por períodos, por dueño.

    --Comisión por las rentas

WITH ComisionXRenta AS(
        SELECT renta. pago_codigopago as Renta, SUM((carro.valorRenta*(comision.porcentaje))) as Comision
        FROM renta, comision, carro
        WHERE renta.pago_codigopago = comision.pago_codigopago and renta.carro_placa = carro.placa
        GROUP BY renta. pago_codigopago
    )
SELECT to_char(ComisionXRenta.Renta) as Renta, ComisionXRenta.Comision as Comision
FROM ComisionXRenta

UNION

SELECT 'Total', SUM(ComisionXRenta.Comision)
FROM ComisionXRenta;

    --Comisión por periodos
    
WITH ComisionXPeriodo AS (

        SELECT EXTRACT(year FROM renta.fecharenta) as Anio, EXTRACT(month FROM renta.fecharenta) as Mes, SUM(carro.valorrenta*comision.porcentaje) as Total
        FROM renta, carro, comision
        WHERE renta.pago_codigopago = comision.pago_codigopago and renta.carro_placa = carro.placa
        GROUP BY EXTRACT(year FROM renta.fecharenta), EXTRACT(month FROM renta.fecharenta)
        ORDER BY EXTRACT(year FROM renta.fecharenta), EXTRACT(month FROM renta.fecharenta)
        
    ), ComisionXAnio AS (
    
        SELECT EXTRACT(year FROM renta.fecharenta) as Anio, SUM(carro.valorrenta*comision.porcentaje) as Total
        FROM renta, carro, comision
        WHERE renta.pago_codigopago = comision.pago_codigopago and renta.carro_placa = carro.placa
        GROUP BY EXTRACT(year FROM renta.fecharenta)
        ORDER BY EXTRACT(year FROM renta.fecharenta)
        
    ), TotalAnio AS(
        
        SELECT SUM(ComisionXAnio.Total) as Total
        FROM ComisionXAnio
        
    ), TotalPeriodo AS(
    
        SELECT SUM(ComisionXPeriodo.Total) as Total
        FROM ComisionXPeriodo
        
    )
SELECT to_char(ComisionXPeriodo.Anio) as Año, to_char(ComisionXPeriodo.Mes) as Mes, ComisionXPeriodo.Total as Com_Total, ComisionXAnio.Total as Com_Por_Año
FROM ComisionXPeriodo, ComisionXAnio
WHERE ComisionXPeriodo.Anio = ComisionXAnio.Anio

UNION 

SELECT 'Total', ' ', TotalPeriodo.Total, TotalAnio.Total
FROM ComisionXPeriodo, ComisionXAnio, TotalAnio, TotalPeriodo
WHERE ComisionXPeriodo.Anio = ComisionXAnio.Anio and TotalPeriodo.Total = TotalAnio.Total;

    --Comision por dueño: 
    
WITH ComisionXDuenio AS(

        SELECT duenio.codigopersona as Codigo, persona.nombre as Nombre, persona.apellidos as Apellidos, SUM((carro.valorRenta*(comision.porcentaje))) as Comision
        FROM renta, comision, carro, persona, duenio 
        WHERE renta.pago_codigopago = comision.pago_codigopago and renta.carro_placa = carro.placa and carro.duenio_codigopersona = duenio.codigopersona and duenio.codigopersona = persona.codigopersona
        GROUP BY duenio.codigopersona, persona.nombre, persona.apellidos
        ORDER BY duenio.codigopersona
    )
SELECT to_char(ComisionXDuenio.Codigo) as Codigo, ComisionXDuenio.Nombre as Nombre, ComisionXDuenio.Apellidos as Apellidos, ComisionXDuenio.Comision as Comision
FROM ComisionXDuenio

UNION 

SELECT 'Total', ' ', ' ', SUM(ComisionXDuenio.Comision)
FROM ComisionXDuenio;

-- Cuarto Punto: Suma y cantidad de rentas por cliente, por período. 

CREATE VIEW tabla_efectivo (cod, monto) AS 
    SELECT renta.pago_codigopago, efectivo.monto
    FROM renta, pago, efectivo
    WHERE renta.pago_codigopago = pago.codigopago and efectivo.codigopago = pago.codigopago;
    
grant all on tabla_efectivo to public;

CREATE VIEW tabla_bono (cod, monto) AS 
    SELECT renta.pago_codigopago, bono.valor
    FROM renta, pago, bono
    WHERE renta.pago_codigopago = pago.codigopago and bono.codigopago = pago.codigopago;

grant all on tabla_bono to public;

CREATE VIEW total_montos (cod, monto) AS 
   SELECT * 
   FROM tabla_efectivo 
   UNION
   SELECT *
   FROM tabla_bono;

grant all on total_montos to public;

SELECT extract(year from renta.fecharenta) as Año, extract(month from renta.fecharenta) as Mes, SUM (total_montos.monto) as Total_Monto , COUNT (*) as Cantidad
FROM total_montos, renta, cliente
WHERE renta.cliente_codigopersona = cliente.codigopersona
and renta.pago_codigopago = total_montos.cod
GROUP BY cliente.codigopersona, extract(year from renta.fecharenta), extract(month from renta.fecharenta)
ORDER BY extract(year from renta.fecharenta), extract(month from renta.fecharenta);

-- Quinto Punto: Número total de por país, departamento, municipio y ubicación (location)

WITH rentaxubicacion as(
    select persona.ubicacion_idpais as PAIS, persona.ubicacion_iddpto as DEPARTAMENTO, persona.ubicacion_idmun as MUNICIPIO, ubicacion.barrio AS BARRIO, COUNT(renta.codigorenta) as CANTIDAD_DE_RENTAS
    from((renta inner join cliente on renta.cliente_codigopersona = cliente.codigopersona)left join persona on cliente.codigopersona = persona.codigopersona)left join ubicacion on ubicacion.municipio_idmun = persona.ubicacion_idmun and persona.ubicacion_iddpto = ubicacion.departamento_iddpto and persona.ubicacion_idpais = ubicacion.pais_idpais 
    group by persona.ubicacion_idpais, persona.ubicacion_iddpto, persona.ubicacion_idmun, ubicacion.barrio)
select pais.nombre as PAIS, municipio.nombre as MUNICIPIO, departamento.nombre as DEPARTAMENTO, rentaxubicacion.barrio as BARRIO, rentaxubicacion.cantidad_de_rentas as CANTIDAD_DE_RENTAS
from ((rentaxubicacion left join pais on pais.idpais = rentaxubicacion.pais)left join  municipio on rentaxubicacion.municipio = municipio.idmun)left join departamento on rentaxubicacion.departamento = departamento.iddpto;

-- Sexto Punto: Reporte de pagos por período, por entidad autorizadora.

SELECT EXTRACT(year FROM renta.fecharenta) as Anio, EXTRACT(month FROM renta.fecharenta) as Mes, credito.entidad as Autorizadora, COUNT(*) as Total
FROM renta, pago, credito
WHERE renta.pago_codigopago = pago.codigopago and pago.tipo='C' and pago.codigopago = credito.codigopago 
GROUP BY EXTRACT(year FROM renta.fecharenta), EXTRACT(month FROM renta.fecharenta), credito.entidad
ORDER BY EXTRACT(year FROM renta.fecharenta), EXTRACT(month FROM renta.fecharenta);
    

-- Séptimo Punto: Reporte por periodos (año, mes) de Impuestos que se deben pagar por cada renta.

WITH impuestosxperiodo as(
    SELECT extract(year from renta.fecharenta)as Anio, extract(month from renta.fecharenta)as MES,impuesto.codigoimpuesto AS CODIGO_IMPUESTO, renta.codigorenta as CODIGO_RENTA
    from (renta inner join pago on renta.pago_codigopago = pago.codigopago)left join impuesto on pago.codigopago = impuesto.pago_codigopago
    group by extract(year from renta.fecharenta), extract(month from renta.fecharenta),impuesto.codigoimpuesto, renta.codigorenta
    )
select distinct impuestosxperiodo.anio AS AÑO, impuestosxperiodo.mes as MES, impuestosxperiodo.codigo_renta AS CODIGO_DE_RENTA, impuesto.tipo as TIPO_IMUPESTO
from ((impuestosxperiodo inner join renta on  renta.codigorenta = impuestosxperiodo.codigo_renta)left join impuesto on impuestosxperiodo.codigo_impuesto = impuesto.codigoimpuesto)left join pago on pago.codigopago = impuesto.pago_codigopago
order by impuestosxperiodo.anio ASC, impuestosxperiodo.mes ASC;

-- Octavo Punto: ¿Cuáles son los carros más rentados?

SELECT carro.placa, carro.marca, carro.estado , COUNT(renta.carro_placa) AS CantidadDeRentas
FROM carro, renta
WHERE renta.carro_placa = carro.placa
GROUP BY carro.placa, carro.marca, carro.estado
ORDER BY CantidadDeRentas DESC;

-- Noveno Punto: ¿En qué departamento se rentan más carros?

WITH RENTADEPARTAMENTO AS (
     SELECT PERSONA.UBICACION_IDDPTO AS CODIGODPTO, DEPARTAMENTO.NOMBRE AS DEPARTAMENTO, RENTA.CARRO_PLACA AS PLACA
     FROM RENTA, CARRO, PERSONA, DEPARTAMENTO
     WHERE RENTA.CARRO_PLACA = CARRO.PLACA AND CARRO.DUENIO_CODIGOPERSONA = PERSONA.CODIGOPERSONA AND DEPARTAMENTO.IDDPTO = PERSONA.UBICACION_IDDPTO
)
SELECT DISTINCT RENTADEPARTAMENTO.CODIGODPTO AS CODIGO_DEPARTAMENTO, RENTADEPARTAMENTO.DEPARTAMENTO AS DEPARTAMENTO, COUNT(RENTADEPARTAMENTO.PLACA) AS NUMERO_RENTAS
FROM RENTADEPARTAMENTO
GROUP BY RENTADEPARTAMENTO.CODIGODPTO, RENTADEPARTAMENTO.DEPARTAMENTO
ORDER BY NUMERO_RENTAS DESC;

-- Décimo Punto: ¿Cuáles son las carros más visitados por los visitantes?

SELECT carro.placa, carro.marca, carro.estado , COUNT(renta.carro_placa) AS CantidadVisitados
FROM carro, renta
WHERE renta.carro_placa = carro.placa
GROUP BY carro.placa, carro.marca, carro.estado
ORDER BY CantidadVisitados DESC;

-- Décimo Primer Punto: Produzca un listado que contenga: fecha de la renta, placa del carro rentado, nombre del cliente que renta, total de la renta (VTR), total de descuentos (TD), total de impuestos (TI) y total a pagar (VTP), listado de conductores

WITH ValorComTot AS (
    
        SELECT renta. pago_codigopago as Renta, SUM((carro.valorRenta*(comision.porcentaje))) as SumTot
        FROM renta, comision, carro
        WHERE renta.pago_codigopago = comision.pago_codigopago and renta.carro_placa = carro.placa
        GROUP BY renta. pago_codigopago
        
    ), VTR AS (
    
        SELECT renta.pago_codigopago as Renta, carro.valorrenta + ValorComTot.SumTot as SumTot
        FROM ValorComTot, renta, carro
        WHERE renta.pago_codigopago = ValorComTot.Renta and renta.carro_placa = carro.placa 
        
    ), ValorImpTot AS (
    
        SELECT renta. pago_codigopago as Renta, NVL(SUM((carro.valorrenta*(impuesto.porcentaje))),0) as SumTot
        FROM renta
        LEFT JOIN impuesto
        ON renta.pago_codigopago = impuesto.pago_codigopago
        LEFT JOIN carro
        ON renta.carro_placa = carro.placa
        GROUP BY renta. pago_codigopago
        
    ), ValorDescTot AS (
    
        SELECT renta. pago_codigopago as Renta, NVL(SUM((carro.valorrenta*descuento.porcentaje)),0) as SumTot
        FROM renta
        LEFT JOIN descuento
        ON renta.pago_codigopago = descuento.pago_codigopago
        LEFT JOIN carro
        ON renta.carro_placa = carro.placa
        GROUP BY renta. pago_codigopago
        
    ), VTP AS (
    
        SELECT renta.pago_codigopago as Renta, NVL(VTR.SumTot + ValorImpTot.SumTot - ValorDescTot.SumTot,0) as SumTot
        FROM renta
        LEFT JOIN VTR
        ON renta.pago_codigopago = VTR.Renta
        LEFT JOIN ValorImpTot
        ON renta.pago_codigopago = ValorImpTot.Renta
        LEFT JOIN ValorDescTot
        ON renta.pago_codigopago = ValorDescTot.Renta
        
    ), Conductores AS (
        
        SELECT renta.pago_codigopago as Renta, LISTAGG(persona.nombre, ', ') WITHIN GROUP (ORDER BY persona.nombre) as nombres
        FROM renta, persona, conductorXpago
        WHERE renta.pago_codigopago = conductorXpago.pago_codigopago and conductorXpago.codigopersona = persona.codigopersona
        GROUP BY renta.pago_codigopago
        
    )
SELECT to_char(renta.fecharenta) as FechaRenta,  renta.carro_placa as Placa, persona.nombre as Nombre, persona.apellidos as Apellidos, VTR.SumTot as VTR, ValorDescTot.SumTot as TD, ValorImpTot.SumTot as TI, VTP.SumTot as VTP, Conductores.nombres as Conductores
FROM renta, persona, carro, VTP, ValorDescTot, ValorImpTot, VTR, Conductores
WHERE renta.cliente_codigopersona = persona.codigopersona and renta.carro_placa = carro.placa and renta.pago_codigopago = VTP.Renta 
      and renta.pago_codigopago = ValorDescTot.Renta and renta.pago_codigopago = ValorImpTot.Renta and renta.pago_codigopago = VTR.Renta and renta.pago_codigopago = Conductores.Renta;

-- Décimo Segundo Punto: Liste la placa de los carros que han sido rentados en todos los periodos registrados en el sistema.

    --Se tomó el periodo por mes y año.
WITH periodosdelsistema as (
    select distinct extract(year from renta.fecharenta) as ANNIO, extract(month from renta.fecharenta) AS MES
    from renta
    group by extract(year from renta.fecharenta), extract(month from renta.fecharenta)
    ),
    carrosenP as (
    select distinct carro.placa as PLACA,extract(year from renta.fecharenta) as anio, extract(month from renta.fecharenta) as mes, count(carro.placa)AS CANTIDAD_CARRO
    from carro, renta where renta.carro_placa = carro.placa
    GROUP BY carro.placa, extract(year from renta.fecharenta), extract(month from renta.fecharenta)
    ),
    cantiTotPe as(
    select count(*) as canti
    from periodosdelsistema
    ), 
    cantitotpr as(
    select distinct carrosenP.placa as plaquita,  count(carrosenp.placa) as cantia
    from carrosenp
    group by  carrosenP.placa
    )
SELECT cantitotpr.plaquita as PLACA_DEL_CARRO
from   cantitotpe, cantitotpr
where cantitotpr.cantia = cantitotpe.canti or cantitotpr.cantia > cantitotpe.canti;

-- Décimo Tercer Punto: Liste año y mes de la renta, el nombre del cliente, total de la renta (VTR), total de descuentos (TD), total de impuestos (TI) y total a pagar (VTP). La última fila debe llevar la suma de todas las columnas.

create view total_renta (fecha, codigo_cliente, total) as 
    SELECT renta.fecharenta, cliente.codigopersona, SUM(total_montos.monto)
    FROM renta, cliente, total_montos
    WHERE renta.cliente_codigopersona = cliente.codigopersona
    and renta.pago_codigopago = total_montos.cod
    GROUP BY renta.fecharenta, cliente.codigopersona;

grant all on total_renta to public;

create view total_descuento (fecha, codigo_cliente, total) as
    SELECT renta.fecharenta, cliente.codigopersona, SUM(descuento.porcentaje)
    FROM renta, cliente, descuento, pago, total_montos
    WHERE renta.cliente_codigopersona = cliente.codigopersona
    and renta.pago_codigopago = total_montos.cod
    and renta.pago_codigopago = pago.codigopago
    and pago.codigopago = descuento.pago_codigopago
    GROUP BY renta.fecharenta, cliente.codigopersona;
    
grant all on total_descuento to public;

create view total_impuesto (fecha, codigo_cliente, total) as
    SELECT renta.fecharenta, cliente.codigopersona, SUM(impuesto.porcentaje)
    FROM renta, cliente, impuesto, pago, total_montos
    WHERE renta.cliente_codigopersona = cliente.codigopersona
    and renta.pago_codigopago = total_montos.cod
    and renta.pago_codigopago = pago.codigopago
    and pago.codigopago = impuesto.pago_codigopago
    GROUP BY renta.fecharenta, cliente.codigopersona;

grant all on total_impuesto to public;

SELECT to_char(extract(year from renta.fecharenta)) as Año, to_char(extract(month from renta.fecharenta)) as Mes, persona.nombre as Nombre, total_renta.total as VTR, total_descuento.total as TD, total_impuesto.total as TI, (total_renta.total-(total_renta.total*total_descuento.total)+(total_impuesto.total+total_renta.total)) as VTP
FROM renta, cliente, total_renta, total_descuento, total_impuesto, persona
WHERE renta.fecharenta = total_renta.fecha
and renta.fecharenta = total_descuento.fecha
and renta.fecharenta = total_impuesto.fecha
and renta.cliente_codigopersona = cliente.codigopersona
and cliente.codigopersona = persona.codigopersona
and cliente.codigopersona = total_descuento.codigo_cliente
and cliente.codigopersona = total_impuesto.codigo_cliente
and cliente.codigopersona = total_renta.codigo_cliente

UNION 

SELECT 'Total', ' ', ' ', SUM(total_renta.total), SUM(total_descuento.total), SUM(total_impuesto.total ), SUM ((total_renta.total-(total_renta.total*total_descuento.total)+(total_impuesto.total+total_renta.total)))
FROM total_renta, total_descuento, total_impuesto, renta, cliente, persona
WHERE renta.fecharenta = total_renta.fecha
and renta.fecharenta = total_descuento.fecha
and renta.fecharenta = total_impuesto.fecha
and renta.cliente_codigopersona = cliente.codigopersona
and cliente.codigopersona = persona.codigopersona
and cliente.codigopersona = total_descuento.codigo_cliente
and cliente.codigopersona = total_impuesto.codigo_cliente
and cliente.codigopersona = total_renta.codigo_cliente;

-- Décimo Cuarto Punto: Reporte de rentas por país, departamento. Se debe listar el nombre del país, el nombre del departamento, la fecha de renta y el total a pagar (VTP). Se deben mostrar los totales por país y departamento

WITH rentaxubicacion as(
        select distinct persona.ubicacion_idpais as PAIS, persona.ubicacion_iddpto as DEPARTAMENTO, renta.codigorenta as codigorenta, renta.fecharenta as fechita
        from(renta inner join cliente on renta.cliente_codigopersona = cliente.codigopersona)inner join persona on cliente.codigopersona = persona.codigopersona
        group by persona.ubicacion_idpais, persona.ubicacion_iddpto, renta.codigorenta, renta.fecharenta
        
    ),ValorComTot AS (
    
        SELECT renta. pago_codigopago as Renta, SUM((carro.valorRenta*(comision.porcentaje))) as SumTot
        FROM renta, comision, carro
        WHERE renta.pago_codigopago = comision.pago_codigopago and renta.carro_placa = carro.placa
        GROUP BY renta. pago_codigopago
        
    ),  VTR AS (
    
        SELECT renta.pago_codigopago as Renta, carro.valorrenta + ValorComTot.SumTot as SumTot
        FROM ValorComTot, renta, carro
        WHERE renta.pago_codigopago = ValorComTot.Renta and renta.carro_placa = carro.placa 
        
    ), ValorImpTot AS (
    
        SELECT renta. pago_codigopago as Renta, NVL(SUM((carro.valorrenta*(impuesto.porcentaje))),0) as SumTot
        FROM renta
        LEFT JOIN impuesto
        ON renta.pago_codigopago = impuesto.pago_codigopago
        LEFT JOIN carro
        ON renta.carro_placa = carro.placa
        GROUP BY renta. pago_codigopago
        
    ), ValorDescTot AS (
    
        SELECT renta. pago_codigopago as Renta, NVL(SUM((carro.valorrenta*descuento.porcentaje)),0) as SumTot
        FROM renta
        LEFT JOIN descuento
        ON renta.pago_codigopago = descuento.pago_codigopago
        LEFT JOIN carro
        ON renta.carro_placa = carro.placa
        GROUP BY renta. pago_codigopago
        
    ), VTP AS (
        SELECT renta.pago_codigopago as Renta, NVL(VTR.SumTot + ValorImpTot.SumTot - ValorDescTot.SumTot,0) as SumTot, renta.codigorenta as rentica
        FROM renta
        LEFT JOIN VTR
        ON renta.pago_codigopago = VTR.Renta
        LEFT JOIN ValorImpTot
        ON renta.pago_codigopago = ValorImpTot.Renta
        LEFT JOIN ValorDescTot
        ON renta.pago_codigopago = ValorDescTot.Renta
        
    ), TotalesDepPais as (
        select rentaxubicacion.pais as PAIS, rentaxubicacion.departamento AS DPTO ,SUM(vtp.sumtot)as VALOR_TOTAL_RENTAS
        from rentaxubicacion left join VTP on rentaxubicacion.codigorenta = VTP.rentica left join pais on pais.idpais = rentaxubicacion.pais left join departamento on rentaxubicacion.departamento = departamento.iddpto
        group by rollup (rentaxubicacion.pais, rentaxubicacion.departamento)
    )
select pais.nombre as PAIS, departamento.nombre as DEPARTAMENTO, to_char(rentaxubicacion.fechita) as FECHA_DE_RENTA, VTP.sumtot as VALOR_DE_RENTA, totalesdeppais.valor_total_rentas as VALOR_TOTAL_RENTAS
from rentaxubicacion left join VTP on rentaxubicacion.codigorenta = VTP.rentica left join pais on pais.idpais = rentaxubicacion.pais left join departamento on rentaxubicacion.departamento = departamento.iddpto left join totalesdeppais on totalesdeppais.pais = rentaxubicacion.pais and rentaxubicacion.departamento = TotalesDepPais.dpto
order by departamento.nombre asc;

-- Décimo Quinto Punto: Reporte de pagos mensuales sobre rentas realizados a los dueños. Se debe listar el nombre del dueño, año y mes de las rentas, el total de pago del dueño (sumatoria del VEI). La última fila debe llevar la suma de todas las columnas.

WITH VEI AS( 
    SELECT DISTINCT EXTRACT(year FROM renta.fecharenta) as Anio, EXTRACT(month FROM renta.fecharenta) as Mes, persona.nombre as Nombre, persona.apellidos as Apellidos, SUM(carro.valorrenta) as Total
    FROM renta, carro, duenio, persona
    WHERE renta.carro_placa = carro.placa and carro.duenio_codigopersona = duenio.codigopersona and duenio.codigopersona = persona.codigopersona
    GROUP BY persona.nombre, persona.apellidos, EXTRACT(year FROM renta.fecharenta), EXTRACT(month FROM renta.fecharenta)
    ORDER BY EXTRACT(year FROM renta.fecharenta), EXTRACT(month FROM renta.fecharenta) 
)
SELECT to_char(VEI.Anio) as Año, to_char(VEI.Mes) as Mes, VEI.Nombre as Nombre, VEI.Apellidos as Apellidos, VEI.Total as VEI
FROM VEI

UNION 

SELECT 'Total ', ' ', ' ', ' ', SUM(VEI.Total)
FROM VEI group by 'Total ', ' ', ' ', ' '; 

-- Décimo Sexto Punto: Reporte de carros por estado del carro por cada dueño. El listado debe tener el nombre del dueño, carros eliminados, carros activos, total de carros. Dueños sin carros deben aparecer con 0.

WITH RENTADUENIO AS (
     SELECT CARRO.DUENIO_CODIGOPERSONA AS CODIGODUENIO, PERSONA.NOMBRE AS DUENIO, CARRO.ESTADO AS ESTADO
     FROM CARRO, PERSONA
     WHERE CARRO.DUENIO_CODIGOPERSONA = PERSONA.CODIGOPERSONA
)
SELECT DISTINCT RENTADUENIO.CODIGODUENIO AS CODIGO_DUENIO, RENTADUENIO.DUENIO AS DUENIO, NVL(COUNT(CASE WHEN (RENTADUENIO.ESTADO = 'E') THEN RENTADUENIO.ESTADO ELSE NULL END), 0) AS CARROS_ELIMINADOS, NVL(COUNT(CASE WHEN (RENTADUENIO.ESTADO = 'A') THEN RENTADUENIO.ESTADO ELSE NULL END), 0) AS CARROS_ACTIVOS, NVL(COUNT(RENTADUENIO.ESTADO),0) AS TOTAL_CARROS
FROM RENTADUENIO
GROUP BY RENTADUENIO.CODIGODUENIO, RENTADUENIO.DUENIO
ORDER BY RENTADUENIO.CODIGODUENIO;



