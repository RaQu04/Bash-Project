if cut -d: -f1 /etc/passwd | grep "$1" > /dev/null ; then
  echo "użytkownik \"$1\" znajduje się w katalogu"
else
  echo "brak użytkownika w katalogu"
  useradd $1
fi