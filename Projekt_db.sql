create database PraktykaLekarska;
use PraktykaLekarska;
CREATE TABLE Users (id_Users int,login numeric);
drop table Users;
CREATE TABLE Uzytkownicy (
    id_U INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    haslo NUMERIC(4) UNIQUE,
    uprawnienia TEXT
);
insert into Uzytkownicy values (1, 2244, 'pracownik');
insert into Uzytkownicy values (2, 2332, 'pracownik');
insert into Uzytkownicy values (3, 1144, 'pracownik');
insert into Uzytkownicy values (4, 1002, 'pracownik');
insert into Uzytkownicy values (5, 2003, 'pracownik');
insert into Uzytkownicy values (6, 2255, 'admin');
insert into Uzytkownicy values (7, 9889, 'pracownik');
select * from Uzytkownicy;
CREATE TABLE Medyk (
	id_med INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    imie_med VARCHAR(30) NOT NULL,
    nazwisko_med VARCHAR(50) NOT NULL,
    specjalizacja TEXT,
    data_zatr_p DATE,
    data_zatr_k DATE,
    telefon NUMERIC,
    FOREIGN KEY (id_med) REFERENCES Uzytkownicy (id_U)
);
insert into Medyk values (1,'Dorota', 'Glowacka', 'pielegniarka', '2015-06-01', null, '557223344');
insert into Medyk values (2,'Izabela', 'Debek', 'chirurg', '2013-03-05', null, '668999100');
insert into Medyk values (3,'Michal', 'Szyc', 'chirurg', '2010-11-06', null, '606100205');
insert into Medyk values (4,'Joanna', 'Nowak', 'pielegniarka', '2010-01-01', null, '558127128');
insert into Medyk values (5, 'Anna', 'Kulesza', 'pielegniarka', '2010-01-01', null, '556200400');
insert into Medyk values (6, 'Karol', 'Kowalski', 'chirurg', '2010-10-01', null,'664222333');
insert into Medyk values (7, 'Agnieszka', 'Willim', 'diabetolog', '2017-01-02', null, '559300800');
select * from Medyk;
CREATE TABLE Wizyty (
    id_w INT not null primary key auto_increment,
    id_pacjenta NUMERIC(11),
    id_med NUMERIC(11),
    data_w DATE,
    typ_w TEXT,
    id_koszykLek int
);
Alter table Wizyty add cena_w numeric;
select * from Wizyty;
CREATE TABLE Pacjenci (
    id_p int not null primary key auto_increment, 
    pesel_p NUMERIC(11) UNIQUE,
    imie_p VARCHAR(15) NOT NULL,
    nazwisko_p VARCHAR(30) NOT NULL,
	rozpoznanie text not null,
    adres_ul TEXT,
    adres_ul_n NUMERIC,
    adres_ul_m TEXT,
    telefon NUMERIC,
	FOREIGN KEY (id_p) References Wizyty (id_w)
);
select * from Pacjenci;

CREATE TABLE GodzPrzyjec (
    id_godz INT PRIMARY KEY AUTO_INCREMENT,
    godz TIME,
    id_w INT,
    id_p int,
    id_lekarza NUMERIC(11),
    data_g DATE,
    nr_gabinetu NUMERIC(2),
    FOREIGN KEY (id_w) References Wizyty (id_w)
);

