DISCORD_ADMIN="mp"

for run in {1..50}
do
  NUMBER=$(jot -r 1  1 35)
  ROTATE=$(jot -r 1  -35 35)
  RAND=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
  RANDNAMEROTATE=$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)
  convert admin_images/${DISCORD_ADMIN}.png -rotate ${ROTATE} data/train/${DISCORD_ADMIN}/${RANDNAMEROTATE}.png && convert +noise Gaussian -evaluate add "${NUMBER}%" data/train/${DISCORD_ADMIN}/${RANDNAMEROTATE}.png "data/train/${DISCORD_ADMIN}/${RANDNAMEROTATE}.png"
done
