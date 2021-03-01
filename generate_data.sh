#Declare the list of admins.
declare -a StringArray=("2rec" "blueshade" "Costanza" "ederenn" "etam" "jamuszyn" "kazsperkowalski" "kuba" "maaktweluit" "Marcin" "mateusz" "Matt80" "MBarwicki" "mf" "mp" "nieznanysprawiciel" "OlaM" "Phillip" "pnowosie" "rad9k" )

# Create training folders if they don't already exist.
for admin in ${StringArray[@]}; do
  mkdir -p "data/train/admin"
  mkdir -p "data/test/admin"
done

# Modify integers below to decide how many images to generate in the training folders.
for run in {1..500}; do

  for admin in ${StringArray[@]}; do
    NUMBER=$(jot -r 1 1 35)
    ROTATE=$(jot -r 1 -35 35)
    RAND=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
    RANDNAMEROTATE=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
    convert admin_images/${admin}.png -rotate ${ROTATE} data/train/admin/${RANDNAMEROTATE}.png && convert +noise Gaussian -evaluate add "${NUMBER}%" data/train/admin/${RANDNAMEROTATE}.png "data/train/admin/${RANDNAMEROTATE}.png"
  done
done

# Modify integers below to decide how many images to generate in the test folders.
for run in {1..100}; do

  for admin in ${StringArray[@]}; do
    NUMBER=$(jot -r 1 1 35)
    ROTATE=$(jot -r 1 -35 35)
    RAND=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
    RANDNAMEROTATE=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
    convert admin_images/${admin}.png -rotate ${ROTATE} data/test/admin/${RANDNAMEROTATE}.png && convert +noise Gaussian -evaluate add "${NUMBER}%" data/test/admin/${RANDNAMEROTATE}.png "data/test/admin/${RANDNAMEROTATE}.png"
  done
done

# create_files()
# {
# yourfilenames=$(ls data/train/not_admin/*)
# for eachfile in $yourfilenames; do
#             NUMBER=$(jot -r 1 1 35)
#             ROTATE=$(jot -r 1 -35 35)
#             RAND=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
#             RANDNAMEROTATE=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
#             convert ${eachfile} -rotate ${ROTATE} data/test/not_admin/${RANDNAMEROTATE}.png && convert +noise Gaussian -evaluate add "${NUMBER}%" data/test/not_admin/${RANDNAMEROTATE}.png "data/test/not_admin/${RANDNAMEROTATE}.png"
# done
# }

# for run in {1..100}; do
#     create_files
#     done