Select * from GodzPrzyjec;
select * from Wizyty limit 30;
insert into Wizyty values (1,3,'78051933455','2017-04-02','Konsultacje',null,300);
insert into Wizyty values (2,1, '84091800220', '2017-04-02', 'Wizyta',1, 240);
insert into Wizyty values (3,5, '79012044223', '2017-04-02', 'Zabieg',2,700);
insert into Wizyty values (4,7, '79061411122', '2017-04-02', 'Wizyta',3,240);
insert into Wizyty values (5,4 , '84091800220', '2017-04-02', 'Wizyta',4,240);
insert into Wizyty values (6,6, '86052022244', '2017-04-03', 'Wizyta',5,240);
insert into Wizyty values (7,2, '79012044223', '2017-04-03', 'Zabieg',6,700);
insert into Wizyty values (8,9, '79012044223', '2017-04-03', 'Zabieg',7,700);
insert into Wizyty values (9,3,'86052022244','2017-04-16', 'Zabieg',8,700);  
insert into Wizyty values (10,10,'75041300234', '2017-04-24', 'Zabieg',9,700);
insert into Wizyty values (11,11, '79012044223', '2017-04-18', 'Wizyta',10,250);
insert into Wizyty values (12,13, '80120622443', '2017-04-06', 'Wizyta',11,250);
insert into Wizyty values (13,7, '84091800220', '2017-04-21','Wizyta',12,250);
insert into Wizyty values (15,8, '86052022244', '2017-05-12', 'Wizyta',13,250);
insert into Wizyty values (16,14, '75041300234', '2017-03-20', 'Konsultacje',14,300);
insert into Wizyty values (14,13, '86052022244', '2017-03-10', 'Wizyta',15,250 );
insert into Wizyty values (18,1, '79012044223', '2017-04-10', 'Zabieg', 16,700);
insert into Wizyty values (17,4, '84091800220', '2017-04-16', 'Wizyta',17,250);
insert into Wizyty values (19,12, '78051933455','2017-05-08', 'Konsultacje',null,300);
insert into Wizyty values (20,13,'79012044223','2017-05-09', 'Konsultacje',18, 300);
insert into Wizyty values (21,14, '75041300234', '2017-03-29', 'Zabieg',19,700);
insert into Wizyty values (22,3,'79061411122', '2017-05-11', 'Wizyta',20,250);
insert into Wizyty values (23,12, '75041300234','2017-03-13', 'Zabieg',21,700);
insert into Wizyty values (24,1,'78051933455', '2017-04-03', 'Konsultacje',22,300);
insert into Wizyty values (25,2 , '79061411122', '2017-03-30', 'Wizyta',23,250); 
insert into Wizyty values (26, 3, '78051933455','2017-04-26', 'Konsultacje',null,300);
insert into Wizyty values (27, 5, '79012044223', '2017-04-29', 'Wizyta',24,250);
insert into Wizyty values (28,8, '84091800220', '2017-04-26', 'Wizyta',25,250);
insert into Wizyty values (29,6,'80072011889','2017-05-11', 'Wizyta',26,250); 
insert into Wizyty values (30,11,'80072011889', '2017-04-20', 'Wizyta',27,250);
select*from Pacjenci Limit 20;
insert into Pacjenci values (1,'68121500858', 'Marian', 'Konopacki','Stopa cukrzycowa', 'Pokoju', 3, 'Nidzica', '585100204');
insert into Pacjenci values (2,'58081504708', 'Halina', 'Kowalska','Owrzodzenie', 'Mickiewicza', 13, 'Poznan', '606200478');
insert into Pacjenci values (3,'51021412202', 'Ryszard', 'Jowik','Owrzodzenie', 'Grunwaldzka', 4, 'Elblag', '588404214');
insert into Pacjenci values (4,'62110400854', 'Piotr', 'Sosnowski','Rana przewlekla NP', 'Lesna', 1, 'Walbrzych', NULL);
insert into Pacjenci values (5,'66100410122', 'Piotr', 'Marek', 'Stopa cukrzycowa','Krzywa', 28, 'Piaseczno', '554002113');
insert into Pacjenci values (6,'68041522322', 'Rafal', 'Hertz','Owrzodzenie', 'Pokoju', 48, 'Marki', '602001002');
insert into Pacjenci values (7,'55090804407', 'Jozef', 'Mikolajuk','Stopa cukrzycowa', 'Sosnowa', 11, 'Warszawa', '667202485');
insert into Pacjenci values (8,'64122000408', 'Mariusz', 'Gosowski','Stopa cukrzycowa','Za zakretem', 8, 'Poznan', '588202020');
insert into Pacjenci values (9,'62031511221', 'Janina', 'Kowalska','Owrzodzenie','Prosta', 17, 'Elblag', '588100200');
insert into Pacjenci values (10,'56110822233', 'Ryszard', 'Nowak','Rana przewlekla NP', 'Wiezienna', 64, 'Szczecin', '606123125');
insert into Pacjenci values (11,'56080200221', 'Piotr', 'Kowalski','Stopa cukrzycowa','Katowicka', 3, 'Czestochowa', '587303202');
insert into Pacjenci values (12,'59040830301', 'Irena', 'Nowakowska','Stopa cukrzycowa','Krolewska', 16, 'Gniezno', '604224455');
insert into Pacjenci values (13,'62041322332', 'Andrzej', 'Nowak','Owrzodzenie', 'Wilcza', 3, 'Warszawa', '603130280');
insert into Pacjenci values (14,'80051020023', 'Marcin', 'Lubicz','Rana przewlekla NP','Rolnicza', 18, 'Warszawa', '602002338');

