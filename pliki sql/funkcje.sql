create or replace function getLigi(sel_kraj varchar)
returns TABLE (nazwaLigi varchar, kraj varchar, poziom integer, liczba_zespolow integer, ilosc_sedziow integer) as
    $$
    declare 
        rec record;
        query text;
        sel_kraj alias for sel_kraj;
    begin
        query := 'select * from _liga';
        IF sel_kraj NOT LIKE 'Wszystkie' THEN
            query := query || ' where kraj =  ''' || sel_kraj || '''';
        END IF;
        for rec in execute query
            loop
                nazwaLigi := rec.Nazwa;
                kraj := rec.kraj;
                poziom := rec.Poziom_rozgrywkowy;
                liczba_zespolow := rec.liczba_zespolow;
                ilosc_sedziow := rec.ilosc_sedziow;
                return next;
            end loop;
    end
    $$ language plpgsql;


create or replace function getKluby(sel_kraj varchar, sel_liga varchar)
returns TABLE (nazwa varchar, liga varchar, kraj varchar, liczba_zawodnikow integer) as
    $$
    declare 
        rec record;
        query text;
        sel_kraj alias for sel_kraj;
        sel_liga alias for sel_liga;
    begin
        query := 'select * from zespol';
        IF sel_kraj NOT LIKE 'Wszystkie' AND sel_liga NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND Nazwa =  ''' || sel_liga || '''';
        ELSIF sel_liga NOT LIKE 'Wszystkie' THEN
            query := query || ' where Nazwa =  ''' || sel_liga || '''';
        ELSIF sel_kraj NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
        END IF;
        for rec in execute query
            loop
                nazwa := rec.nazwa_klubu;
                liga := rec.Nazwa;
                kraj := rec.kraj;
                liczba_zawodnikow := rec.liczba_zawodnikow;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getKraje(sel_konf varchar)
returns TABLE (kraj varchar, konf varchar, feder varchar, p_feder varchar) as
    $$
    declare 
        rec record;
        query text;
        sel_konf alias for sel_konf;
    begin
        query := 'select * from panstwo';
        IF sel_konf NOT LIKE 'Wszystkie' THEN
            query := query || ' where Nazwa =  ''' || sel_konf || '''';
        END IF;
        for rec in execute query
            loop
                kraj := rec.kraj;
                konf := rec.Nazwa;
                feder := rec.Nazwa_federacji;
                p_feder := rec.Pelna_nazwa_federacji;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getSedziowie(sel_kraj varchar, sel_liga varchar)
returns TABLE (imie varchar, nazwisko varchar, nazwa varchar, kraj varchar, data_ur date) as
    $$
    declare 
        rec record;
        query text;
        sel_kraj alias for sel_kraj;
        sel_liga alias for sel_liga;
    begin
        query := 'select * from sedzia_glowny';
        IF sel_kraj NOT LIKE 'Wszystkie' AND sel_liga NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND Nazwa =  ''' || sel_liga || '''';
        ELSIF sel_liga NOT LIKE 'Wszystkie' THEN
            query := query || ' where Nazwa =  ''' || sel_liga || '''';
        ELSIF sel_kraj NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
        END IF;
        for rec in execute query
            loop
                imie := rec.Imie;
                nazwisko := rec.Nazwisko;
                nazwa := rec.Nazwa;
                kraj := rec.kraj;
                data_ur := rec.Data_urodzenia;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getTrenerzy(sel_kraj varchar, sel_klub varchar, sel_lic varchar)
returns TABLE (imie varchar, nazwisko varchar, nazwa varchar, kraj varchar, data_ur date, lic varchar) as
    $$
    declare 
        rec record;
        query text;
        sel_kraj alias for sel_kraj;
        sel_klub alias for sel_klub;
        sel_lic alias for sel_lic;
    begin
        query := 'select * from p_trener';
        IF sel_kraj NOT LIKE 'Wszystkie' AND sel_klub NOT LIKE 'Wszystkie' AND sel_lic NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND nazwa_klubu =  ''' || sel_klub || '''';
            query := query || ' AND Licencja_trenerska =  ''' || sel_lic || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' AND sel_klub NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND nazwa_klubu =  ''' || sel_klub || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' AND sel_lic NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND Licencja_trenerska =  ''' || sel_lic || '''';

        ELSIF sel_klub NOT LIKE 'Wszystkie' AND sel_lic NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE nazwa_klubu =  ''' || sel_klub || '''';
            query := query || ' AND Licencja_trenerska =  ''' || sel_lic || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' THEN
            query := query || ' where kraj =  ''' || sel_kraj || '''';

        ELSIF sel_klub NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE nazwa_klubu =  ''' || sel_klub || '''';

        ELSIF sel_lic NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE Licencja_trenerska =  ''' || sel_lic || '''';
        END IF;
        for rec in execute query
            loop
                imie := rec.Imie;
                nazwisko := rec.nazwisko;
                nazwa := rec.nazwa_klubu;
                kraj := rec.kraj;
                data_ur := rec.Data_urodzenia;
                lic := rec.Licencja_trenerska;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getSztab(sel_kraj varchar, sel_klub varchar, sel_rola varchar)
returns TABLE (imie varchar, nazwisko varchar, nazwa varchar, kraj varchar, data_ur date, rola varchar) as
    $$
    declare 
        rec record;
        query text;
        sel_kraj alias for sel_kraj;
        sel_klub alias for sel_klub;
        sel_rola alias for sel_rola;
    begin
        query := 'select * from sztab_trener';
        IF sel_kraj NOT LIKE 'Wszystkie' AND sel_klub NOT LIKE 'Wszystkie' AND sel_rola NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND nazwa_klubu =  ''' || sel_klub || '''';
            query := query || ' AND Rola =  ''' || sel_rola || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' AND sel_klub NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND nazwa_klubu =  ''' || sel_klub || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' AND sel_rola NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND Rola =  ''' || sel_rola || '''';

        ELSIF sel_klub NOT LIKE 'Wszystkie' AND sel_rola NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE nazwa_klubu =  ''' || sel_klub || '''';
            query := query || ' AND Rola =  ''' || sel_rola || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' THEN
            query := query || ' where kraj =  ''' || sel_kraj || '''';

        ELSIF sel_klub NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE nazwa_klubu =  ''' || sel_klub || '''';

        ELSIF sel_rola NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE Rola =  ''' || sel_rola || '''';
        END IF;
        for rec in execute query
            loop
                imie := rec.Imie;
                nazwisko := rec.nazwisko;
                nazwa := rec.nazwa_klubu;
                kraj := rec.kraj;
                data_ur := rec.Data_urodzenia;
                rola := rec.Rola;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getStadiony(sel_klub varchar, sel_miasto varchar)
returns TABLE (nazwa varchar, klub varchar, poj integer, miasto varchar) as
    $$
    declare 
        rec record;
        query text;
        sel_klub alias for sel_klub;
        sel_miasto alias for sel_miasto;
    begin
        query := 'select * from stadion';
        IF sel_klub NOT LIKE 'Wszystkie' AND sel_miasto NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE nazwa_klubu =  ''' || sel_klub || '''';
            query := query || ' AND Miejscowosc =  ''' || sel_miasto || '''';
        ELSIF sel_miasto NOT LIKE 'Wszystkie' THEN
            query := query || ' where Miejscowosc =  ''' || sel_miasto || '''';
        ELSIF sel_klub NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE nazwa_klubu =  ''' || sel_klub || '''';
        END IF;
        for rec in execute query
            loop
                nazwa := rec.Nazwa;
                klub := rec.nazwa_klubu;
                poj := rec.Pojemnosc;
                miasto := rec.Miejscowosc;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getZawodnicy(sel_kraj varchar, sel_klub varchar, sel_poz varchar)
returns TABLE (num integer, imie varchar, nazwisko varchar, nazwa varchar, pozycja varchar, kraj varchar, data_ur date, wzrost integer, waga integer) as
    $$
    declare 
        rec record;
        query text;
        sel_kraj alias for sel_kraj;
        sel_klub alias for sel_klub;
        sel_poz alias for sel_poz;
    begin
        query := 'select * from pilkarz';
        IF sel_kraj NOT LIKE 'Wszystkie' AND sel_klub NOT LIKE 'Wszystkie' AND sel_poz NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND nazwa_klubu =  ''' || sel_klub || '''';
            query := query || ' AND Pozycja =  ''' || sel_poz || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' AND sel_klub NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND nazwa_klubu =  ''' || sel_klub || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' AND sel_poz NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE kraj =  ''' || sel_kraj || '''';
            query := query || ' AND Pozycja =  ''' || sel_poz || '''';

        ELSIF sel_klub NOT LIKE 'Wszystkie' AND sel_poz NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE nazwa_klubu =  ''' || sel_klub || '''';
            query := query || ' AND Pozycja =  ''' || sel_poz || '''';

        ELSIF sel_kraj NOT LIKE 'Wszystkie' THEN
            query := query || ' where kraj =  ''' || sel_kraj || '''';

        ELSIF sel_klub NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE nazwa_klubu =  ''' || sel_klub || '''';

        ELSIF sel_poz NOT LIKE 'Wszystkie' THEN
            query := query || ' WHERE Pozycja =  ''' || sel_poz || '''';
        END IF;
        for rec in execute query
            loop
                num := rec.Numer;
                imie := rec.Imie;
                nazwisko := rec.nazwisko;
                nazwa := rec.nazwa_klubu;
                pozycja := rec.Pozycja;
                kraj := rec.kraj;
                data_ur := rec.Data_urodzenia;
                wzrost := rec.Wzrost;
                waga := rec.Waga;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getid_konf(sel_konf varchar)
returns TABLE (id integer) as
    $$
    declare 
        rec record;
        query text;
        sel_konf alias for sel_konf;
    begin
        query := 'select Konfederacja.ID_konfederacja from projekt.Konfederacja';
        query := query || ' where Konfederacja.Nazwa =  ''' || sel_konf || '''';
        for rec in execute query
            loop
                id := rec.ID_konfederacja;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getid_kraj(sel_kraj varchar)
returns TABLE (id integer) as
    $$
    declare 
        rec record;
        query text;
        sel_kraj alias for sel_kraj;
    begin
        query := 'select Kraj.ID_kraj from projekt.Kraj';
        query := query || ' where Kraj.Nazwa =  ''' || sel_kraj || '''';
        for rec in execute query
            loop
                id := rec.ID_kraj;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getid_liga(sel_liga varchar)
returns TABLE (id integer) as
    $$
    declare 
        rec record;
        query text;
        sel_liga alias for sel_liga;
    begin
        query := 'select Liga.ID_liga from projekt.Liga';
        query := query || ' where Liga.Nazwa =  ''' || sel_liga || '''';
        for rec in execute query
            loop
                id := rec.ID_liga;
                return next;
            end loop;
    end
    $$ language plpgsql;

create or replace function getid_klub(sel_klub varchar)
returns TABLE (id integer) as
    $$
    declare 
        rec record;
        query text;
        sel_klub alias for sel_klub;
    begin
        query := 'select Klub.ID_klub from projekt.Klub';
        query := query || ' where Klub.Nazwa =  ''' || sel_klub || '''';
        for rec in execute query
            loop
                id := rec.ID_Klub;
                return next;
            end loop;
    end
    $$ language plpgsql;