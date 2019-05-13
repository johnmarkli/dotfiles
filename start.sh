# set up new ssh key with github
ssh-keygen -t rsa -b 4096 -C "johnmarkli@gmail.com"
curl -u "johnmarkli" \
    --data "{\"title\":\"j-dev`date +%Y%m%d%H%M%S`\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" \
    https://api.github.com/user/keys

# Bootstrap dotfiles
cd ~
git clone git@github.com:johnmarkli/dotfiles.git
BACKUP_ALL=true ~/dotfiles/bootstrap.sh
