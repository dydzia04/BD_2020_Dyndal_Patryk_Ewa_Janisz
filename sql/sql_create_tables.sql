CREATE TABLE Projekt (
    ID_Projektu                     RAW(16)         DEFAULT SYS_GUID(),
    Opis                            VARCHAR(254)    NOT NULL,
    Czas_Modyfikacji                TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE Projekt ADD (
    CONSTRAINT                      PK_Projektu     PRIMARY KEY (ID_Projektu)
);
    
CREATE TABLE Pozwolenia (
    ID_Pozwolenia                   RAW(16)         DEFAULT SYS_GUID(),
    Nazwa                           VARCHAR(128)    NOT NULL UNIQUE,
    Create_Issue                    NUMBER(1)       NOT NULL,
    Edit_own_Issue                  NUMBER(1)       NOT NULL,
    Delete_own_Issue                NUMBER(1)       NOT NULL,
    Edit_any_Issue                  NUMBER(1)       NOT NULL,
    Delete_any_Issue                NUMBER(1)       NOT NULL
);

ALTER TABLE Pozwolenia ADD (
    CONSTRAINT                      PK_Pozwolenia   PRIMARY KEY (ID_Pozwolenia)
);

CREATE TABLE Uzytkownik (
    ID_Uzytkownika                  RAW(16)         DEFAULT SYS_GUID(),
    Imie_Nazwisko                   VARCHAR(64)     NOT NULL,
    Nazwa_Wyswietlana               VARCHAR(32)     NOT NULL UNIQUE,
    Email                           VARCHAR(254)    NOT NULL,
    Zezwol_na_powiadomienia_email   NUMBER(1)       NOT NULL
);

ALTER TABLE Uzytkownik ADD (
    CONSTRAINT                      PK_Uzytkownika  PRIMARY KEY (ID_Uzytkownika)
);

CREATE TABLE Role (
    ID_Uzytkownika                  RAW(16)         NOT NULL,
    ID_Pozwolenia                   RAW(16)         NOT NULL
);

ALTER TABLE Role ADD (
    CONSTRAINT                      FK_Uzytkownika  FOREIGN KEY (ID_Uzytkownika)    REFERENCES Uzytkownik(ID_Uzytkownika),
    CONSTRAINT                      FK_Pozwolenia   FOREIGN KEY (ID_Pozwolenia)     REFERENCES Pozwolenia(ID_Pozwolenia)
);

CREATE TABLE Zarzadzanie_projektem (
    ID_Projektu                     RAW(16)         NOT NULL,
    ID_Uzytkownika                  RAW(16)         NOT NULL
);

ALTER TABLE Zarzadzanie_projektem ADD (
    CONSTRAINT                      FK_Projektu     FOREIGN KEY (ID_Projektu) REFERENCES Projekt(ID_Projektu),
    CONSTRAINT                      FK_Uzytkownika  FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownik(ID_Uzytkownika)
);

CREATE TABLE Utworzone (
    ID_Utworzone                    RAW(16)         DEFAULT SYS_GUID(),
    ID_Uzytkownika                  RAW(16)         NOT NULL,
    Czas_Utworzenia                 TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE Utworzone ADD (
    CONSTRAINT                      PK_Utworzone    PRIMARY KEY (ID_Utworzone),
    CONSTRAINT                      FK_Uzytkownika  FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownik(ID_Uzytkownika)
);

CREATE TABLE Zamkniete (
    ID_Zamkniete                    RAW(16)         DEFAULT SYS_GUID(),
    ID_Uzytkownika                  RAW(16)         NOT NULL,
    Czas_Zamkniecia                 TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE Zamkniete ADD (
    CONSTRAINT                      PK_Projektu     PRIMARY KEY (ID_Zamkniete),
    CONSTRAINT                      FK_Uzytkownika  FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownik(ID_Uzytkownika)
);

CREATE TABLE Typ_Zgloszenia (
    ID_Typ                          RAW(16)         DEFAULT SYS_GUID(),
    Nazwa                           VARCHAR(254)    NOT NULL
);

ALTER TABLE Typ_Zgloszenia ADD (
    CONSTRAINT                      PK_Typ          PRIMARY KEY (ID_Typ)
);

CREATE TABLE Prioritet (
    ID_Prioritet                    RAW(16)         DEFAULT SYS_GUID(),
    Typ                             VARCHAR(254)    NOT NULL
);

ALTER TABLE Prioritet ADD (
    CONSTRAINT                      PK_Prioritet    PRIMARY KEY (ID_Prioritet)
);

CREATE TABLE Zgloszenia (
    ID_Zgloszenia                   RAW(16)         DEFAULT SYS_GUID(),
    Tytul                           VARCHAR(64)     NOT NULL,
    Opis                            VARCHAR(254)    NOT NULL,
    ID_Typ                          RAW(16)         NOT NULL,
    ID_Prioritet                    RAW(16)         NOT NULL,
    ID_Utworzone                    RAW(16)         ,
    ID_Zamkniete                    RAW(16)         ,
    Podsumowanie                    VARCHAR(254)    NOT NULL,
    ID_Projektu                     RAW(16)         NOT NULL
);

ALTER TABLE Zgloszenia ADD (
    CONSTRAINT                      PK_Zgloszenia   PRIMARY KEY (ID_Zgloszenia),
    CONSTRAINT                      FK_Typ          FOREIGN KEY (ID_Typ) REFERENCES Typ_Zgloszenia(ID_Typ),
    CONSTRAINT                      FK_Prioritet    FOREIGN KEY (ID_Prioritet) REFERENCES Prioritet(ID_Prioritet),
    CONSTRAINT                      FK_Utworzone    FOREIGN KEY (ID_Utworzone) REFERENCES Utworzone(ID_Utworzone),
    CONSTRAINT                      FK_Zamkinete    FOREIGN KEY (ID_Zamkniete) REFERENCES Zamkniete(ID_Zamkniete),
    CONSTRAINT                      FK_Projektu     FOREIGN KEY (ID_Projektu) REFERENCES Projekt(ID_Projektu)
);
