// Add_User( "Imię Nazwisko", "Nick", "email@email.com", true )
CREATE OR REPLACE PROCEDURE Add_User (
    p_imie_nazwisko             IN uzytkownik.imie_nazwisko%TYPE,
    p_nazwa_wyswietlana         IN uzytkownik.nazwa_wyswietlana%TYPE,
    p_email                     IN uzytkownik.email%TYPE,
    p_zezwol_na_powiadomienia   IN uzytkownik.zezwol_na_powiadomienia_email%TYPE
)
IS

BEGIN
    INSERT INTO UZYTKOWNIK ( "ID_UZYTKOWNIKA", "IMIE_NAZWISKO", "NAZWA_WYSWIETLANA", "EMAIL", "ZEZWOL_NA_POWIADOMIENIA_EMAIL" ) 
    VALUES ( SYS_GUID(), p_imie_nazwisko, p_nazwa_wyswietlana, p_email, p_zezwol_na_powiadomienia );
    
    COMMIT;
END;


// -----------------------------------------------------

// Add_Project("Opis", ID_User)
create or replace PROCEDURE Add_Project (
    p_opis                          IN projekt.opis%TYPE,
    p_id_uzytkownika                IN uzytkownik.id_uzytkownika%TYPE
)
IS
        p_id_projektu RAW(16) := SYS_GUID();

BEGIN
    INSERT INTO PROJEKT ( "ID_PROJEKTU", "OPIS" ) 
    VALUES ( p_id_projektu, p_opis );

    INSERT INTO ZARZADZANIE_PROJEKTEM ( "ID_PROJEKTU", "ID_UZYTKOWNIKA" )
    VALUES ( p_id_projektu, p_id_uzytkownika );

    COMMIT;
END;


END;


// ----------------------------------------------------------------------

//Add_Issue("Tytuł", "Opis", "Bug", "Wysoki", "Podsumowanie", ID_Selected_Project, ID_User)
create or replace PROCEDURE Add_Issue (
    p_tytul             IN zgloszenia.tytul%TYPE,
    p_opis              IN zgloszenia.opis%TYPE,
    p_typ               IN typ_zgloszenia.nazwa%TYPE,
    p_prioritet         IN prioritet.typ%TYPE,
    p_podsumowanie      IN zgloszenia.podsumowanie%TYPE,
    p_id_projektu       IN zgloszenia.id_projektu%TYPE,
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE
)
IS

    p_id_zgloszenia RAW(16) := SYS_GUID();
    p_id_utworzenia RAW(16) := SYS_GUID();
    p_id_typu       typ_zgloszenia.id_typ%TYPE;
    p_id_prioritetu prioritet.id_prioritet%TYPE;

BEGIN
    
    SELECT ID_TYP INTO p_id_typu FROM typ_zgloszenia WHERE NAZWA=p_typ;
    
    SELECT ID_PRIORITET INTO p_id_prioritetu FROM prioritet WHERE TYP=p_prioritet;
    
    INSERT INTO UTWORZONE ( "ID_UTWORZONE", "ID_UZYTKOWNIKA" ) 
    VALUES ( p_id_utworzenia, p_id_uzytkownika );
    
    INSERT INTO ZGLOSZENIA ( "ID_ZGLOSZENIA", "TYTUL", "OPIS", "ID_TYP", "ID_PRIORITET", "ID_UTWORZONE", "PODSUMOWANIE", "ID_PROJEKTU" )
    VALUES ( p_id_zgloszenia, p_tytul, p_opis, p_id_typu, p_id_prioritetu, p_id_utworzenia, p_podsumowanie, p_id_projektu );
    
    COMMIT;
END;


// ----------------------------------------------

//Add_Close(ID_User, ID_Zgloszenia)
create or replace PROCEDURE Add_Close (
    p_id_uzytkownika    IN zamkniete.id_uzytkownika%TYPE,
    p_id_zgloszenia     IN zgloszenia.id_zgloszenia%TYPE
)
IS

    p_id_zamkniecia RAW(16) := SYS_GUID();

BEGIN

    INSERT INTO ZAMKNIETE ( "ID_ZAMKNIETE", "ID_UZYTKOWNIKA" ) 
    VALUES ( p_id_zamkniecia, p_id_uzytkownika );
    
    UPDATE zgloszenia SET id_zamkniete=p_id_zamkniecia WHERE id_zgloszenia=p_id_zgloszenia;
    
    COMMIT;
END;


// ------------------------------------------------

//Jak wyżej, w parametrach ID i wartość jaka ma być ustawiona, wszędzie niżej będzie to samo

