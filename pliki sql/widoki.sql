create or replace view pilkarz as
select z.Numer, z.Imie, z.Nazwisko, kl.Nazwa as nazwa_klubu, z.Pozycja, kr.Nazwa as kraj, z.Data_urodzenia, z.Wzrost, z.Waga from projekt.Zawodnik z 
    join projekt.Klub kl on z.ID_klub = kl.ID_klub
    join projekt.Kraj kr on z. ID_kraj = kr.ID_kraj;

create or replace view p_trener as
select t.Imie, t.Nazwisko, kl.Nazwa as nazwa_klubu, kr.Nazwa as kraj, t.Data_urodzenia, t.Licencja_trenerska from projekt.Trener t 
    join projekt.Klub kl on t.ID_klub = kl.ID_klub
    join projekt.Kraj kr on t.ID_kraj = kr.ID_kraj;

create or replace view sztab_trener as
select t.Imie, t.Nazwisko, kl.Nazwa as nazwa_klubu, kr.Nazwa as kraj, t.Data_urodzenia, t.Rola from projekt.Sztab t 
    join projekt.Klub kl on t.ID_klub = kl.ID_klub
    join projekt.Kraj kr on t.ID_kraj = kr.ID_kraj;

create or replace view stadion as
select s.Nazwa, kl.Nazwa as nazwa_klubu, s.Pojemnosc, s.Miejscowosc from projekt.Stadion s 
    join projekt.Klub kl on s.ID_klub = kl.ID_klub;

create or replace view zespol as
select kl.Nazwa as nazwa_klubu, l.Nazwa, kr.Nazwa as kraj, count(z.ID_zawodnik) as liczba_zawodnikow from projekt.Klub kl 
    join projekt.Kraj kr on kl.ID_kraj = kr.ID_kraj
    join projekt.Liga l on kl.ID_liga = l.ID_liga
    join projekt.Zawodnik z on z.ID_klub = kl.ID_klub
    GROUP BY nazwa_klubu, l.Nazwa, kraj
    HAVING count(z.ID_zawodnik)>=0;

create or replace view sedzia_glowny as
select s.Imie, s.Nazwisko, l.Nazwa, kr.Nazwa as kraj, s.Data_urodzenia from projekt.Sedzia s 
    join projekt.Liga l on l.ID_Liga = s.ID_Liga
    join projekt.Kraj kr on s.ID_kraj = kr.ID_kraj;

create or replace view _liga as
select l.Nazwa, kr.Nazwa as kraj, l.Poziom_rozgrywkowy, count(kl.ID_klub) as liczba_zespolow, count(s.ID_sedzia) as ilosc_sedziow from projekt.Liga l 
    join projekt.Kraj kr on l.ID_kraj = kr.ID_kraj
    join projekt.Klub kl on l.ID_liga = kl.ID_liga
    join projekt.Sedzia s on s.ID_liga = l.ID_liga
    GROUP BY l.Nazwa, kraj, l.Poziom_rozgrywkowy;

create or replace view panstwo as
select kr.Nazwa as kraj, k.Nazwa, kr.Nazwa_federacji, kr.Pelna_nazwa_federacji from projekt.Kraj kr 
    join projekt.Konfederacja k on k.ID_konfederacja = kr.ID_konfederacja
    GROUP BY kraj, k.Nazwa, kr.Nazwa_federacji, kr.Pelna_nazwa_federacji
    ORDER BY kr.Nazwa ASC;

create or replace view _konfederacja as
select k.Nazwa, k.Pelna_nazwa, k.Kontynent, k.Siedziba, k.Data_zalozenia, count(kr.ID_kraj) as ilosc_panstw from projekt.Konfederacja k 
    join projekt.Kraj kr on kr.ID_konfederacja = k.ID_konfederacja
    GROUP BY k.Nazwa, k.Pelna_nazwa, k.Kontynent, k.Siedziba, k.Data_zalozenia
    ORDER BY k.Nazwa;

create or replace view kraj_nazwa as
select kr.Nazwa from projekt.Kraj kr
    ORDER BY kr.Nazwa ASC;

create or replace view liga_nazwa as
select l.Nazwa from projekt.Liga l
    ORDER BY l.Nazwa ASC;

create or replace view konf_nazwa as
select k.Nazwa from projekt.Konfederacja k
    ORDER BY k.Nazwa ASC;

create or replace view klub_nazwa as
select kl.Nazwa from projekt.Klub kl
    ORDER BY kl.Nazwa ASC;

create or replace view lic_nazwa as
select t.Licencja_trenerska from projekt.Trener t
    GROUP BY t.Licencja_trenerska
    ORDER BY t.Licencja_trenerska ASC;

create or replace view rola_nazwa as
select sz.Rola from projekt.Sztab sz
    GROUP BY sz.Rola
    ORDER BY sz.Rola ASC;

create or replace view miasto_nazwa as
select s.Miejscowosc from projekt.Stadion s
    GROUP BY s.Miejscowosc
    ORDER BY s.Miejscowosc ASC;

create or replace view poz_nazwa as
select z.Pozycja from projekt.Zawodnik z
    GROUP BY z.Pozycja;