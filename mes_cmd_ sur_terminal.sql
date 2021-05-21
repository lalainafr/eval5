/* Creation d'une base de données*/
rajaonahsoa@PC c:\xampp\mysql\bin
# mysql -u root -p

MariaDB [(none)]> create database db_cinema DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

/* Utiliser la base de données créée */
MariaDB [(none)]> use db_cinema;

/* Creation des tables*/
MariaDB [db_cinema]>   create table film(
    ->     id_film varchar(50) not null,
    ->     titre_film varchar(50),
    ->     duree_film varchar(50),
    ->     primary key(id_film)
    ->     ) engine= innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

MariaDB [db_cinema]> create table horaire(
    ->     id_horaire varchar(50) not null,
    ->     horaire varchar(50),
    ->     primary key(id_horaire)
    ->     ) engine = innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

MariaDB [db_cinema]>  create table complexe(
    ->     id_complexe varchar(50) not null,
    ->     nom_complexe varchar(50),
    ->     primary key(id_complexe)
    ->     ) engine= innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

MariaDB [db_cinema]>  create table salle(
    ->     id_salle varchar(50) not null,
    ->     nom_salle varchar(50),
    ->     place_disponible int,
    ->     id_horaire varchar(50) not null,
    ->     id_complexe varchar(50) not null,
    ->     primary key(id_salle),
    ->     foreign key(id_horaire) references horaire(id_horaire),
    ->     foreign key(id_complexe) references complexe(id_complexe)
    ->     ) engine = innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

MariaDB [db_cinema]> create table seance(
    ->     id_seance varchar(50) not null,
    ->     id_salle varchar(50) not null,
    ->     id_film varchar(50) not null,
    ->     primary key(id_seance),
    ->     foreign key(id_salle) references salle(id_salle),
    ->     foreign key(id_film) references film(id_film)
    ->     ) engine= innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

MariaDB [db_cinema]> create table tarif(
    ->     id_tarif varchar(50) not null,
    ->     nom_tarif varchar(50) COLLATE utf8_unicode_ci,
    ->     tarif varchar(50) COLLATE utf8_unicode_ci,
    ->     primary key(id_tarif)
    ->     ) engine= innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

MariaDB [db_cinema]> create table mode_de_paiement(
    ->     id_paiement varchar(50) not null,
    ->     type_paiement varchar(50),
    ->     primary key(id_paiement)
    ->     ) engine= innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

MariaDB [db_cinema]> create table client(
    ->     id_client varchar(50) not null,
    ->     nom_client varchar(50),
    ->     adresse_client varchar(50),
    ->     id_tarif varchar(50) not null,
    ->     id_paiement varchar(50) not null,
    ->     primary key(id_client),
    ->     foreign key(id_tarif) references tarif(id_tarif),
    ->     foreign key(id_paiement) references mode_de_paiement(id_paiement)
    ->     ) engine = innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

MariaDB [db_cinema]>  create table reservation(
    ->     id_reservation varchar(50) not null,
    ->     id_client varchar(50) not null,
    ->     id_seance varchar(50) not null,
    ->     primary key(id_reservation),
    ->     foreign key(id_client) references client(id_client),
    ->     foreign key(id_seance) references seance(id_seance)
    ->     ) engine = innodb DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

 /* Création d'un dump CREATE DATABASE & TABLES */   
MariaDB [db_cinema]> exit;
rajaonahsoa@PC c:\xampp\mysql\bin
# mysqldump -u root -p --databases db_cinema > e:/eval5/dump_cinema.sql


/* --- C R U D --- */

/* C R E A T E */
/* Insertion données */
MariaDB [db_cinema]> insert into complexe values
    ->     ('CO1','Complexe1'),
    ->     ('CO2', 'Complexe2');

MariaDB [db_cinema]> insert into horaire values
    ->     ('HO1','10h'),
    ->     ('HO2','14h'),
    ->     ('HO3','20h');

MariaDB [db_cinema]> insert into salle values
    ->     ('SA1','Salle1',20,'HO1','CO1'),
    ->     ('SA2','Salle1',10,'HO2','CO1'),
    ->     ('SA3','Salle1',5,'HO3','CO1'),
    ->     ('SA4','Salle2',25,'HO1','CO1'),
    ->     ('SA5','Salle2',15,'HO2','CO1'),
    ->     ('SA6','Salle1',17,'HO1','CO2'),
    ->     ('SA7','Salle1',7,'HO3','CO2');

MariaDB [db_cinema]> insert into film values
    ->     ('FI1','Film1','30mn'),
    ->     ('FI2','Film2','45mn'),
    ->     ('FI3','Film3','60mn');

