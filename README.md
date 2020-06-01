# BD_2020_Dyndal_Patryk_Ewa_Janisz

1. Typ projektu: kursowy<br/>
2. Projekt realizowany w zespole<br/>
3. Baza danych zaprojektowana dla sklepu internetowego. <br/>
Baza zawiera tabele: Użytkownicy, Role, Zamówienia, Koszyki, Przesyłki, Wydziały, Magazyny, Kategorie, Przedmioty, Opinie.<br/>
Relacje między tabelami: <br/>
Użytkownik -> Rola - Wiele do jednego - Każdy użytkownik może mieć tylko 1 rolę <br/>
Użytkownik -> Opinia - Jeden do wielu - Jeden użytkownik może dodać wiele opinii <br/>
Użytkownik -> Zamówienie - Jeden do wielu - Jeden użytkownik może mieć wiele zamówień <br/>
Zamówienia -> Koszyk - Jeden do jednego - Jeden koszyk może mieć jedno zamówienie <br/>
Koszyk -> Przesyłki - Jeden do jednego - Jeden koszyk zawiera jedną przesyłkę <br/>
Opinie -> Przedmiot - Wiele do jednego - Wiele opinii może być przyznanych przedmiotowi <br/>
Przedmiot -> Kategoria - Jeden do jednego - Przedmiot może mieć tylko jedną kategorie <br/>
Kategorie -> Magazyn - Jeden do jednego - Jedna kategoria przedmiotów znajduje się w 1 magaazynie <br/>
Magazyn -> Wydział - Jeden do wielu - Wydział może mieć wiele magazynów <br/>
Wydział -> Przesyłka - Jeden do jednego - Z jednego wybranego wydziału można wysłać 1 przesyłkę <br/>

![ERD](./docs/Diagram_ERD.svg)
