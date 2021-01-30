for run in {1..50}
do
  NUMBER=$(jot -r 1  1 35)
  RAND=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
  RANDNAMEROTATE=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
  convert +noise Gaussian -evaluate add "${NUMBER}%" etam.png "data/train/etam/${RAND}.png"
  convert etam.png -rotate ${NUMBER} data/train/etam/${RANDNAMEROTATE}.png
done