MariaDB [db_cinema]> insert into seance values
    ->     ('SC1','SA1','FI1'),
    ->     ('SC2','SA4','FI1'),
    ->     ('SC3','SA2','FI1'),
    ->     ('SC4','SA7','FI1'),
    ->     ('SC5','SA4','FI2'),
    ->     ('SC6','SA6','FI3');

MariaDB [db_cinema]> insert into tarif values
    ->     ('TA1','PLEIN TARIF','9€20'),
    ->     ('TA2','ETUDIANT','7€60'),
    ->     ('TA3','MOINS DE 14ans','7€60');

MariaDB [db_cinema]> insert into mode_de_paiement values
    ->     ('MP1', 'En ligne'),
    ->     ('MP2', 'Sur place');

MariaDB [db_cinema]> insert into client values
    ->     ('CL1', 'Client1', 'Avenue du parc', 'TA1','MP1'),
    ->     ('CL2', 'Client2', '20 boulevard saint honore', 'TA1','MP2'),
    ->     ('CL3', 'Client3', '10 avenue staint martin', 'TA3','MP1'),
    ->     ('CL4', 'Client4', '6 rue vaugirard', 'TA2','MP1'),
    ->     ('CL5', 'Client5', '15 rue de la paix', 'TA1','MP1'),
    ->     ('CL6', 'Client6', '1 allee des baobabs', 'TA1','MP2');

MariaDB [db_cinema]> insert into reservation values
    ->     ('RE1','CL1','SC1'),
    ->     ('RE2','CL2','SC1'),
    ->     ('RE3','CL3','SC4'),
    ->     ('RE4','CL4','SC4'),
    ->     ('RE5','CL5','SC6'),
    ->     ('RE6','CL6','SC5');

/* Création d'un dump CRUD - Create */
MariaDB [bdd_cinema]> exit;
rajaonahsoa@PC c:\xampp\mysql\bin
# mysqldump -u root -p --databases bdd_cinema > e:/eval5/dump_cinema.sql

/* U P D A T E */
MariaDB [db_cinema]> update tarif set tarif = '9.20 EUR' where id_tarif = 'TA1';
MariaDB [db_cinema]> update tarif set tarif = '7.60 EUR' where id_tarif = 'TA2';
MariaDB [db_cinema]> update tarif set tarif = '5.90 EUR' where id_tarif = 'TA3';

MariaDB [db_cinema]> select * from tarif;
+----------+----------------+----------+
| id_tarif | nom_tarif      | tarif    |
+----------+----------------+----------+
| TA1      | PLEIN TARIF    | 9.20 EUR |
| TA2      | ETUDIANT       | 7.60 EUR |
| TA3      | MOINS DE 14ans | 5.90 EUR |

/* R E A D */
/* Lire les détails de la réservation des clients */
MariaDB [db_cinema]> select c.nom_client as CLIENT, s2.nom_salle as SALLE, c2.nom_complexe as LIEU, f.titre_film as FILM, h.horaire as HORAIRE, t.tarif as TARIF, mdp.type_paiement as PAIEMENT, r.id_reservation as RESERVATION
    -> from reservation r
    -> join client c on c.id_client = r.id_client
    -> join tarif t on t.id_tarif = c.id_tarif
    -> join mode_de_paiement mdp on c.id_paiement = mdp.id_paiement
    -> join seance s on r.id_seance = s.id_seance
    -> join film f on s.id_film = f.id_film
    -> join salle s2 on s2.id_salle = s.id_salle
    -> join complexe c2 on c2.id_complexe = s2.id_complexe
    -> join horaire h on s2.id_horaire = h.id_horaire
    -> ;
+---------+--------+-----------+-------+---------+----------+-----------+-------------+
| CLIENT  | SALLE  | LIEU      | FILM  | HORAIRE | TARIF    | PAIEMENT  | RESERVATION |
+---------+--------+-----------+-------+---------+----------+-----------+-------------+
| Client1 | Salle1 | Complexe1 | Film1 | 10h     | 9.20 EUR | En ligne  | RE1         |
| Client2 | Salle1 | Complexe1 | Film1 | 10h     | 9.20 EUR | Sur place | RE2         |
| Client6 | Salle2 | Complexe1 | Film2 | 10h     | 9.20 EUR | Sur place | RE6         |
| Client3 | Salle1 | Complexe2 | Film1 | 20h     | 5.90 EUR | En ligne  | RE3         |
| Client4 | Salle1 | Complexe2 | Film1 | 20h     | 7.60 EUR | En ligne  | RE4         |
| Client5 | Salle1 | Complexe2 | Film3 | 10h     | 9.20 EUR | En ligne  | RE5         |
+---------+--------+-----------+-------+---------+----------+-----------+-------------+

