for a in ./ulauncher/*.json; do 
  file=${a#./ulauncher/*}; 
  echo $file; 
done
