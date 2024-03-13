while true; do
  echo "menu"
  echo "1 . create 5 new file"
  echo "2 . add hello world to files"
  echo "3 . replace 'word' with 'bash' in files"
  read -p " please choose between numbers : " choice

  case $choice in
  1)
    for i in {1..5}; do
      touch file$i.txt
    done
    echo "five file.txt created  ."
    ;;
  2)
    echo "Hello World" >temp.txt
    for i in {1..5}; do
      cp temp.txt file$i.txt
    done
    rm temp.txt
    echo "'Hello World' added"
    ;;
  3)
    sed -i 's/world/bash/g' file*.txt
    echo "replace 'word' with 'bash' in files is done !"
    ;;
  *)
    echo "You'r choice is not in menu du!"
    ;;
  esac
done