/* Lire ses informations sur la diffusion du film ayant comme titre: 'Film1' */
MariaDB [db_cinema]> select f.titre_film as TITRE, h.horaire as HORAIRE, s2.nom_salle as SALLE, c.nom_complexe
 as LIEU, s2.place_disponible as DISPONIBILITE
    -> from seance s
    -> join salle s2 on s2.id_salle = s.id_salle
    -> join horaire h on s2.id_horaire = h.id_horaire
    -> join complexe c on s2.id_complexe = c.id_complexe
    -> join film f on f.id_film = s.id_film
    -> WHERE f.titre_film ='film1';
+-------+---------+--------+-----------+---------------+
| TITRE | HORAIRE | SALLE  | LIEU      | DISPONIBILITE |
+-------+---------+--------+-----------+---------------+
| Film1 | 10h     | Salle1 | Complexe1 |            20 |
| Film1 | 10h     | Salle2 | Complexe1 |            25 |
| Film1 | 14h     | Salle1 | Complexe1 |            10 |
| Film1 | 20h     | Salle1 | Complexe2 |             7 |
+-------+---------+--------+-----------+---------------+

/* Lire ses informations qui compte le nombre de réservation qui ont un tarif > 8 'Film1' */
MariaDB [db_cinema]> select count(r.id_reservation) as nb_reservation
    -> from reservation r
    -> join client c on r.id_client = c.id_client
    -> join tarif t on c.id_tarif = t.id_tarif
    -> where t.tarif > 8;
+----------------+
| nb_reservation |
+----------------+
|              4 |
+----------------+

 /* Création d'un dump CRUD - Read / Update */   
MariaDB [db_cinema]> exit;
rajaonahsoa@PC c:\xampp\mysql\bin
# mysqldump -u root -p --databases db_cinema > e:/eval5/dump_cinema.sql

/* D E L E T E */
/*  Supprimer la réservation ayant comme identification: 'RE5' */
MariaDB [db_cinema]> delete from reservation where id_reservation = 'RE5';


MariaDB [db_cinema]> select r.id_reservation, c.nom_client, c.adresse_client, f.titre_film
    -> from reservation r
    -> join client c on r.id_client = c.id_client
    -> join seance s on r.id_seance = s.id_seance
    -> join film f on s.id_film = f.id_film
    -> ;
+----------------+------------+---------------------------+------------+
| id_reservation | nom_client | adresse_client            | titre_film |
+----------------+------------+---------------------------+------------+
| RE1            | Client1    | Avenue du parc            | Film1      |
| RE2            | Client2    | 20 boulevard saint honore | Film1      |
| RE3            | Client3    | 10 avenue staint martin   | Film1      |
| RE4            | Client4    | 6 rue vaugirard           | Film1      |
| RE6            | Client6    | 1 allee des baobabs       | Film2      |
+----------------+------------+---------------------------+------------+

 /* Création d'un dump CRUD - Delete */   
MariaDB [db_cinema]> exit;
rajaonahsoa@PC c:\xampp\mysql\bin
# mysqldump -u root -p --databases db_cinema > e:/eval5/dump_cinema.sql


/* Création des USERS */
MariaDB [(none)]> create user cinema_admin@localhost identified by '$2y$10$YwqVjac/1bo11LXcw1gOxO9z2PSjeumwQJ8
MGqxyGHRW9NESx9EdK';
compte: cinema_admin
mdp: $2y$10$YwqVjac/1bo11LXcw1gOxO9z2PSjeumwQJ8MGqxyGHRW9NESx9EdK

MariaDB [(none)]> create user user_add_seance@localhost identified by '$2y$10$7yqwAcpxpz89kwEtj8GkX.OyOCE76ecv
n5Y4c1eAIFFo87ROenP2K';
compte: user_add_seance 
mdp: $2y$10$7yqwAcpxpz89kwEtj8GkX.OyOCE76ecvn5Y4c1eAIFFo87ROenP2K

MariaDB [(none)]>  SELECT user from mysql.user;
+-----------------+
| User            |
+-----------------+
| root            |
| root            |
| cinema_admin    |
| pma             |
| root            |
| user_add_seance |
+-----------------+

