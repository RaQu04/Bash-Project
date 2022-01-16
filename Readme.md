Przygotowanie projektu/skryptu (napisanego w bash zgodnie z opisem poniżej) oraz sprawozdania zawierającego następujące elementy:
1) Wizja projektu (1-2 zdania - jakie zadania realizuje skrypt)
2) Przebieg działania skryptu (kilka zdań - jaki jest przebieg skryptu, opis zmiennych wejściowych/wyjściowych itp.)
3) Kod skryptu (bash)
4) Napotkane problemy oraz wnioski (w jaki sposób problemy zostały rozwiązane)
Powyższe elementy proszę przesłać w jednym pliku w formacie tekstowym (.TXT)
Elementy podlegające ocenie:
terminowość realizacji projektu 
poprawność działania skryptu zgodna z uwagami na zajęciach
kompletność elementów sprawozdania
stopień skomplikowania kodu skryptu 
znajomość i zrozumienie składni kodu (weryfikacja podczas indywidualnej rozmowy)
Cel: napisać skrypt analogiczne do zadania z Windows ale w systemie Linux używając skryptu uruchamianych w powłoce bash:

- skrypt ma przyjmować argumenty:
nazwa użytkownika1
nazwa grupy1
ścieżka do folderu1
ścieżka do pliku1
ścieżka do folderu2
ścieżka do pliku2
ścieżka do folderu3

- skrypt ma sprawdzać czy istnieją wszystkie wymagane parametry

- sprawdzać czy istnieje już użytkownik który ma być utworzony
- sprawdzać czy istnieje już grupa użytkowników która ma być utworzona

- sprawdzać czy istnieje folder na który ma stać się bieżącym folderem
- sprawdzać czy folder który ma stać się bieżącym folderem, pozwala na ustawienie go bieżącym

- sprawdzać czy istnieje plik do skopiowania
- sprawdzać czy istnieje docelowy folder do którego ma być skopiowany plik
- sprawdzać czy użytkownik ma uprawnienia do zapisu do docelowego folderu

- sprawdzać czy plik do skopiowania da się skopiować (da się otworzyć)

- sprawdzać czy plik do przeniesienia istnieje
- sprawdzać czy plik da się przenieść (uprawnienia do pliku, do folderu nadrzędnego źródłowego i docelowego)

- sprawdzać czy plik do usunięcia istnieje
- sprawdzać czy plik do usunięcia da się usunąć

- utworzyć użytkownika (nazwa w parametrze 1)
- utworzyć grupę (nazwa w parametrze 2)
- przydzielić użytkownika do grupy (dotyczy tych wskazanych parametrami 1 i 2)
- zmienić folder bieżący na wskazany parametrem 3
- wyświetlić drzewo folderów (tylko folderów, bez folderów ukrytych)
- skopiować plik wskazany parametrem 4 do folderu wskazanego parametrem 5
- przenieść plik wskazany parametrem 6 do folderu wskazanego parametrem 7
- zmienić uprawnienia do obydwu docelowych plików tak aby tylko właściciel mógł go otwierać i zapisywać – dodatkowe wymaganie: uprawnienia mają być podane jako liczba ósemkowa
- uruchomisz w tle proces (np. vi lub vim) i zapamiętasz w zmiennej identyfikator jego procesu
- zatrzymasz dopiero co uruchomiony proces wskazując na jego PID

Skrypt powinien zawierać w pierwszej linii odpowiednio sformatowane wskazanie na powłokę z którą powinien się uruchomić

Skrypt powinien zawierać komentarze wskazujące który z powyższych kroków jest aktualnie wykonywany

Skrypt powinien strumieniować komunikaty wskazujące wykryte nieprawidłowości, komunikaty o błędach powinny być strumieniowane do standardowego strumienia błędów

Skrypt powinien zwracać kod sukcesu tylko jeśli wszystkie sprawdzania okazały się pomyślne i wszystkie wykonane wyznaczone zadania także zakończyły się pomyślnie.