create or replace PROCEDURE Edit_User_Imie_Nazwisko (
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE,
    p_imie_nazwisko  IN uzytkownik.imie_nazwisko%TYPE
)
IS

BEGIN
    
    UPDATE uzytkownik SET imie_nazwisko=p_imie_nazwisko WHERE id_uzytkownika=p_id_uzytkownika;
    
    COMMIT;
END;


// ------------------------------------------------


create or replace PROCEDURE Edit_User_Nazwa_Wyswietlana (
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE,
    p_nazwa_wyswietlana  IN uzytkownik.nazwa_wyswietlana%TYPE
)
IS

BEGIN
    
    UPDATE uzytkownik SET nazwa_wyswietlana=p_nazwa_wyswietlana WHERE id_uzytkownika=p_id_uzytkownika;
    
    COMMIT;
END;


// ------------------------------------------------


create or replace PROCEDURE Edit_User_Email (
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE,
    p_email IN uzytkownik.email%TYPE
)
IS

BEGIN
    
    UPDATE uzytkownik SET email=p_email WHERE id_uzytkownika=p_id_uzytkownika;
    
    COMMIT;
END;


// ------------------------------------------------


create or replace PROCEDURE Edit_User_Email_Newsletter (
    p_id_uzytkownika    IN uzytkownik.id_uzytkownika%TYPE,
    p_zezwol            IN uzytkownik.zezwol_na_powiadomienia_email%TYPE
)
IS

BEGIN
    
    UPDATE uzytkownik SET zezwol_na_powiadomienia_email=p_zezwol WHERE id_uzytkownika=p_id_uzytkownika;
    
    COMMIT;
END;


// -----------------------------------------------

create or replace PROCEDURE Edit_Project_Opis (
    p_id_projektu    IN projekt.id_projektu%TYPE,
    p_opis           IN projekt.opis%TYPE
)
IS

BEGIN
    
    UPDATE projekt SET opis=p_opis WHERE id_projektu=p_id_projektu;
    
    COMMIT;
END;


// ----------------------------------------------


create or replace PROCEDURE Edit_Issues_Tytul (
    p_id_zgloszenia    IN zgloszenia.id_zgloszenia%TYPE,
    p_tytul            IN zgloszenia.tytul%TYPE
)
IS

BEGIN
    
    UPDATE zgloszenia SET tytul=p_tytul WHERE id_zgloszenia=p_id_zgloszenia;
    
    COMMIT;
END;


// ---------------------------------------------


create or replace PROCEDURE Edit_Issues_Opis (
    p_id_zgloszenia    IN zgloszenia.id_zgloszenia%TYPE,
    p_opis            IN zgloszenia.opis%TYPE
)
IS

BEGIN
    
    UPDATE zgloszenia SET opis=p_opis WHERE id_zgloszenia=p_id_zgloszenia;
    
    COMMIT;
END;


// ---------------------------------------------


create or replace PROCEDURE Edit_Issues_Podsumowanie (
    p_id_zgloszenia    IN zgloszenia.id_zgloszenia%TYPE,
    p_podsumowanie            IN zgloszenia.podsumowanie%TYPE
)
IS

BEGIN
    
    UPDATE zgloszenia SET podsumowanie=p_podsumowanie WHERE id_zgloszenia=p_id_zgloszenia;
    
    COMMIT;
END;


// ---------------------------------------------


create or replace PROCEDURE Edit_Issues_Podsumowanie (
    p_id_zgloszenia    IN zgloszenia.id_zgloszenia%TYPE,
    p_typ            IN typ_zgloszenia.nazwa%TYPE
)
IS

    p_id_typ typ_zgloszenia.id_typ%TYPE;

BEGIN
    
    SELECT id_typ INTO p_id_typ FROM typ_zgloszenia WHERE nazwa=p_typ;
    
    UPDATE zgloszenia SET id_typ=p_id_typ WHERE id_zgloszenia=p_id_zgloszenia;
    
    COMMIT;
END;


// --------------------------------------------


create or replace PROCEDURE Edit_Issues_Podsumowanie (
    p_id_zgloszenia    IN zgloszenia.id_zgloszenia%TYPE,
    p_typ            IN prioritet.typ%TYPE
)
IS

    p_id_prioritet prioritet.typ%TYPE;

BEGIN
    
    SELECT id_prioritet INTO p_id_prioritet FROM prioritet WHERE typ=p_typ;
    
    UPDATE zgloszenia SET id_prioritet=p_id_prioritet WHERE id_zgloszenia=p_id_zgloszenia;
    
    COMMIT;
END;