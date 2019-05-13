# set up new ssh key with github
SSH_KEY_NAME=id_rsa
SSH_KEY_PATH=$HOME/.ssh/$SSH_KEY_NAME
ssh-keygen -t rsa -b 4096 -C "johnmarkli@gmail.com" -f $SSH_KEY_PATH
curl -u "johnmarkli" \
  --data "{\"title\":\"j-dev`date +%Y%m%d%H%M%S`\",\"key\":\"`cat $SSH_KEY_PATH.pub`\"}" \
  https://api.github.com/user/keys
ssh-add $SSH_KEY_PATH
sleep 3

# Bootstrap dotfiles
cd ~
git clone git@github.com:johnmarkli/dotfiles.git
[ -d dotfiles ] && BACKUP_ALL=true ~/dotfiles/bootstrap.sh
