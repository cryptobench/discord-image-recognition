declare -a StringArray=("2rec" "blueshade" "costanza" "etam" "kuba" "mattias" "mp" "phillip")

for run in {1..50}; do

  for admin in ${StringArray[@]}; do
    NUMBER=$(jot -r 1 1 35)
    ROTATE=$(jot -r 1 -35 35)
    RAND=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
    RANDNAMEROTATE=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
    convert admin_images/${admin}.png -rotate ${ROTATE} data/train/${admin}/${RANDNAMEROTATE}.png && convert +noise Gaussian -evaluate add "${NUMBER}%" data/train/${admin}/${RANDNAMEROTATE}.png "data/train/${admin}/${RANDNAMEROTATE}.png"
  done
done
