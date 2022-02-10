create or replace function sprawdzKrajPrzedInsert() returns trigger
    language plpgsql
as
$$
declare
        rec record;
        query text;
    begin
        query := 'select * from projekt.Kraj';
        for rec in execute query
        loop
            if lower(new.Nazwa) = lower(rec.Nazwa) OR lower(new.Pelna_nazwa_federacji) = lower(rec.Pelna_nazwa_federacji) then
                raise info 'Ten kraj znajduje się już w bazie.';
                return null;
            end if;
        end loop;
        return new;
    end;
$$;

create trigger sprawdzKrajPrzedInsert before insert on projekt.Kraj
    for each row execute procedure sprawdzKrajPrzedInsert();



create or replace function sprawdzLigePrzedInsert() returns trigger
    language plpgsql
as
$$
declare
        rec record;
        query text;
    begin
        query := 'select * from projekt.Liga
        WHERE Liga.ID_kraj = ' || new.ID_kraj;
        for rec in execute query
        loop
            if new.Poziom_rozgrywkowy = rec.Poziom_rozgrywkowy then
                raise info 'Liga w tym kraju o tym poziomie rozgrywkowym znajduje się już w bazie.';
                return null;
            end if;
        end loop;
        return new;
    end;
$$;

create trigger sprawdzLigePrzedInsert before insert on projekt.Liga
    for each row execute procedure sprawdzLigePrzedInsert();



create or replace function sprawdzSedziegoPrzedInsert() returns trigger
    language plpgsql
as
$$
declare
        rec record;
        query text;
    begin
        query := 'select * from projekt.Sedzia';
        for rec in execute query
        loop
            if new.Data_urodzenia >= '2008-01-01'::date then
                raise info 'Pomyliłeś datę urodzenia';
                return null;
            end if;
        end loop;
        return new;
    end;
$$;

create trigger sprawdzSedziegoPrzedInsert before insert on projekt.Sedzia
    for each row execute procedure sprawdzSedziegoPrzedInsert();



create or replace function sprawdzKlubPrzedInsert() returns trigger
    language plpgsql
as
$$
declare
        rec record;
        query text;
    begin
        query := 'select * from projekt.Klub';
        for rec in execute query
        loop
            if lower(new.Nazwa) = lower(rec.Nazwa) AND lower(new.Miasto) = lower(rec.Miasto) then
                raise info 'Klub istnieje w bazie';
                return null;
            end if;
        end loop;
        return new;
    end;
$$;

create trigger sprawdzKlubPrzedInsert before insert on projekt.Klub
    for each row execute procedure sprawdzKlubPrzedInsert();




create or replace function sprawdzZawPrzedInsert() returns trigger
    language plpgsql
as
$$
declare
        rec record;
        query text;
    begin
        query := 'select * from projekt.Zawodnik';
        for rec in execute query
        loop
            if lower(new.Imie) = lower(rec.Imie) AND lower(new.Nazwisko) = lower(rec.Nazwisko) AND new.Data_urodzenia = rec.Data_urodzenia AND new.Wzrost = rec.Wzrost AND new.Waga = rec.Waga then
                raise info 'Zawodnik istnieje w bazie';
                return null;
            end if;
            if new.Data_urodzenia >= '2008-01-01'::date then
                raise info 'Pomyliłeś datę urodzenia';
                return null;
            end if;
        end loop;
        return new;
    end;
$$;

create trigger sprawdzZawPrzedInsert before insert on projekt.Zawodnik
    for each row execute procedure sprawdzZawPrzedInsert();



create or replace function sprawdzTrenPrzedInsert() returns trigger
    language plpgsql
as
$$
declare
        rec record;
        query text;
    begin
        query := 'select * from projekt.Trener';
        for rec in execute query
        loop
            if lower(new.Imie) = lower(rec.Imie) AND lower(new.Nazwisko) = lower(rec.Nazwisko) AND new.Data_urodzenia = rec.Data_urodzenia then
                raise info 'Trener istnieje w bazie';
                return null;
            end if;
            if new.Data_urodzenia >= '2008-01-01'::date then
                raise info 'Pomyliłeś datę urodzenia';
                return null;
            end if;
        end loop;
        return new;
    end;
$$;

create trigger sprawdzTrenPrzedInsert before insert on projekt.Trener
    for each row execute procedure sprawdzTrenPrzedInsert();



create or replace function sprawdzSztabPrzedInsert() returns trigger
    language plpgsql
as
$$
declare
        rec record;
        query text;
    begin
        query := 'select * from projekt.Sztab';
        for rec in execute query
        loop
            if lower(new.Imie) = lower(rec.Imie) AND lower(new.Nazwisko) = lower(rec.Nazwisko) AND new.Data_urodzenia = rec.Data_urodzenia then
                raise info 'Członek sztabu istnieje w bazie';
                return null;
            end if;
            if new.Data_urodzenia >= '2008-01-01'::date then
                raise info 'Pomyliłeś datę urodzenia';
                return null;
            end if;
        end loop;
        return new;
    end;
$$;

create trigger sprawdzSztabPrzedInsert before insert on projekt.Sztab
    for each row execute procedure sprawdzSztabPrzedInsert();




create or replace function sprawdzStadPrzedInsert() returns trigger
    language plpgsql
as
$$
declare
        rec record;
        query text;
    begin
        query := 'select * from projekt.Stadion';
        for rec in execute query
        loop
            if lower(new.nazwa) = lower(rec.Nazwa) AND new.Pojemnosc = rec.Pojemnosc AND new.Miejscowosc = rec.Miejscowosc then
                raise info 'Stadion istnieje w bazie';
                return null;
            end if;
        end loop;
        return new;
    end;
$$;

create trigger sprawdzStadPrzedInsert before insert on projekt.Stadion
    for each row execute procedure sprawdzStadPrzedInsert();