#!/bin/bash 
#Autor: Łukasz Rakowiecki lukasz.rakowiecki@icloud.com
#Skrypt przyjmuje następujące parametry: 
# 1. Nazwa nowo tworzonego uzytkownika (parametr nr 1)
# 2. Tworzy nową grupę (parametr nr 2)
# 3. Ściezka do folderu 1
# 4. Ściezka do pliku 1
# 5. Ściezka do folderu 2
# 6. Ściezka do pliku 2
# 7. Sciezka do folderu 3 
#Opis skrytpu: 
# - utworzyć użytkownika (nazwa w parametrze 1)
# - utworzyć grupę (nazwa w parametrze 2)
# - przydzielić użytkownika do grupy (dotyczy tych wskazanych parametrami 1 i 2)
# - zmienić folder bieżący na wskazany parametrem 3
# - wyświetlić drzewo folderów (tylko folderów, bez folderów ukrytych)
# - skopiować plik wskazany parametrem 4 do folderu wskazanego parametrem 5
# - przenieść plik wskazany parametrem 6 do folderu wskazanego parametrem 7
# - zmienić uprawnienia do obydwu docelowych plików tak aby tylko właściciel mógł go otwierać i zapisywać – dodatkowe wymaganie: uprawnienia mają być podane jako liczba ósemkowa
# - uruchomisz w tle proces (np. vi lub vim) i zapamiętasz w zmiennej identyfikator jego procesu
# - zatrzymasz dopiero co uruchomiony proces wskazując na jego PID

#Tworzę zmienną, która na koniec poinfomuje czy proces zakończony jest powodzeniem 
success=0