insert into GodzPrzyjec values(1,90000,1,3,7,'2017-04-02',1);
insert into GodzPrzyjec values(2,90000,2,1,1,'2017-04-02',2);
insert into GodzPrzyjec values(3,110000,3,5,6,'2017-04-02',2);
insert into GodzPrzyjec values(4,120000,4,7,4,'2017-04-02',1);
insert into GodzPrzyjec values(5,140000,5,4,1,'2017-04-02',3);
insert into GodzPrzyjec values(6,90000,6,6,5,'2017-04-03',2);
insert into GodzPrzyjec values(7,90000,7,2,6,'2017-04-03',1);
insert into GodzPrzyjec values(8,110000,8,9,3,'2017-04-03',2);
insert into GodzPrzyjec values(9,90000,9,3,6,'2017-04-06',1);
insert into GodzPrzyjec values(10,90000,10,10,2,'2017-04-10',2);
CREATE TABLE KoszykLek (
    id_koszykLek INT NOT NULL Primary key AUTO_INCREMENT,
    id_produkt INT NOT NULL,
    ilosc_k NUMERIC NOT NULL CHECK (ilosc_k >= 0),
    cena_k NUMERIC
);
CREATE TABLE Produkt (
    id_produkt INT NOT NULL,
    nr_artykulu NUMERIC(6),
    nazwa_p TEXT(25),
    ilosc_p NUMERIC NOT NULL CHECK (ilosc_p >= 0),
    cena_p numeric,
    opis_p TEXT(50),
    data_wazn date
);

select * from KoszykLek;
insert into KoszykLek values (1,3,1,400); 
insert into KoszykLek values (2,1,1,36);
insert into KoszykLek values (3,4,2,10);
insert into KoszykLek values (4,2,1,165);
select * from Produkt;
insert into Produkt values (1,'334455','op_aquacell',50,47, 'rany przewlekle', '2019-10-20');
insert into Produkt values (2,'112233','Kanister_500ml',10,165,'Kanister_500ml_terapia INPWT','2018-06-30');
insert into Produkt values (3,'220022','Larwy_op_200',0,400,'larwy na zamowienie',null);
insert into Produkt values (4,'123456','Zeetuwit',80,10,'martwice', '2019-05-10');

#zapytania

Select * from Pacjenci where rozpoznanie='stopa cukrzycowa';
SELECT 
    *,
    CASE
        WHEN rozpoznanie='stopa cukrzycowa' THEN 'cukrzyca'
        end from Pacjenci;
Select id_pacjenta, id_med, data_w from Wizyty where typ_w='zabieg'; 
select * from Pacjenci natural join Wizyty;
Select * from Wizyty where typ_w='zabieg';
select concat(imie_p,'-',nazwisko_p,'-', adres_ul_m) as pacjenci from Pacjenci;

Select concat(imie_p, '-', nazwisko_p, '-', adres_ul_m) AS pacjenci
FROM
    Pacjenci
WHERE
    rozpoznanie = 'owrzodzenie';
#
SELECT 
    *,
    CASE
        WHEN rozpoznanie='stopa cukrzycowa' THEN 'cukrzyca'
        end from Pacjenci
	where rozpoznanie='stopa cukrzycowa';
#
SELECT 
    nazwisko_p, imie_p
FROM
    Pacjenci
WHERE
    rozpoznanie = 'stopa cukrzycowa'
ORDER BY nazwisko_p , imie_p
LIMIT 2;
#
SELECT 
    rozpoznanie, COUNT(*)
FROM
    Pacjenci
GROUP BY rozpoznanie;
#
SELECT 
    id_pacjenta, id_med
FROM
    Wizyty
WHERE
    data_w BETWEEN '2017-03-01' AND '2017-03-31';
#
SELECT 
    imie_p, nazwisko_p, adres_ul_m
FROM
    Pacjenci
WHERE
    rozpoznanie = 'rana przewlekla NP';









