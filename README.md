# Zadanie testowe dla firmy **NETIZENS**
Grudzień 2018  
<br> 

## Treść zadania:

Napisz aplikację wykorzystując wzorzec **MVVM**, która:

* pobierze (wykorzystując **Alamofire**) listę wpisów z adresu: <https://jsonplaceholder.typicode.com/photos>

* zapisze wyniki w bazie **REALM**
* wyświetli wyniki w formie UITableView, gdzie poszczególne komórki automatycznie dopasowują wysokość do tekstu 'title'

<br> 

## Dodatkowo dodano:

* obsługę błędów API w formie alertów
	* 	w tym informowanie o braku dostępu do Internetu

* w sytuacji, kiedy dane z API nie mogą zostać pobrane, wyświetlane są dane z poprzedniej sesji zapisane lokalnie w bazie Realm
* po wskazaniu wiersza tabeli następuje wyświetlenie detali (duże zjęcie pobrane z adresu otrzymanego z API)
* wszystkie pobrane obiekty graficzne są przechowywane w pamięci cache z wykorzystaniem NSCache, dzięki czemu są pobierane tylko raz

