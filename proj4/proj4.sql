PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
DROP TABLE config;
DROP TABLE continent;
DROP TABLE country;
DROP TABLE crs;
DROP TABLE relation;
COMMIT;
BEGIN TRANSACTION;
CREATE TABLE config (key TEXT, value TEXT );
INSERT INTO 'config' VALUES('version','5');
COMMIT;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE crs( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, desc TEXT, digits INTEGER DEFAULT 8 );
/* UTM */
INSERT INTO "crs" VALUES(32601,'UTM01N','+proj=utm +zone=1 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32602,'UTM062','+proj=utm +zone=2 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32603,'UTM03N','+proj=utm +zone=3 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32604,'UTM04N','+proj=utm +zone=4 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32605,'UTM05N','+proj=utm +zone=5 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32606,'UTM06N','+proj=utm +zone=6 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32607,'UTM07N','+proj=utm +zone=7 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32608,'UTM08N','+proj=utm +zone=8 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32609,'UTM09N','+proj=utm +zone=9 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32610,'UTM10N','+proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32611,'UTM11N','+proj=utm +zone=11 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32612,'UTM12N','+proj=utm +zone=12 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32613,'UTM13N','+proj=utm +zone=13 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32614,'UTM14N','+proj=utm +zone=14 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32615,'UTM15N','+proj=utm +zone=15 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32616,'UTM16N','+proj=utm +zone=16 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32617,'UTM17N','+proj=utm +zone=17 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32618,'UTM18N','+proj=utm +zone=18 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32619,'UTM19N','+proj=utm +zone=19 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32620,'UTM20N','+proj=utm +zone=20 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32621,'UTM21N','+proj=utm +zone=21 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32622,'UTM22N','+proj=utm +zone=22 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32623,'UTM23N','+proj=utm +zone=23 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32624,'UTM24N','+proj=utm +zone=24 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32625,'UTM25N','+proj=utm +zone=25 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32626,'UTM26N','+proj=utm +zone=26 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32627,'UTM27N','+proj=utm +zone=27 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32628,'UTM28N','+proj=utm +zone=28 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32629,'UTM29N','+proj=utm +zone=29 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32630,'UTM30N','+proj=utm +zone=30 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32631,'UTM31N','+proj=utm +zone=31 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32632,'UTM32N','+proj=utm +zone=32 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32633,'UTM33N','+proj=utm +zone=33 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32634,'UTM34N','+proj=utm +zone=34 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32635,'UTM35N','+proj=utm +zone=35 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32636,'UTM36N','+proj=utm +zone=36 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32637,'UTM37N','+proj=utm +zone=37 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32638,'UTM38N','+proj=utm +zone=38 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32639,'UTM39N','+proj=utm +zone=39 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32640,'UTM40N','+proj=utm +zone=40 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32641,'UTM41N','+proj=utm +zone=41 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32642,'UTM42N','+proj=utm +zone=42 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32643,'UTM43N','+proj=utm +zone=43 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32644,'UTM44N','+proj=utm +zone=44 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32645,'UTM45N','+proj=utm +zone=45 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32646,'UTM46N','+proj=utm +zone=46 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32647,'UTM47N','+proj=utm +zone=47 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32648,'UTM48N','+proj=utm +zone=48 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32649,'UTM49N','+proj=utm +zone=49 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32650,'UTM50N','+proj=utm +zone=50 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32651,'UTM51N','+proj=utm +zone=51 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32652,'UTM52N','+proj=utm +zone=52 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32653,'UTM53N','+proj=utm +zone=53 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32654,'UTM54N','+proj=utm +zone=54 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32655,'UTM55N','+proj=utm +zone=55 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32656,'UTM56N','+proj=utm +zone=56 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32657,'UTM57N','+proj=utm +zone=57 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32658,'UTM58N','+proj=utm +zone=58 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32659,'UTM59N','+proj=utm +zone=59 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
INSERT INTO "crs" VALUES(32660,'UTM60N','+proj=utm +zone=60 +ellps=WGS84 +datum=WGS84 +units=m +nodefs',2);
/* UTM SOUTH */
INSERT INTO "crs" VALUES(32749, 'UTM49S', '+proj=utm +zone=49 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32750, 'UTM50S', '+proj=utm +zone=50 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32751, 'UTM51S', '+proj=utm +zone=51 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32752, 'UTM52S', '+proj=utm +zone=52 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32753, 'UTM53S', '+proj=utm +zone=53 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32754, 'UTM54S', '+proj=utm +zone=54 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32755, 'UTM55S', '+proj=utm +zone=55 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32756, 'UTM56S', '+proj=utm +zone=56 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32757, 'UTM57S', '+proj=utm +zone=57 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32758, 'UTM58S', '+proj=utm +zone=58 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32759, 'UTM59S', '+proj=utm +zone=59 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(32760, 'UTM60S', '+proj=utm +zone=60 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
/* ED 1950 */
INSERT INTO "crs" VALUES(23029,'ED50-29','+proj=utm +zone=29 +ellps=intl +units=m +nodefs',2);
INSERT INTO "crs" VALUES(23030,'ED50-30','+proj=utm +zone=30 +ellps=intl +units=m +nodefs',2);
INSERT INTO "crs" VALUES(23031,'ED50-31','+proj=utm +zone=31 +ellps=intl +units=m +nodefs',2);
INSERT INTO "crs" VALUES(23032,'ED50-32','+proj=utm +zone=32 +ellps=intl +units=m +nodefs',2);
INSERT INTO "crs" VALUES(23033,'ED50-33','+proj=utm +zone=33 +ellps=intl +units=m +nodefs',2);
INSERT INTO "crs" VALUES(23034,'ED50-34','+proj=utm +zone=34 +ellps=intl +units=m +nodefs',2);
INSERT INTO "crs" VALUES(23035,'ED50-35','+proj=utm +zone=35 +ellps=intl +units=m +nodefs',2);
/* ITALY */
INSERT INTO "crs" VALUES(26591,'Gauss-Boaga zone 1','+proj=tmerc +ellps=intl +lat_0=0 +lon_0=9 +k=0.9996 +x_0=1500000 +y_0=0 +towgs84=-104.1, -49.1, -9.9, 0.971, -2.971, 0.714, -11.68 +nodefs',2);
INSERT INTO "crs" VALUES(26592,'Gauss-Boaga zone 2','+proj=tmerc +ellps=intl +lat_0=0 +lon_0=15 +k=0.9996 +x_0=2520000 +y_0=0 +towgs84=-104.1, -49.1, -9.9, 0.971, -2.971, 0.714, -11.68 +nodefs',2);
INSERT INTO "crs" VALUES(26593,'Gauss-Boaga Sardinia','+proj=tmerc +ellps=intl +lat_0=0 +lon_0=9 +k=0.9996 +x_0=1500000 +y_0=0 +towgs84=-168.6, -34.0, 38.6, -0.374, -0.679, -1.379, -9.48 +nodefs',2);
INSERT INTO "crs" VALUES(26594,'Gauss-Boaga Sicily','+proj=tmerc +ellps=intl +lat_0=0 +lon_0=15 +k=0.9996 +x_0=2520000 +y_0=0 +towgs84=-50.2,-50.4, 84.8, -0.690, -2.012, 0.459, -28.08 +nodefs',2);
/* GERMANY */
INSERT INTO "crs" VALUES(2860, 'Germany - west of 6°E', '+proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2861, 'Germany 6-12°E', '+proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2862, 'Germany - east of 12°E', '+proj=tmerc +lat_0=40.5 +lon_0=-105.1666666666667 +k=0.9999375 +x_0=200000 +y_0=0 +ellps=GRS80 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2898, 'Germany - Berlin', '+proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=3999999.999984 +y_0=0 +ellps=GRS80 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2326, 'West Germany', '+proj=tmerc +lat_0=22.31213333333334 +lon_0=114.1785555555556 +k=1 +x_0=836694.05 +y_0=819069.8 +ellps=intl +towgs84=-162.619,-276.959,-161.764,0.067753,-2.24365,-1.15883,-1.09425 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2541, 'West Germany N', '+proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=25500000 +y_0=0 +ellps=krass +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2542, 'West Germany C', '+proj=tmerc +lat_0=0 +lon_0=78 +k=1 +x_0=26500000 +y_0=0 +ellps=krass +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2543, 'West Germany S', '+proj=tmerc +lat_0=0 +lon_0=81 +k=1 +x_0=27500000 +y_0=0 +ellps=krass +units=m +no_defs', 2 );
/* GREECE */
INSERT INTO "crs" VALUES(3254, 'Greece', '+proj=lcc +lat_1=-72.66666666666667 +lat_2=-75.33333333333333 +lat_0=-90 +lon_0=81 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs', 2 );
/* SPAIN */
INSERT INTO "crs" VALUES(2062, 'Madrid 1870', '+proj=lcc +lat_1=40 +lat_0=40 +lon_0=0 +k_0=0.9988085293 +x_0=600000 +y_0=600000 +a=6378298.3 +b=6356657.142669561 +pm=madrid +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(3199, 'Canary Islands', '+proj=utm +zone=32 +ellps=intl +towgs84=-208.406,-109.878,-2.5764,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(3629, 'Canary - west of 18°W', '+proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2335, 'Balearic Islands', '+proj=tmerc +lat_0=0 +lon_0=123 +k=1 +x_0=21500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2336, 'Spain mainland', '+proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=22500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2337, 'Spain NW', '+proj=tmerc +lat_0=0 +lon_0=135 +k=1 +x_0=23500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2338, 'Portugal and Spain', '+proj=tmerc +lat_0=0 +lon_0=75 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2366, 'Spain - onshore', '+proj=tmerc +lat_0=0 +lon_0=126 +k=1 +x_0=42500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2367, 'Spain NE' ,'+proj=tmerc +lat_0=0 +lon_0=129 +k=1 +x_0=43500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2368, 'Spain SW', '+proj=tmerc +lat_0=0 +lon_0=132 +k=1 +x_0=44500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs', 2 );
/* ROMANIA */
INSERT INTO "crs" VALUES(2546, 'Romania', '+proj=tmerc +lat_0=0 +lon_0=90 +k=1 +x_0=30500000 +y_0=0 +ellps=krass +units=m +no_defs', 2 );
/* FRANCE */
INSERT INTO "crs" VALUES(27562, 'Lambert France C', '+proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs', 2);
INSERT INTO "crs" VALUES(27651, 'Lambert France N', '+proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=0 +k_0=0.999877341 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(27563, 'Lambert France S', '+proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(27571, 'Lambert zone I', '+proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=0 +k_0=0.999877341 +x_0=600000 +y_0=1200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(27572, 'Lambert zone II', '+proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(27573, 'Lambert zone III', '+proj=lcc +lat_1=44.10000000000001 +lat_0=44.10000000000001 +lon_0=0 +k_0=0.999877499 +x_0=600000 +y_0=3200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(27574, 'Lambert zone IV', '+proj=lcc +lat_1=42.16500000000001 +lat_0=42.16500000000001 +lon_0=0 +k_0=0.99994471 +x_0=234.358 +y_0=4185861.369 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs', 2 );
/* SWITZERLAND */
INSERT INTO "crs" VALUES(21781,'CH1903+ / LV95','+proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333 +k_0=1 +x_0=2600000 +y_0=1200000 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs',0);
INSERT INTO "crs" VALUES(21782,'CH1903 / LV03','+proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333 +k_0=1 +x_0=600000 +y_0=200000 +ellps=bessel +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs',0);
/* POLAND */
INSERT INTO "crs" VALUES(3120, 'Poland zone I', '+proj=sterea +lat_0=50.625 +lon_0=21.08333333333333 +k=0.9998 +x_0=4637000 +y_0=5467000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2172, 'Poland zone II', '+proj=sterea +lat_0=53.00194444444445 +lon_0=21.50277777777778 +k=0.9998 +x_0=4603000 +y_0=5806000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2173, 'Poland zone III', '+proj=sterea +lat_0=53.58333333333334 +lon_0=17.00833333333333 +k=0.9998 +x_0=3501000 +y_0=5999000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2174, 'Poland zone IV', '+proj=sterea +lat_0=51.67083333333333 +lon_0=16.67222222222222 +k=0.9998 +x_0=3703000 +y_0=5627000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2175, 'Poland zone V', '+proj=tmerc +lat_0=0 +lon_0=18.95833333333333 +k=0.999983 +x_0=237000 +y_0=-4700000 +ellps=krass +towgs84=33.4,-146.6,-76.3,-0.359,-0.053,0.844,-0.84 +units=m +no_defs', 2 );
/* IRAN */
INSERT INTO "crs" VALUES(2110, 'Tuhirangi 2000', '+proj=tmerc +lat_0=-39.51222222222222 +lon_0=175.64 +k=1 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(27210, 'Tuhirangi Circuit', '+proj=tmerc +lat_0=-39.51247038888889 +lon_0=175.6400368055556 +k=1 +x_0=300000 +y_0=700000 +ellps=intl +datum=nzgd49 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2057, 'Rassadiran/Nakhl e Taqi', '+proj=omerc +lat_0=27.51882880555555 +lonc=52.60353916666667 +alpha=0.5716611944444444 +k=0.999895934 +x_0=658377.437 +y_0=3044969.194 +ellps=intl +towgs84=-133.63,-157.5,-158.62,0,0,0,0 +units=m +no_defs', 2 );
/* NEDERLAND */
INSERT INTO "crs" VALUES(28992, 'Amersfoort/RD', '+proj=sterea +lat_0=52.1561055555555 +lon_0=5.38763888888889 +k_0=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +nodefs', 2 );
/* CANADA */
INSERT INTO "crs" VALUES(4617, 'CSRS NAD83', '+proj=longlat +ellps=GRS80 +nodefs', 8 );
INSERT INTO "crs" VALUES(42304, 'NRCAN', '+proj=lcc +lat_1=49 +lat_2=77 +lat_0=49 +lon_0=-95 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(102002, 'Lambert Conformal Conic', '+proj=lcc +lat_1=50 +lat_2=70 +lat_0=40 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2290, 'ATS77 Prince Edward Isl.', '+proj=sterea +lat_0=47.25 +lon_0=-63 +k=0.999912 +x_0=700000 +y_0=400000 +a=6378135 +b=6356750.304921594 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2291, 'NAD83 Prince Edward Isl.', '+proj=sterea +lat_0=47.25 +lon_0=-63 +k=0.999912 +x_0=400000 +y_0=800000 +a=6378135 +b=6356750.304921594 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2292, 'CSRS98 Prince Edward Isl.', '+proj=sterea +lat_0=47.25 +lon_0=-63 +k=0.999912 +x_0=400000 +y_0=800000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2220, 'ATS77 zone 20 ', '+proj=utm +zone=20 +a=6378135 +b=6356750.304921594 +units=m +no_defs', 8 );
/* UNITES STATES */
INSERT INTO "crs" VALUES(2222, 'NAD83 Arizona E', '+proj=tmerc +lat_0=31 +lon_0=-110.1666666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2223, 'NAD83 Arizona C', '+proj=tmerc +lat_0=31 +lon_0=-111.9166666666667 +k=0.9999 +x_0=213360 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2224, 'NAD83 Arizona W', '+proj=tmerc +lat_0=31 +lon_0=-113.75 +k=0.999933333 +x_0=213360 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2225, 'NAD83 California z.1', '+proj=lcc +lat_1=41.66666666666666 +lat_2=40 +lat_0=39.33333333333334 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2226, 'NAD83 California z.2', '+proj=lcc +lat_1=39.83333333333334 +lat_2=38.33333333333334 +lat_0=37.66666666666666 +lon_0=-122 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2227, 'NAD83 California z.3', '+proj=lcc +lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2);
INSERT INTO "crs" VALUES(2228, 'NAD83 California z.4', '+proj=lcc +lat_1=37.25 +lat_2=36 +lat_0=35.33333333333334 +lon_0=-119 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2229, 'NAD83 California z.5', '+proj=lcc +lat_1=35.46666666666667 +lat_2=34.03333333333333 +lat_0=33.5 +lon_0=-118 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2);
INSERT INTO "crs" VALUES(2230, 'NAD83 California z.6', '+proj=lcc +lat_1=33.88333333333333 +lat_2=32.78333333333333 +lat_0=32.16666666666666 +lon_0=-116.25 +x_0=2000000.0001016 +y_0=500000.0001016001 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2231, 'NAD83 Colorado N', '+proj=lcc +lat_1=40.78333333333333 +lat_2=39.71666666666667 +lat_0=39.33333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2);
INSERT INTO "crs" VALUES(2232, 'NAD83 Colorado C', '+proj=lcc +lat_1=39.75 +lat_2=38.45 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2233, 'NAD83 Colorado S', '+proj=lcc +lat_1=38.43333333333333 +lat_2=37.23333333333333 +lat_0=36.66666666666666 +lon_0=-105.5 +x_0=914401.8288036576 +y_0=304800.6096012192 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2234, 'NAD83 Connecticut', '+proj=lcc +lat_1=41.86666666666667 +lat_2=41.2 +lat_0=40.83333333333334 +lon_0=-72.75 +x_0=304800.6096012192 +y_0=152400.3048006096 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2235, 'NAD83 Delaware', '+proj=tmerc +lat_0=38 +lon_0=-75.41666666666667 +k=0.999995 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2236, 'NAD83 Florida E', '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2237, 'NAD83 Florida W', '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.999941177 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2238, 'NAD83 Florida N', '+proj=lcc +lat_1=30.75 +lat_2=29.58333333333333 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2239, 'NAD83 Georgia E', '+proj=tmerc +lat_0=30 +lon_0=-82.16666666666667 +k=0.9999 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2240, 'NAD83 Georgia W', '+proj=tmerc +lat_0=30 +lon_0=-84.16666666666667 +k=0.9999 +x_0=699999.9998983998 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2241, 'NAD83 Idaho E', '+proj=tmerc +lat_0=41.66666666666666 +lon_0=-112.1666666666667 +k=0.9999473679999999 +x_0=200000.0001016002 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2242, 'NAD83 Idaho C', '+proj=tmerc +lat_0=41.66666666666666 +lon_0=-114 +k=0.9999473679999999 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2243, 'NAD83 Idaho W', '+proj=tmerc +lat_0=41.66666666666666 +lon_0=-115.75 +k=0.999933333 +x_0=800000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2244, 'NAD83 Indiana E', '+proj=tmerc +lat_0=37.5 +lon_0=-85.66666666666667 +k=0.999966667 +x_0=99999.99989839978 +y_0=249364.9987299975 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2245, 'NAD83 Indiana W', '+proj=tmerc +lat_0=37.5 +lon_0=-87.08333333333333 +k=0.999966667 +x_0=900000 +y_0=249364.9987299975 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2246, 'NAD83 Kentucky N', '+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2247, 'NAD83 Kentucky S', '+proj=lcc +lat_1=37.93333333333333 +lat_2=36.73333333333333 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=500000.0001016001 +y_0=500000.0001016001 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2248, 'NAD83 Maryland', '+proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77 +x_0=399999.9998983998 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2249, 'NAD83 Massachusetts', '+proj=lcc +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lat_0=41 +lon_0=-71.5 +x_0=200000.0001016002 +y_0=750000 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2250, 'NAD83 Massachusetts Isl.', '+proj=lcc +lat_1=41.48333333333333 +lat_2=41.28333333333333 +lat_0=41 +lon_0=-70.5 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2251, 'NAD83 Michigan N', '+proj=lcc +lat_1=47.08333333333334 +lat_2=45.48333333333333 +lat_0=44.78333333333333 +lon_0=-87 +x_0=7999999.999968001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2);
INSERT INTO "crs" VALUES(2252, 'NAD83 Michigan C', '+proj=lcc +lat_1=45.7 +lat_2=44.18333333333333 +lat_0=43.31666666666667 +lon_0=-84.36666666666666 +x_0=5999999.999976001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2253, 'NAD83 Michigan S', '+proj=lcc +lat_1=43.66666666666666 +lat_2=42.1 +lat_0=41.5 +lon_0=-84.36666666666666 +x_0=3999999.999984 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2254, 'NAD83 Missisipi E', '+proj=tmerc +lat_0=29.5 +lon_0=-88.83333333333333 +k=0.99995 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2255, 'NAD83 Missisipi W', '+proj=tmerc +lat_0=29.5 +lon_0=-90.33333333333333 +k=0.99995 +x_0=699999.9998983998 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2256, 'NAD83 Montana', '+proj=lcc +lat_1=49 +lat_2=45 +lat_0=44.25 +lon_0=-109.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2);
INSERT INTO "crs" VALUES(2257, 'NAD83 New Mexico E', '+proj=tmerc +lat_0=31 +lon_0=-104.3333333333333 +k=0.999909091 +x_0=165000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2258, 'NAD83 New Mexico C', '+proj=tmerc +lat_0=31 +lon_0=-106.25 +k=0.9999 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2259, 'NAD83 New Mexico W', '+proj=tmerc +lat_0=31 +lon_0=-107.8333333333333 +k=0.999916667 +x_0=830000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2260, 'NAD83 NewYork E', '+proj=tmerc +lat_0=38.83333333333334 +lon_0=-74.5 +k=0.9999 +x_0=150000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2);
INSERT INTO "crs" VALUES(2261, 'NAD83 NewYork C', '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=249999.9998983998 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2262, 'NAD83 NewYork W', '+proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2263, 'NAD83 NY Long Island', '+proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000.0000000001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2264, 'NAD83 N. Carolina', '+proj=lcc +lat_1=36.16666666666666 +lat_2=34.33333333333334 +lat_0=33.75 +lon_0=-79 +x_0=609601.2192024384 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2265, 'NAD83 N. Dakota N', '+proj=lcc +lat_1=48.73333333333333 +lat_2=47.43333333333333 +lat_0=47 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2266, 'NAD83 N. Dakota S', '+proj=lcc +lat_1=47.48333333333333 +lat_2=46.18333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=599999.9999976 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2267, 'NAD83 Oklahoma N', '+proj=lcc +lat_1=36.76666666666667 +lat_2=35.56666666666667 +lat_0=35 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2268, 'NAD83 Oklahoma S', '+proj=lcc +lat_1=35.23333333333333 +lat_2=33.93333333333333 +lat_0=33.33333333333334 +lon_0=-98 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2269, 'NAD83 Oregon N', '+proj=lcc +lat_1=46 +lat_2=44.33333333333334 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000.0001424 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2270, 'NAD83 Oregon S', '+proj=lcc +lat_1=44 +lat_2=42.33333333333334 +lat_0=41.66666666666666 +lon_0=-120.5 +x_0=1500000.0001464 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2271, 'NAD83 Pennsylvania N', '+proj=lcc +lat_1=41.95 +lat_2=40.88333333333333 +lat_0=40.16666666666666 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2272, 'NAD83 Pennsylvania S', '+proj=lcc +lat_1=40.96666666666667 +lat_2=39.93333333333333 +lat_0=39.33333333333334 +lon_0=-77.75 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2273, 'NAD83 S. Carolina', '+proj=lcc +lat_1=34.83333333333334 +lat_2=32.5 +lat_0=31.83333333333333 +lon_0=-81 +x_0=609600 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2274, 'NAD83 Tennessee', '+proj=lcc +lat_1=36.41666666666666 +lat_2=35.25 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2275, 'NAD83 Texas N', '+proj=lcc +lat_1=36.18333333333333 +lat_2=34.65 +lat_0=34 +lon_0=-101.5 +x_0=200000.0001016002 +y_0=999999.9998983998 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2276, 'NAD83 Texas NC', '+proj=lcc +lat_1=33.96666666666667 +lat_2=32.13333333333333 +lat_0=31.66666666666667 +lon_0=-98.5 +x_0=600000 +y_0=2000000.0001016 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2277, 'NAD83 Texas C', '+proj=lcc +lat_1=31.88333333333333 +lat_2=30.11666666666667 +lat_0=29.66666666666667 +lon_0=-100.3333333333333 +x_0=699999.9998983998 +y_0=3000000 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2278, 'NAD83 Texas SC', '+proj=lcc +lat_1=30.28333333333333 +lat_2=28.38333333333333 +lat_0=27.83333333333333 +lon_0=-99 +x_0=600000 +y_0=3999999.9998984 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2279, 'NAD83 Texas S', '+proj=lcc +lat_1=27.83333333333333 +lat_2=26.16666666666667 +lat_0=25.66666666666667 +lon_0=-98.5 +x_0=300000.0000000001 +y_0=5000000.0001016 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2280, 'NAD83 Utah N', '+proj=lcc +lat_1=41.78333333333333 +lat_2=40.71666666666667 +lat_0=40.33333333333334 +lon_0=-111.5 +x_0=500000.0001504 +y_0=999999.9999960001 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2281, 'NAD83 Utah C', '+proj=lcc +lat_1=40.65 +lat_2=39.01666666666667 +lat_0=38.33333333333334 +lon_0=-111.5 +x_0=500000.0001504 +y_0=1999999.999992 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2282, 'NAD83 Utah S', '+proj=lcc +lat_1=38.35 +lat_2=37.21666666666667 +lat_0=36.66666666666666 +lon_0=-111.5 +x_0=500000.0001504 +y_0=2999999.999988 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048 +no_defs', 2 );
INSERT INTO "crs" VALUES(2283, 'NAD83 Virginia N', '+proj=lcc +lat_1=39.2 +lat_2=38.03333333333333 +lat_0=37.66666666666666 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=2000000.0001016 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2284, 'NAD83 Virginia S', '+proj=lcc +lat_1=37.96666666666667 +lat_2=36.76666666666667 +lat_0=36.33333333333334 +lon_0=-78.5 +x_0=3500000.0001016 +y_0=999999.9998983998 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2285, 'NAD83 Washington N', '+proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 +lat_0=47 +lon_0=-120.8333333333333 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2286, 'NAD83 Washington S', '+proj=lcc +lat_1=47.33333333333334 +lat_2=45.83333333333334 +lat_0=45.33333333333334 +lon_0=-120.5 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2287, 'NAD83 Wisconsin N', '+proj=lcc +lat_1=46.76666666666667 +lat_2=45.56666666666667 +lat_0=45.16666666666666 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2288, 'NAD83 Wisconsin C', '+proj=lcc +lat_1=45.5 +lat_2=44.25 +lat_0=43.83333333333334 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
INSERT INTO "crs" VALUES(2289, 'NAD83 Wisconsin S', '+proj=lcc +lat_1=44.06666666666667 +lat_2=42.73333333333333 +lat_0=42 +lon_0=-90 +x_0=600000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs', 2 );
/* AUSTRALIA */
INSERT INTO "crs" VALUES(4283, 'GDA94', '+proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +nodefs', 8 );
INSERT INTO "crs" VALUES(28350, 'GDA94 zone 50', '+proj=utm +zone=50 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(28351, 'GDA94 zone 51', '+proj=utm +zone=51 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(28352, 'GDA94 zone 52', '+proj=utm +zone=52 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(28353, 'GDA94 zone 53', '+proj=utm +zone=53 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(28354, 'GDA94 zone 54', '+proj=utm +zone=54 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(28355, 'GDA94 zone 55', '+proj=utm +zone=55 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(28356, 'GDA94 zone 56', '+proj=utm +zone=56 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
/* NEW ZEALAND */
INSERT INTO "crs" VALUES(2193, 'NZTM 2000', '+proj=tmerc +lat_0=0 +lon_0=173 +k=0.9996 +x_0=1600000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(27200, 'NZMG 1949', '+proj=nzmg +lat_0=-41 +lon_0=173 +x_0=2510000 +y_0=6023150 +ellps=intl +datum=nzgd49 +units=m +no_defs', 2 );
/* MOROCCO */
INSERT INTO "crs" VALUES(26191, 'Merchich Moroc N', '+proj=lcc +lat_1=33.3 +lat_0=33.3 +lon_0=-5.4 +k_0=0.999625769 +x_0=500000 +y_0=300000 +a=6378249.2 +b=6356515 +towgs84=31,146,47,0,0,0,0 +units=m +nodefs', 2 );
INSERT INTO "crs" VALUES(26192, 'Merchich Moroc S', '+proj=lcc +lat_1=29.7 +lat_0=29.7 +lon_0=-5.4 +k_0=0.999615590 +x_0=500000 +y_0=300000 +a=6378249.2 +b=6356515 +towgs84=31,146,47,0,0,0,0 +units=m +nodefs', 2 );
/* MEXICO */
/* INSERT INTO "crs" VALUES(6362, ' ); */
/* ASIA MIDDLE EAST */
INSERT INTO "crs" VALUES(2345, 'Middle East', '+proj=tmerc +lat_0=0 +lon_0=117 +k=1 +x_0=500000 +y_0=0 +a=6378140 +b=6356755.288157528 +units=m +no_defs', 2 );
INSERT INTO "crs" VALUES(2039, 'Israel TMG', '+proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.0000067 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +towgs84=-48,55,52,0,0,0,0 +units=m +no_defs', 2 );
/*
INSERT INTO "crs" VALUES( );
INSERT INTO "relation" VALUES( );
*/
/* HUNGARY */
INSERT INTO "crs" VALUES(23700, 'HD72 / EOV', '+proj=somerc +lat_0=47.1443937222222 +lon_0=19.0485717777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +towgs84=52.17,-71.82,-14.9,0,0,0,0 +units=m +no_defs +type=crs', 2 );
COMMIT;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE continent ( id INTEGER PRIMARY KEY, name TEXT );
INSERT INTO 'continent' VALUES(1,'Europe');
INSERT INTO 'continent' VALUES(2,'Asia');
INSERT INTO 'continent' VALUES(3,'Africa');
INSERT INTO 'continent' VALUES(4,'North America');
INSERT INTO 'continent' VALUES(5,'Central America');
INSERT INTO 'continent' VALUES(6,'South America');
INSERT INTO 'continent' VALUES(7,'Oceania');
COMMIT;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE country( code TEXT, name TEXT , continent INTEGER);
INSERT INTO "country" VALUES('at','Austria',1);
INSERT INTO "country" VALUES('fr','France',1);
INSERT INTO "country" VALUES('gr','Greece',1);
INSERT INTO "country" VALUES('de','Germany',1);
INSERT INTO "country" VALUES('hu','Hungary',1);
INSERT INTO "country" VALUES('it','Italy',1);
INSERT INTO "country" VALUES('nl','Nederland',1);
INSERT INTO "country" VALUES('no','Norway',1);
INSERT INTO "country" VALUES('po','Poland',1);
INSERT INTO "country" VALUES('pt','Portugal',1);
INSERT INTO "country" VALUES('ro','Romania',1);
INSERT INTO "country" VALUES('ru','Russia',1);
INSERT INTO "country" VALUES('ru','Russia',2);
INSERT INTO "country" VALUES('es','Spain',1);
INSERT INTO "country" VALUES('ch','Switzerland',1);
INSERT INTO "country" VALUES('uk','United Kingdom',1);
/* ASIA */
INSERT INTO "country" VALUES('ir','Iran',2);
INSERT INTO "country" VALUES('iq','Iraq', 2 );
INSERT INTO "country" VALUES('il','Israel', 2 );
INSERT INTO "country" VALUES('jo','Jordan', 2 );
INSERT INTO "country" VALUES('lb','Lebanon', 2 );
INSERT INTO "country" VALUES('kw','Kuwait', 2 );
INSERT INTO "country" VALUES('sa','Saudi Arabia', 2 );
INSERT INTO "country" VALUES('sy','Syria', 2 );
/* AFRICA */
INSERT INTO "country" VALUES('mo','Morocco',3);
/* NORTH AMERICA */
INSERT INTO "country" VALUES('ca','Canada',4);
INSERT INTO "country" VALUES('us-ar','Arizona',4);
INSERT INTO "country" VALUES('us-ak','Arkansas',4); 
INSERT INTO "country" VALUES('us-ca','California',4);
INSERT INTO "country" VALUES('us-cl','Colorado',4);
INSERT INTO "country" VALUES('us-cn','Connecticut',4);
INSERT INTO "country" VALUES('us-dl','Delaware',4);
INSERT INTO "country" VALUES('us-fl','Florida',4);
INSERT INTO "country" VALUES('us-gr','Georgia',4);
INSERT INTO "country" VALUES('us-id','Idaho',4);
INSERT INTO "country" VALUES('us-in','Indiana',4);
INSERT INTO "country" VALUES('us-kn','Kentuky',4);
INSERT INTO "country" VALUES('us-mr','Maryland',4);
INSERT INTO "country" VALUES('us-ms','Massachusetts',4);
INSERT INTO "country" VALUES('us-mc','Michigan',4);
INSERT INTO "country" VALUES('us-ms','Missisipi',4);
INSERT INTO "country" VALUES('us-mn','Montana',4);
INSERT INTO "country" VALUES('us-nm','New Mexico',4);
INSERT INTO "country" VALUES('us-ny','NewYork',4);
INSERT INTO "country" VALUES('us-nc','North Carolina',4);
INSERT INTO "country" VALUES('us-nd','North Dakota',4);
INSERT INTO "country" VALUES('us-ok','Oklahoma',4);
INSERT INTO "country" VALUES('us-or','Oregon',4);
INSERT INTO "country" VALUES('us-pe','Pennsylvania',4);
INSERT INTO "country" VALUES('us-sc','South Carolina', 4);
INSERT INTO "country" VALUES('us-te','Tennessee',4);
INSERT INTO "country" VALUES('us-tx','Texas',4);
INSERT INTO "country" VALUES('us-ut','Utah',4);
INSERT INTO "country" VALUES('us-vi','Virginia',4);
INSERT INTO "country" VALUES('us-wa','Washington',4);
INSERT INTO "country" VALUES('us-wi','Wisconsin',4);
/* OCEANIA */
INSERT INTO "country" VALUES('au','Australia',7);
INSERT INTO "country" VALUES('nz','New Zealand',7);
COMMIT;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE relation( country TEXT, crs INTEGER );
INSERT INTO "relation" VALUES('fr',27561); /* FRANCE */
INSERT INTO "relation" VALUES('fr',27562);
INSERT INTO "relation" VALUES('fr',27563);
INSERT INTO "relation" VALUES('fr',27571);
INSERT INTO "relation" VALUES('fr',27572);
INSERT INTO "relation" VALUES('fr',27573);
INSERT INTO "relation" VALUES('fr',27574);
INSERT INTO "relation" VALUES('fr',32630);
INSERT INTO "relation" VALUES('fr',32631);
INSERT INTO "relation" VALUES('fr',32632);
INSERT INTO "relation" VALUES('de',2541); /* GERMANY */
INSERT INTO "relation" VALUES('de',2542);
INSERT INTO "relation" VALUES('de',2543);
INSERT INTO "relation" VALUES('de',2326);
INSERT INTO "relation" VALUES('de',2898);
INSERT INTO "relation" VALUES('de',2860);
INSERT INTO "relation" VALUES('de',2861);
INSERT INTO "relation" VALUES('de',2862);
INSERT INTO "relation" VALUES('de',32632);
INSERT INTO "relation" VALUES('de',32633);
INSERT INTO "relation" VALUES('gr',3254); /* GREECE */
INSERT INTO "relation" VALUES('gr',32634);
INSERT INTO "relation" VALUES('gr',32635);
INSERT INTO "relation" VALUES('hu',23700); /* HUNGARY */
INSERT INTO "relation" VALUES('it',26591); /* ITALY */
INSERT INTO "relation" VALUES('it',26592);
INSERT INTO "relation" VALUES('it',26593);
INSERT INTO "relation" VALUES('it',26594);
INSERT INTO "relation" VALUES('it',23032);
INSERT INTO "relation" VALUES('it',23033);
INSERT INTO "relation" VALUES('it',32632);
INSERT INTO "relation" VALUES('it',32633);
INSERT INTO "relation" VALUES('nl',28992); /* NEDERLAND */
INSERT INTO "relation" VALUES('nl',32631);
INSERT INTO "relation" VALUES('nl',32632);
INSERT INTO "relation" VALUES('no',32631); /* NORWAY */
INSERT INTO "relation" VALUES('no',32632); 
INSERT INTO "relation" VALUES('no',32633); 
INSERT INTO "relation" VALUES('no',32634); 
INSERT INTO "relation" VALUES('no',32635); 
INSERT INTO "relation" VALUES('no',32636); 
INSERT INTO "relation" VALUES('po',3120); /* POLAND */
INSERT INTO "relation" VALUES('po',2172);
INSERT INTO "relation" VALUES('po',2173);
INSERT INTO "relation" VALUES('po',2174);
INSERT INTO "relation" VALUES('po',2175);
INSERT INTO "relation" VALUES('po',32633);
INSERT INTO "relation" VALUES('po',32634);
INSERT INTO "relation" VALUES('po',32635);
INSERT INTO "relation" VALUES('pt',32629); /* PORTUGAL */
INSERT INTO "relation" VALUES('ro',2546);  /* ROMANIA */
INSERT INTO "relation" VALUES('ro',32634);
INSERT INTO "relation" VALUES('ro',32635);
INSERT INTO "relation" VALUES('ru',32601); /* RUSSIA */
INSERT INTO "relation" VALUES('ru',32602);
INSERT INTO "relation" VALUES('ru',32635);
INSERT INTO "relation" VALUES('ru',32636);
INSERT INTO "relation" VALUES('ru',32637);
INSERT INTO "relation" VALUES('ru',32638);
INSERT INTO "relation" VALUES('ru',32639);
INSERT INTO "relation" VALUES('ru',32640);
INSERT INTO "relation" VALUES('ru',32641);
INSERT INTO "relation" VALUES('ru',32642);
INSERT INTO "relation" VALUES('ru',32643);
INSERT INTO "relation" VALUES('ru',32644);
INSERT INTO "relation" VALUES('ru',32645);
INSERT INTO "relation" VALUES('ru',32646);
INSERT INTO "relation" VALUES('ru',32647);
INSERT INTO "relation" VALUES('ru',32648);
INSERT INTO "relation" VALUES('ru',32649);
INSERT INTO "relation" VALUES('ru',32650);
INSERT INTO "relation" VALUES('ru',32651);
INSERT INTO "relation" VALUES('ru',32652);
INSERT INTO "relation" VALUES('ru',32653);
INSERT INTO "relation" VALUES('ru',32654);
INSERT INTO "relation" VALUES('ru',32655);
INSERT INTO "relation" VALUES('ru',32656);
INSERT INTO "relation" VALUES('ru',32657);
INSERT INTO "relation" VALUES('ru',32658);
INSERT INTO "relation" VALUES('ru',32659);
INSERT INTO "relation" VALUES('ru',32660);
INSERT INTO "relation" VALUES('es',2062); /* SPAIN */
INSERT INTO "relation" VALUES('es',2335);
INSERT INTO "relation" VALUES('es',2336);
INSERT INTO "relation" VALUES('es',2337);
INSERT INTO "relation" VALUES('es',2338);
INSERT INTO "relation" VALUES('es',2366);
INSERT INTO "relation" VALUES('es',2367);
INSERT INTO "relation" VALUES('es',2368);
INSERT INTO "relation" VALUES('es',3629);
INSERT INTO "relation" VALUES('es',32629);
INSERT INTO "relation" VALUES('es',32630);
INSERT INTO "relation" VALUES('es',32631);
INSERT INTO "relation" VALUES('ch',21781); /* SWITZERLAND */
INSERT INTO "relation" VALUES('ch',21782);
INSERT INTO "relation" VALUES('ch',32632);
INSERT INTO "relation" VALUES('uk',32630); /* UNITED KINGDOM */
INSERT INTO "relation" VALUES('uk',32631);
/* ASIA */
INSERT INTO "relation" VALUES('ir',2110); /* IRAN */
INSERT INTO "relation" VALUES('ir',27210);
INSERT INTO "relation" VALUES('ir',2057);
INSERT INTO "relation" VALUES('ir',32638);
INSERT INTO "relation" VALUES('ir',32639);
INSERT INTO "relation" VALUES('ir',32640);
INSERT INTO "relation" VALUES('ir',32641);
INSERT INTO "relation" VALUES('iq',2345); /* IRAQ */
INSERT INTO "relation" VALUES('iq',32637);
INSERT INTO "relation" VALUES('iq',32638);
INSERT INTO "relation" VALUES('iq',32639);
INSERT INTO "relation" VALUES('il',2345); /* ISRAEL */
INSERT INTO "relation" VALUES('il',2039);
INSERT INTO "relation" VALUES('il',32636);
INSERT INTO "relation" VALUES('jo',2345); /* JORDAN */
INSERT INTO "relation" VALUES('jo',32636);
INSERT INTO "relation" VALUES('jo',32637);
INSERT INTO "relation" VALUES('lb',2345); /* LEBANON */
INSERT INTO "relation" VALUES('lb',32636);
INSERT INTO "relation" VALUES('lb',32637);
INSERT INTO "relation" VALUES('kw',2345); /* KUWAIT */
INSERT INTO "relation" VALUES('kw',32638);
INSERT INTO "relation" VALUES('kw',32639);
INSERT INTO "relation" VALUES('sa',2345); /* SAUDI ARABIA */
INSERT INTO "relation" VALUES('sa',32636);
INSERT INTO "relation" VALUES('sa',32637);
INSERT INTO "relation" VALUES('sa',32638);
INSERT INTO "relation" VALUES('sa',32639);
INSERT INTO "relation" VALUES('sa',32640);
INSERT INTO "relation" VALUES('sy',2345); /* SYRIA */
INSERT INTO "relation" VALUES('sy',32636);
INSERT INTO "relation" VALUES('sy',32637);
/* AFRICA */
INSERT INTO "relation" VALUES('mo',26191 ); /* MOROCCO */
INSERT INTO "relation" VALUES('mo',26192 );
INSERT INTO "relation" VALUES('mo',32629);
INSERT INTO "relation" VALUES('mo',32630);
/* NORTH AMERICA */
INSERT INTO "relation" VALUES('ca',4617); /* CANADA */
INSERT INTO "relation" VALUES('ca',2220);
INSERT INTO "relation" VALUES('ca',2290);
INSERT INTO "relation" VALUES('ca',2291);
INSERT INTO "relation" VALUES('ca',2292);
INSERT INTO "relation" VALUES('ca',32607);
INSERT INTO "relation" VALUES('ca',32608);
INSERT INTO "relation" VALUES('ca',32609);
INSERT INTO "relation" VALUES('ca',32610);
INSERT INTO "relation" VALUES('ca',32611);
INSERT INTO "relation" VALUES('ca',32612);
INSERT INTO "relation" VALUES('ca',32613);
INSERT INTO "relation" VALUES('ca',32614);
INSERT INTO "relation" VALUES('ca',32615);
INSERT INTO "relation" VALUES('ca',32616);
INSERT INTO "relation" VALUES('ca',32617);
INSERT INTO "relation" VALUES('ca',32618);
INSERT INTO "relation" VALUES('ca',32619);
INSERT INTO "relation" VALUES('ca',32620);
INSERT INTO "relation" VALUES('ca',32621);
INSERT INTO "relation" VALUES('ca',32622);
INSERT INTO "relation" VALUES('ca',42304);
INSERT INTO "relation" VALUES('ca',102002);
INSERT INTO "relation" VALUES('us-ar',2222); /* UNITED STATES */
INSERT INTO "relation" VALUES('us-ar',2223); 
INSERT INTO "relation" VALUES('us-ar',2224); 
INSERT INTO "relation" VALUES('us-ca',2225); 
INSERT INTO "relation" VALUES('us-ca',2226); 
INSERT INTO "relation" VALUES('us-ca',2227); 
INSERT INTO "relation" VALUES('us-ca',2228); 
INSERT INTO "relation" VALUES('us-ca',2229); 
INSERT INTO "relation" VALUES('us-ca',2230); 
INSERT INTO "relation" VALUES('us-cl',2231); 
INSERT INTO "relation" VALUES('us-cl',2232); 
INSERT INTO "relation" VALUES('us-cl',2233); 
INSERT INTO "relation" VALUES('us-cn',2234); 
INSERT INTO "relation" VALUES('us-dl',2235); 
INSERT INTO "relation" VALUES('us-fl',2236); 
INSERT INTO "relation" VALUES('us-fl',2237); 
INSERT INTO "relation" VALUES('us-fl',2238); 
INSERT INTO "relation" VALUES('us-gr',2239); 
INSERT INTO "relation" VALUES('us-gr',2240); 
INSERT INTO "relation" VALUES('us-id',2241);
INSERT INTO "relation" VALUES('us-id',2242);
INSERT INTO "relation" VALUES('us-id',2243);
INSERT INTO "relation" VALUES('us-in',2244);
INSERT INTO "relation" VALUES('us-in',2245);
INSERT INTO "relation" VALUES('us-kn',2246);
INSERT INTO "relation" VALUES('us-kn',2247);
INSERT INTO "relation" VALUES('us-mr',2248);
INSERT INTO "relation" VALUES('us-ms',2249);
INSERT INTO "relation" VALUES('us-ms',2250);
INSERT INTO "relation" VALUES('us-mc',2251);
INSERT INTO "relation" VALUES('us-mc',2252);
INSERT INTO "relation" VALUES('us-mc',2253);
INSERT INTO "relation" VALUES('us-ms',2254);
INSERT INTO "relation" VALUES('us-ms',2255);
INSERT INTO "relation" VALUES('us-mn',2256);
INSERT INTO "relation" VALUES('us-nm',2257);
INSERT INTO "relation" VALUES('us-nm',2258);
INSERT INTO "relation" VALUES('us-nm',2259);
INSERT INTO "relation" VALUES('us-ny',2260);
INSERT INTO "relation" VALUES('us-ny',2261); 
INSERT INTO "relation" VALUES('us-ny',2262); 
INSERT INTO "relation" VALUES('us-ny',2263); 
INSERT INTO "relation" VALUES('us-nc',2264); 
INSERT INTO "relation" VALUES('us-nd',2265); 
INSERT INTO "relation" VALUES('us-nd',2266); 
INSERT INTO "relation" VALUES('us-ok',2267); 
INSERT INTO "relation" VALUES('us-ok',2268); 
INSERT INTO "relation" VALUES('us-or',2269); 
INSERT INTO "relation" VALUES('us-or',2270); 
INSERT INTO "relation" VALUES('us-pe',2271); 
INSERT INTO "relation" VALUES('us-pe',2272); 
INSERT INTO "relation" VALUES('us-sc',2273); 
INSERT INTO "relation" VALUES('us-te',2274); 
INSERT INTO "relation" VALUES('us-tx',2275); 
INSERT INTO "relation" VALUES('us-tx',2276); 
INSERT INTO "relation" VALUES('us-tx',2277); 
INSERT INTO "relation" VALUES('us-tx',2278); 
INSERT INTO "relation" VALUES('us-tx',2279); 
INSERT INTO "relation" VALUES('us-ut',2280); 
INSERT INTO "relation" VALUES('us-ut',2281); 
INSERT INTO "relation" VALUES('us-ut',2282); 
INSERT INTO "relation" VALUES('us-vi',2283); 
INSERT INTO "relation" VALUES('us-vi',2284); 
INSERT INTO "relation" VALUES('us-wa',2285); 
INSERT INTO "relation" VALUES('us-wa',2286); 
INSERT INTO "relation" VALUES('us-wi',2287); 
INSERT INTO "relation" VALUES('us-wi',2288); 
INSERT INTO "relation" VALUES('us-wi',2289); 
INSERT INTO "relation" VALUES('us',32610); 
INSERT INTO "relation" VALUES('us',32611); 
INSERT INTO "relation" VALUES('us',32612); 
INSERT INTO "relation" VALUES('us',32613); 
INSERT INTO "relation" VALUES('us',32614); 
INSERT INTO "relation" VALUES('us',32615); 
INSERT INTO "relation" VALUES('us',32616); 
INSERT INTO "relation" VALUES('us',32617); 
INSERT INTO "relation" VALUES('us',32618); 
INSERT INTO "relation" VALUES('us',32619); 
/* OCEANIA */
INSERT INTO "relation" VALUES('au',4283); /* AUSTRALIA */
INSERT INTO "relation" VALUES('au',28350); 
INSERT INTO "relation" VALUES('au',28351); 
INSERT INTO "relation" VALUES('au',28352); 
INSERT INTO "relation" VALUES('au',28353); 
INSERT INTO "relation" VALUES('au',28354); 
INSERT INTO "relation" VALUES('au',28355); 
INSERT INTO "relation" VALUES('au',28356); 
INSERT INTO "relation" VALUES('au',32749); 
INSERT INTO "relation" VALUES('au',32750); 
INSERT INTO "relation" VALUES('au',32751); 
INSERT INTO "relation" VALUES('au',32752); 
INSERT INTO "relation" VALUES('au',32753); 
INSERT INTO "relation" VALUES('au',32754); 
INSERT INTO "relation" VALUES('au',32755); 
INSERT INTO "relation" VALUES('au',32756); 
INSERT INTO "relation" VALUES('nz',2193); /* NEW ZEALAND */
INSERT INTO "relation" VALUES('nz',27200); 
INSERT INTO "relation" VALUES('nz',32758); 
INSERT INTO "relation" VALUES('nz',32759); 
INSERT INTO "relation" VALUES('nz',32760); 
COMMIT;
