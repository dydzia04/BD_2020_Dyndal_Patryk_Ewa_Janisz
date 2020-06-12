# BD_2020_Dyndal_Patryk_Ewa_Janisz

1. Typ projektu: kursowy<br/>
2. Projekt realizowany w zespole<br/>
3. Baza danych zaprojektowana do zgłoszeń poprawek,błędów lub nowych funkcjonalności w projektach(programach) np.sklepu internetowego<br/>
Baza zawiera tabele: Użytkownicy, Role, Pozwolenia, Zarządzanie_projektem, Projekt,Utworzone, Zamknięte, Zgłoszenia, Priorytet, Typ_Zgłoszenia.<br/>
Relacje między tabelami: <br/>
Użytkownik -> Rola - Jeden do jednego - Jeden użytkownik może mieć tylko 1 rolę <br/>
Użytkownik -> Zarządzanie projektem - Jeden do wielu - Jeden użytkownik może zarządzać wieloma projektami, opcjonalnie <br/>
Użytkownik -> Utworzone - Jeden do jednego - Jeden użytkownik może mieć jedno utworzone zgłoszenie<br/>
Użytkownik->Zamknięte -Jeden do jednego - Jeden użytkownik może zamknąć jedno zgłoszenie<br/>
Utworzone-> Zgłoszenia - Jeden do jednego - Jedeno utworzone może zawierać jedno zgłoszenie <br/>
Role -> Pozwolenia - Jeden do jednego - Jedena rola zawiera jedno pozwolenie do zmian <br/>
Zamknięte -> Zgłoszenia - Jeden do jednego - Jedno zamknięcie może zamykać zgłoszenie, opcjonalnie <br/>
Zgłoszenie -> Priorytet - Jeden do jednego - Zgłoszenie może mieć tylko jeden priorytet <br/>
Zgłoszenie-> Typ_zgłoszenia - Jeden do jednego - Zgłoszenie ma jeden typ  <br/>
Projekt->Zgłoszenie -Jeden do jednego -Jeden projekt może mieć wiele zgłoszeń<br/>

![ERD Diagram](./docs/Diagram_ERD.svg)