#Sprawdzenie czy wszystkie parametry zostały uzuepełnione 
#echo ilosc argumentow $#
if [ $# -ne 7 ]
    then 
    date >> $3/info.log
    echo Błędna ilość argumentów >> $3/info.log
    echo Błąd. 
    success=1
    exit
fi 

# - utworzyć użytkownika (nazwa w parametrze 1)
#Dodawanie usera - parametr 1 #porownujemy do numeru bledu 
#useradd $1
# if [ $? -ne 0 ] 
#     then 
#     date >> $3/info.log
#     echo Uwaga, podany user istnieje >> $3/info.log
#     success=1
# fi

#Nowe rozwiązanie problemu sprawdzania czy podany user istnieje 
#https://4programmers.net/Forum/Inne/254440-bash_
if cut -d: -f1 /etc/passwd | grep "$1" > /dev/null ; then
  date >> $3/info.log
  echo "User \"$1\" juz istnieje" >> $3/info.log
  echo Błąd. 
  exit
else
useradd $1
date >> $3/info.log
echo "User dodany poprawnie" >> $3/info.log
fi


# - utworzyć grupę (nazwa w parametrze 2)
#Dodanie grupy - parametr 2 
# addgroup $2
# if [ $? -ne 0 ] 
#     then
#     date >> $3/info.log
#     echo Uwaga, podana grupa istnieje >> $3/info.log
#     success=1
# fi


if cut -d: -f1 /etc/group | grep "$2" > /dev/null ; then
date >> $3/info.log
echo "Grupa \"$2\" juz istnieje" >> $3/info.log
echo Błąd. 
exit
else
addgroup $2
date >> $3/info.log
echo "Grupa dodana poprawnie" >> $3/info.log
fi


# - przydzielić użytkownika do grupy (dotyczy tych wskazanych parametrami 1 i 2)
#Dodawanie usera do grupy
usermod -G $2 -a $1 
#echo Kod błędu $? 

#- sprawdzać czy istnieje folder na który ma stać się bieżącym folderem
if [ -d $3 ];
    then 
    date >> $3/info.log
    echo $3 istnieje >> $3/info.log
else
    date >> info.log
    echo $3 nie istnieje >> info.log
    success=1
    echo Błąd. 
    exit
fi


#- sprawdzać czy folder który ma stać się bieżącym folderem, pozwala na ustawienie go bieżącym

if [ -r $3 ]; 
    then
    date >> $3/info.log
    echo katalog z uprawnieniem aby stać się biezacym >> $3/info.log
    cd $3
else 
    data >> info.log
    echo Katalog nie moze stac sie biezacym >> info.log
    echo Błąd.
    exit
fi




#- sprawdzać czy istnieje plik do skopiowania
if [ -e $4 ]
    then 
    date >> info.log    
    echo plik $4 istnieje >> info.log
else 
    echo 
    date >> info.log
    plik $4 nie istnieje >> info.log
    success=1
    echo Błąd. 
    exit
fi 

#- sprawdzać czy istnieje docelowy folder do którego ma być skopiowany plik
if [ -d $5 ]
    then 
    date >> info.log
    echo katalog do skopiowania istnieje >> info.log
else
    echo 
    date >> info.log
    katalog do skopiowania nie istnieje >> info.log
    success=1
    echo Błąd. 
    exit
fi

if [ -w $5 ]
    then 
    date >> info.log
    echo user has write >> info.log
else 
    date >> info.log
    echo user has not write >> info.log
    success=1
    echo Błąd. 
    exit
fi 

if [ -w $7 ]
    then 
    date >> info.log
    echo user has write >> info.log
else 
    date >> info.log
    echo user has not write >> info.log
    success=1
    echo Błąd. 
    exit
fi 

#- sprawdzać czy użytkownik ma uprawnienia do zapisu do docelowego folderu
#TODO 

#- sprawdzać czy plik do skopiowania da się skopiować (da się otworzyć)
#TODO

#- sprawdzać czy plik do przeniesienia istnieje
#TODO
if [ -e $6 ]
    then 
    date >> info.log
    echo $6 istnieje >> info.log
else 
    echo 
    date >> info.log
    $6 nie istnieje >> info.log
    exit
fi 

#- sprawdzać czy plik da się przenieść (uprawnienia do pliku, do folderu nadrzędnego źródłowego i docelowego)
#TODO


#- zmienić folder bieżący na wskazany parametrem 3

# - wyświetlić drzewo folderów (tylko folderów, bez folderów ukrytych)
tree -d

# - skopiować plik wskazany parametrem 4 do folderu wskazanego parametrem 5
cp $4 $5

# - przenieść plik wskazany parametrem 6 do folderu wskazanego parametrem 7
mv $6 $7


# - zmienić uprawnienia do obydwu docelowych plików tak aby tylko właściciel mógł go otwierać i zapisywać – dodatkowe wymaganie: uprawnienia mają być podane jako liczba ósemkowa
cd $7
chmod 700 $6

cd ..

cd $5
chmod 700 $4


# - uruchomisz w tle proces (np. vi lub vim) i zapamiętasz w zmiennej identyfikator jego procesu

vim &
# proces_ID=$(pidof vim)

#  echo proces_ID = $proces_ID >> ../info.log
#pidof vim #sprawdzenie 
#ps aux
# - zatrzymasz dopiero co uruchomiony proces wskazując na jego PID
# kill -9 $proces_ID

#Poprawiona wersja z pominięciem pidof

nowy_proces_ID=$!
echo nowy_proces_ID = $nowy_proces_ID >> ../info.log
kill -9 $nowy_proces_ID

# echo $proces_ID

if [ $success -eq 0 ]
    then echo Skrypt zakończony sukcesem
else
    echo Skrypt zakończonyn niepowodzeniem
fi 

#13. Standardowy strumienia błędów 



#14. Zwracanie kodu powrotu (exit code) - brak 
date >> ../info.log
echo Exit code = $? >> ../info.log;
echo Exit code = $? 


# echo Nazwa usera $1
# echo Grupa  $2
# echo Ściezka do folderu 1 $3 #folder do zmiany na aktualny
# echo Ściezka do pliku 1 $4 #plik do skopiowania
# echo Ściezka do folder 2 $5 #folder do skopiowania pliku
# echo Sciezka do plik 2 $6 #plik do przeniesienia
# echo Sciezka do folderu 3 $7 #folder do przeniesienia