/* Attribution des PRIVILEGES de chaque USERS */
/* cinema_admin: possede tous les privileges dans la base de données db_cinema */
MariaDB [(none)]> grant all on db_cinema.* to cinema_admin@localhost;
MariaDB [(none)]> SHOW grants for cinema_admin@localhost;
+---------------------------------------------------------------------------------------------------------------------+
| Grants for cinema_admin@localhost
        |
+-------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `cinema_admin`@`localhost` IDENTIFIED BY PASSWORD '*F5F0431DC5D7DEC7650C8F1BE2C1211A89
5937CC' |
| GRANT ALL PRIVILEGES ON `db_cinema`.* TO `cinema_admin`@`localhost`
        |
+-------------------------------------------------------------------------------------------------------------+

/* user_add_seance: est un compte pour l'utilisateur aura le privilege  d'ajouter une séance. Il peut consulter les films, les salles, et les horaires disponibles dans la base données db_cinema */
MariaDB [(none)]> grant insert on db_cinema.seance to user_add_seance@localhost;
MariaDB [(none)]> grant select on db_cinema.seance to user_add_seance@localhost;
MariaDB [(none)]> grant select on db_cinema.salle to user_add_seance@localhost;
MariaDB [(none)]> grant select on db_cinema.complexe to user_add_seance@localhost;
MariaDB [(none)]> grant select on db_cinema.horaire to user_add_seance@localhost;
MariaDB [(none)]> grant select on db_cinema.film to user_add_seance@localhost;
MariaDB [(none)]> show grants for user_add_seance@localhost;
+-------------------------------------------------------------------------------------------------------------+
| Grants for user_add_seance@localhost
           |
+-------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `user_add_seance`@`localhost` IDENTIFIED BY PASSWORD '*AC6640A9E12FDB7FF4CA0E53B1AD9F6
AB7894D86' |
| GRANT SELECT ON `db_cinema`.`complexe` TO `user_add_seance`@`localhost`
           |
| GRANT SELECT ON `db_cinema`.`film` TO `user_add_seance`@`localhost`
           |
| GRANT SELECT ON `db_cinema`.`salle` TO `user_add_seance`@`localhost`
           |
| GRANT SELECT, INSERT ON `db_cinema`.`seance` TO `user_add_seance`@`localhost`
           |
| GRANT SELECT ON `db_cinema`.`horaire` TO `user_add_seance`@`localhost`
           |
+-------------------------------------------------------------------------------------------------------------

/* Tester le privilege de user_add_seance */
MariaDB [db_cinema]> insert into horaire values('HO4','23h');
ERROR 1142 (42000): INSERT command denied to user 'user_add_seance'@'localhost' for table 'horaire'

MariaDB [db_cinema]> insert into seance values('SC7', 'SA5', 'FI3');
MariaDB [db_cinema]> select * from seance;
+-----------+----------+---------+
| id_seance | id_salle | id_film |
+-----------+----------+---------+
| SC1       | SA1      | FI1     |
| SC2       | SA4      | FI1     |
| SC3       | SA2      | FI1     |
| SC4       | SA7      | FI1     |
| SC5       | SA4      | FI2     |
| SC6       | SA6      | FI3     |
| SC7       | SA5      | FI3     |
+-----------+----------+---------+

MariaDB [db_cinema]> select * from horaire;
+------------+---------+
| id_horaire | horaire |
+------------+---------+
| HO1        | 10h     |
| HO2        | 14h     |
| HO3        | 20h     |
+------------+---------+

MariaDB [db_cinema]> select * from salle;
+----------+-----------+------------------+------------+-------------+
| id_salle | nom_salle | place_disponible | id_horaire | id_complexe |
+----------+-----------+------------------+------------+-------------+
| SA1      | Salle1    |               20 | HO1        | CO1         |
| SA2      | Salle1    |               10 | HO2        | CO1         |
| SA3      | Salle1    |                5 | HO3        | CO1         |
| SA4      | Salle2    |               25 | HO1        | CO1         |
| SA5      | Salle2    |               15 | HO2        | CO1         |
| SA6      | Salle1    |               17 | HO1        | CO2         |
| SA7      | Salle1    |                7 | HO3        | CO2         |
+----------+-----------+------------------+------------+-------------+

MariaDB [db_cinema]> select * from complexe;
+-------------+--------------+
| id_complexe | nom_complexe |
+-------------+--------------+
| CO1         | Complexe1    |
| CO2         | Complexe2    |
+-------------+--------------+

MariaDB [db_cinema]> select * from film;
+---------+------------+------------+
| id_film | titre_film | duree_film |
+---------+------------+------------+
| FI1     | Film1      | 30mn       |
| FI2     | Film2      | 45mn       |
| FI3     | Film3      | 60mn       |