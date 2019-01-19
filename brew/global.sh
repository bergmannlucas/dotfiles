source common/functions.sh

# homebrew
if which brew &> /dev/null; then
  msg_checking "homebrew"
else
  msg_install "Homebrew" "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ok "OK"
fi

# yarn
if which yarn &> /dev/null; then
  msg_checking "yarn"
else
  msg_install "yarn" "brew install yarn --without-node" # since i use nvm i set the --without-node flag
  brew install yarn --without-node
  msg_ok "OK"
fi

# nvm && install node 10.15
if which node &> /dev/null; then
  msg_checking "nvm"
else
  msg_install "nvm" "brew install nvm"
  brew install nvm
  msg_ok "NVM"
  mkdir ~/.nvm
  source ~/.zshrc
  nvm install 10.15
  msg_ok "NODE 10.15"
  source ~/.zshrc
  nvm use 10.15
fi

# mongo
if which mongod &> /dev/null; then
    msg_checking "mongodb"
else
    msg_install "mongodb" "brew install mongodb"
    brew install mongodb --with-openssl
    msg_ok "OK"
fi